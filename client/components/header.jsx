import React from 'react';

class Header extends React.Component {

  render() {
    let item = 'items';
    if (this.props.cart === 1) {
      item = 'item';
    }
    return (
      <div className='d-flex justify-content-around align-items-center header p-2'>
        <div className='d-flex align-items-center'>
          <i className="fas fa-dollar-sign text-white mr-2"></i>
          <h3 className='head'>Wicked Sales</h3>
        </div>
        <div className='d-flex cart mt-1' onClick={() => this.props.view('cart', {})}>
          <h6 className='text-white mr-1'>{this.props.cart} {item} </h6>
          <i className="fas fa-shopping-cart text-white"></i>
        </div>
      </div>
    );
  }
}

export default Header;
