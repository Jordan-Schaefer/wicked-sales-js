import React from 'react';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {

  convertCash(num) {
    const str = num + '';
    let money = '';
    for (let i = 0; i < str.length; i++) {
      if (i === str.length - 2 && str.length >= 3) {
        money += '.';
      } else if (i === str.length - 5 && str.length >= 6) {
        money += ',';
      }
      money += str[i];
    }
    return money;
  }

  getTotal() {
    const eachItem = this.props.items;
    let price = 0;
    for (let i = 0; i < eachItem.length; i++) {
      price += eachItem[i].price;
    }
    return this.convertCash(price);
  }

  render() {
    if (this.props.items.empty || this.props.items.length === 0) {
      return (
        <>
          <div className='container'>
            <a onClick={() => this.props.view('catalog', {})} href="">&#60; Back to catalog</a>
            <h1>There are no items in your cart</h1>
          </div>
        </>
      );
    } else {
      return (
        <>
          <div className='container'>
            <a onClick={() => this.props.view('catalog', {})} href="">&#60; Back to catalog</a>
            <h4>My cart</h4>
          </div>
          <div className='container'>
            {
              this.props.items.map(item => {
                return <CartSummaryItem key={item.cartItemId} item={item} />;
              })
            }
          </div>
          <div className='container'>
            <button className='btn btn-success' onClick={() => this.props.view('checkout', {})}>Check out</button>
            <h2>Item total ${this.getTotal()}</h2>
          </div>
        </>
      );
    }

  }
}

export default CartSummary;
