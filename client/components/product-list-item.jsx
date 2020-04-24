import React from 'react';

function convertCash(num) {
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

function ProductListItem(props) {
  const cost = props.card.price;
  return (
    <>

      <div className='img-container'>
        <img className='img-fluid' src={props.card.image} alt={props.card.name} />
      </div>

      <h4 className='card-title'>{props.card.name}</h4>
      <h5 className='card-body'>${convertCash(cost)}</h5>
      <p className='card-text'>{props.card.shortDescription}</p>
    </>
  );
}

export default ProductListItem;
