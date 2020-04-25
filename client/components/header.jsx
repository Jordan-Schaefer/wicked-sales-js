import React from 'react';

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { cart: this.props.cart };
  }

  render() {
    return (
      <div className='d-flex justify-content-around align-items-center header'>
        <div className='d-flex align-items-center'>
          <i className="fas fa-dollar-sign text-white"></i>
          <h3 className='head'>Wicked Sales</h3>
        </div>
        <div className='d-flex'>
          <h6 className='text-white'>{this.props.cart} items </h6>
          <i className="fas fa-shopping-cart text-white"></i>
        </div>
      </div>
    );
  }
}

export default Header;
