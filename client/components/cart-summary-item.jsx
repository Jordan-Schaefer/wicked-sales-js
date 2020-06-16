import React from 'react';

class CartSummaryItem extends React.Component {

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
    return (
      <>
        <div>
          <div key={this.props.item.cartItemId} className='card d-flex flex-column align-items-center m-3'>
            <div className=''>
              <img src={this.props.item.image} alt={this.props.item.name} className='img-thumbnail img-thumb'/>
            </div>
            <div className='m-2'>
              <h4>{this.props.item.name}</h4>
              <h5>${this.convertCash(this.props.item.price)}</h5>
              <p>{this.props.item.shortDescription}</p>
            </div>
          </div>
        </div>
      </>
    );
  }
}

export default CartSummaryItem;
