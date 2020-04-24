import React from 'react';

class Header extends React.Component {
  render() {
    return (
      <div className='d-flex justify-content-center align-items-center header'>
        <i className="fas fa-dollar-sign text-white"></i>
        <h3 className='head'>Wicked Sales</h3>
      </div>
    );
  }
}

export default Header;
