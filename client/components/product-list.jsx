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
      .then(response => {
        return response.json();
      })
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
            return <ProductListItem key={item.productId} card={item} />;
          })
        }

      </div>
    );
  }
}

export default ProductList;
