require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {
  const sql = `
  select "productId",
         "name",
         "price",
         "image",
         "shortDescription"
    from "products"
  `;
  db.query(sql)
    .then(response => {
      res.status(200).json(response.rows);
    })
    .catch(err => {
      console.error(err);
      res.status(500).json({ error: 'an error hs occurred' });
    });

});

app.get('/api/products/:productId', (req, res, next) => {
  const { productId } = req.params;
  const productNum = parseInt(productId);
  const values = [`${productNum}`];
  const sql = `
  select *
    from "products"
   where "productId" = $1
  `;

  if (productNum <= 0) {
    return res.status(404).json({ error: 'productId must be a positive integer' });
  }

  db.query(sql, values)
    .then(response => {
      if (!response.rows[0]) {
        return res.status(404).json({ error: `cannot find productId of ${productNum}` });
      }
      res.status(200).json(response.rows[0]);
    })
    .catch(err => next(err));
});

app.get('/api/cart', (req, res, next) => {
  const sql = `
  select "c"."cartItemId",
       "c"."price",
       "p"."productId",
       "p"."image",
       "p"."name",
       "p"."shortDescription"
  from "cartItems" as "c"
  join "products" as "p" using ("productId")
 where "c"."cartId" = $1
  `;
  const value = [`${req.session.cartId}`];
  if (req.session.cartId) {
    db.query(sql, value)
      .then(response => {
        res.status(200).json(response.rows);
      })
      .catch(err => next(err));
  } else {
    res.status(200).json({ empty: [] });
  }
});

app.post('/api/cart/:productId', (req, res, next) => {
  const { productId } = req.params;
  const sqlInsert = `
  insert into "carts" ("cartId", "createdAt")
  values (default, default)
  returning "cartId"
  `;
  const sql = `
  select "products"."price"
    from "products"
   where "productId" = $1
  `;
  const values = [`${productId}`];

  if (productId <= 0) {
    return res.status(400).json({ error: 'productId must be a positive integer' });
  }
  db.query(sql, values)
    .then(response => {

      if (!response.rows[0]) {
        throw new ClientError('must create an account', 400);
      } else if (req.session.cartId) {
        return {
          cartId: req.session.cartId,
          price: response.rows[0].price
        };
      } else {
        return db.query(sqlInsert)
          .then(id => {
            return {
              cartId: id.rows[0].cartId,
              price: response.rows[0].price
            };
          })
          .catch(err => next(err));
      }
    })
    .then(newId => {
      req.session.cartId = newId.cartId;
      const sqlCartItemId = `
      insert into "cartItems" ("cartId", "productId", "price")
      values ($1, $2, $3)
      returning "cartItemId"
      `;
      const cartValues = [`${newId.cartId}`, `${productId}`, `${newId.price}`];
      return db.query(sqlCartItemId, cartValues)
        .then(response => response);
    })
    .then(data => {
      const selectItems = `
      select "c"."cartItemId",
             "c"."price",
             "p"."productId",
             "p"."image",
             "p"."name",
             "p"."shortDescription"
        from "cartItems" as "c"
        join "products" as "p" using ("productId")
       where "c"."cartItemId" = $1
      `;
      const newCartItemId = [`${data.rows[0].cartItemId}`];
      return db.query(selectItems, newCartItemId)
        .then(info => {
          res.status(201).json(info.rows[0]);
        })
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

app.post('/api/orders', (req, res, next) => {
  const { name, creditCard, shippingAddress } = req.body;
  if (!req.session.cartId) {
    return res.status(400).json({ error: 'must have cart id' });
  } else if (!name || !creditCard || !shippingAddress) {
    return res.status(400).json({ error: 'name creditCard and shippingAddress are required fields' });
  } else {
    const sql = `
    insert into "orders" ("cartId", "name", "creditCard", "shippingAddress")
    values ($1, $2, $3, $4)
    returning "orderId", "createdAt", "name", "creditCard", "shippingAddress";
    `;
    const values = [`${req.session.cartId}`, `${name}`, `${creditCard}`, `${shippingAddress}`];

    db.query(sql, values)
      .then(response => {

        if (!response.rows) {
          next(response);
        } else {
          res.status(201).json(response.rows[0]);
          delete req.session.cartId;
        }
      });
  }
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
