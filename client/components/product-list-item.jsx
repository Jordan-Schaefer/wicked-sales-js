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
    <div className='card card-size on-hover grow'>
      <img className='card-img-top img-size' src={props.card.image} alt={props.card.name} />
      <div className='card-body'>
        <h5 className='card-title'>{props.card.name}</h5>
        <h6 className='card-subtitle mb-3 text-muted'>${convertCash(cost)}</h6>
        <p className='card-text'>{props.card.shortDescription}</p>
      </div>

    </div>
  );
}

export default ProductListItem;
