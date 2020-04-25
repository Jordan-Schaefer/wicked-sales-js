import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      message: null,
      isLoading: true,
      view: {
        name: 'catalog',
        params: {}
      },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
  }

  componentDidMount() {
    this.getCartItems();
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(items => this.setState({ cart: items }))
      .catch(err => console.error(err));
  }

  addToCart(product) {
    fetch(`/api/cart/${product}`, { method: 'POST' })
      .then(res => res.json())
      .then(item => {
        const cartItems = this.state.cart.slice();
        cartItems.push(item);
        this.setState({ cart: cartItems });
      })
      .catch(err => console.error(err));
  }

  render() {
    const itemCount = this.state.cart.length;
    if (this.state.view.name === 'catalog') {
      return (
        <>
          <Header cart={itemCount}/>
          <ProductList view={this.setView} />
        </>
      );
    } else if (this.state.view.name === 'details') {
      return (
        <>
          <Header cart={itemCount}/>
          <ProductDetails
            view={this.setView}
            params={this.state.view.params}
            addToCart={this.addToCart}/>
        </>
      );
    }

  }
}
