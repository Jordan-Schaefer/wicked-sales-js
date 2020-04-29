import React from 'react';
import Header from './header';

class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
  }

  render() {
    return (
      <>
        <Header />
        <form action="" className='container'>
          <label htmlFor="name">Name</label>
          <input type="text" name='name' placeholder='Name'/>
          <label htmlFor="creditCard">Credit Card Number</label>
          <input type="text" name="creditCard" placeholder='card number'/>
          <label htmlFor="address">Address</label>
          <textarea name="address" cols="30" rows="10" placeholder='address'></textarea>
        </form>
      </>
    );
  }
}

export default CheckoutForm;
