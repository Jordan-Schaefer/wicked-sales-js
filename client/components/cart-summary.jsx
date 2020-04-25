import React from 'react';
import Header from './header';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {

  render() {
    return (
      <>
        <Header />
        <div className='container'>
          <a onClick={() => this.props.view('catalog', {})} href="">&#60; Bact to catalog</a>
          <h4>My cart</h4>
        </div>
        {
          this.props.items.map(item => {
            return <CartSummaryItem key={item.cartItemId} item={item}/>;
          })
        }
      </>
    );
  }
}

export default CartSummary;
