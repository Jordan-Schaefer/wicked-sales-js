import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';

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
    this.placeOrder = this.placeOrder.bind(this);
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
        const cartItems = this.state.cart;
        const items = [...cartItems];
        items.push(item);
        this.setState({ cart: items });
      })
      .catch(err => console.error(err))
      .finally(() => this.setView('catalog', {}));
  }

  placeOrder(order, event) {
    event.preventDefault();
    const params = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(order)
    };
    fetch('/api/orders', params)
      .then(res => res.json())
      .catch(err => console.error(err));
    this.setState({
      cart: []
    });
    this.setView('catalog', {});
  }

  render() {
    const itemCount = this.state.cart.length;
    if (this.state.view.name === 'catalog') {
      return (
        <>
          <Header
            view={this.setView}
            cart={itemCount}/>
          <ProductList
            view={this.setView} />
        </>
      );
    } else if (this.state.view.name === 'details') {
      return (
        <>
          <Header
            view={this.setView}
            cart={itemCount}/>
          <ProductDetails
            view={this.setView}
            params={this.state.view.params}
            addToCart={this.addToCart}/>
        </>
      );
    } else if (this.state.view.name === 'cart') {
      return (
        <>
          <Header
            view={this.setView}
            cart={itemCount} />
          <CartSummary
            items={this.state.cart}
            view={this.setView} />
        </>
      );
    } else if (this.state.view.name === 'checkout') {
      return (
        <>
          <Header
            view={this.setView}
            cart={itemCount}/>
          <CheckoutForm
            placeOrder={this.placeOrder}
            view={this.setView}/>
        </>

      );
    }
  }
}
