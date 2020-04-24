import React from 'react';
import ProductListItem from './product-list-item';

class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { products: [] };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(response => response.json())
      .then(data => {
        this.setState({ products: data });
      })
      .catch(err => console.error(err));
  }

  render() {
    return (
      <div className='container d-flex flex-wrap justify-content-between'>
        {
          this.state.products.map(item => {
            return (
              <div
                onClick={() => this.props.view('details', item.productId)}
                key={item.productId} className='card col-lg card-width align-itmes-end'>
                <ProductListItem card={item} />
              </div>
            );
          })
        }
      </div>
    );
  }
}

export default ProductList;
