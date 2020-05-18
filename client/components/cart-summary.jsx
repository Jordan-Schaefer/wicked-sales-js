import React from 'react';
import Header from './header';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {

  convertCash(num) {
    const str = num + '';
    let money = '';
    for (let i = 0; i < str.length; i++) {
      if (i === str.length - 2) {
        money += '.';
      } else if (i === str.length - 5) {
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
    if (this.props.items.empty) {
      return (
        <>
          <Header />
          <div className='container'>
            <a onClick={() => this.props.view('catalog', {})} href="">&#60; Bact to catalog</a>
            <h4>My cart</h4>
          </div>
          <h1>There are no items in your cart</h1>
        </>
      );
    } else {
      return (
        <>
          <Header />
          <div className='container'>
            <a onClick={() => this.props.view('catalog', {})} href="">&#60; Bact to catalog</a>
            <h4>My cart</h4>
          </div>
          {
            this.props.items.map(item => {
              return <CartSummaryItem key={item.cartItemId} item={item} />;
            })
          }
          <h2 className='container'>Item total ${this.getTotal()}</h2>
        </>
      );
    }

  }
}

export default CartSummary;
