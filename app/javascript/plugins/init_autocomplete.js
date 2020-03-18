import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
