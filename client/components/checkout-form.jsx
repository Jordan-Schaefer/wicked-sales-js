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
        <form action="" className='container mt-4'>
          <div className='form-group'>
            <label htmlFor="name">Name</label>
            <input type="text"
              name='name'
              placeholder='first name - last name'
              className='form-control'/>
          </div>
          <div className='form-group'>
            <label htmlFor="creditCard">Credit Card Number</label>
            <input type="text"
              name="creditCard"
              placeholder='card number'
              className='form-control'/>
          </div>
          <div className='form-group'>
            <label htmlFor="address">Address</label>
            <textarea name="address"
              cols="20"
              rows="10"
              placeholder='address'
              className='form-control'></textarea>
          </div>
          <div>
            <button className='btn btn-success'>Submit</button>
          </div>
        </form>
      </>
    );
  }
}

export default CheckoutForm;
