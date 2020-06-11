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
      <main className='py-5'>
        <div className='container'>
          <div className='row'>
            {
              this.state.products.map(item => {
                return (
                  <div
                    onClick={() => this.props.view('details', item.productId)}
                    key={item.productId}
                    className='col-12 col-md-6 col-lg-4 mb-4'>
                    <ProductListItem card={item} />
                  </div>
                );
              })
            }
          </div>
        </div>
      </main>

    );
  }
}

export default ProductList;
