import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = { product: null };
  }

  componentDidMount() {
    this.getDetails();
  }

  getDetails() {
    fetch(`/api/products/${this.props.params}`)
      .then(res => res.json())
      .then(data => {
        this.setState({ product: data });
      })
      .catch(err => {
        console.error(err);
      });
  }

  convertCash(num) {
    const str = num + '';
    let money = '';
    for (let i = 0; i < str.length; i++) {
      if (i === str.length - 2) {
        money += '.';
      }
      money += str[i];
    }
    return money;
  }

  render() {
    const items = this.state.product;
    if (!items) {
      return items;
    } else {
      return (
        <>
          <div className='container card mt-3'>
            <a onClick={() => this.props.view('catalog', {})}
              className='my-2 on-hover'>&#60; Back to catalog</a>
            <div className='d-flex mb-3'>
              <div>
                <img
                  className='img-fluid card-img'
                  src={items.image}
                  alt={items.name} />
              </div>
              <div className='m-3'>
                <h1>{items.name}</h1>
                <h5>${this.convertCash(items.price)}</h5>
                <h5>{items.shortDescription}</h5>
                <button onClick={() => this.props.addToCart(items.productId)}
                  className='btn btn-primary'>
                  Add to Cart
                </button>
              </div>
            </div>
            <p>{items.longDescription}</p>
          </div>
        </>
      );
    }
  }
}

export default ProductDetails;
