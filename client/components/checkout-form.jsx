import React from 'react';

class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      shippingAddress: ''
    };
    this.handleForm = this.handleForm.bind(this);
  }

  handleForm(event) {
    const text = event.target.value;
    const input = event.target.id;
    const entry = {};

    switch (input) {
      case 'name':
        entry.name = text;
        break;
      case 'creditCard':
        entry.creditCard = text;
        break;
      case 'address':
        entry.shippingAddress = text;
        break;
      default:
        break;
    }
    this.setState(entry);
  }

  render() {
    return (
      <>

        <form
          className='container mt-3'
          onSubmit={() => this.props.placeOrder(this.state, event)}>
          <a onClick={() => this.props.view('catalog', {})} href="">&#60; Back to catalog</a>
          <div className='form-group'>
            <label htmlFor="name">Name</label>
            <input
              onChange={this.handleForm}
              id='name'
              value={this.state.name}
              type="text"
              name='name'
              placeholder='first name - last name'
              className='form-control'
              required/>
          </div>
          <div className='form-group'>
            <label htmlFor="creditCard">Credit Card Number</label>
            <input
              onChange={this.handleForm}
              id='creditCard'
              value={this.state.creditCard}
              type="text"
              name="creditCard"
              placeholder='card number'
              className='form-control'
              required/>
          </div>
          <div className='form-group'>
            <label htmlFor="address">Address</label>
            <textarea
              onChange={this.handleForm}
              id='address'
              value={this.state.address}
              name="address"
              cols="20"
              rows="10"
              placeholder='address'
              className='form-control'
              required></textarea>
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
