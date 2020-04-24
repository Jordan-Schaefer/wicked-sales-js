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
  parseInt(productId);

  if (productId <= 0) {
    return res.status(404).json({ error: 'productId must be a positive integer' });
  }

  const sql = `
  select *
    from "products"
   where "productId" = $1
  `;
  const values = [`${productId}`];

  db.query(sql, values)
    .then(response => {
      if (!response.rows[0]) {
        res.status(404).json({ error: `cannot find productId of ${productId}` });
      }
      res.status(200).json(response.rows[0]);
    })
    .catch(err => next(err));

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
