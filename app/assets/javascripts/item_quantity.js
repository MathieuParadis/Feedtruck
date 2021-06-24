var plusBtn = document.getElementById('plus-btn');
var minusBtn = document.getElementById('minus-btn');
var quantityField = document.getElementById('quantity')

plusBtn.addEventListener('click', () =>{
  previousValue = quantityField.value
  quantityField.value = parseInt(previousValue) + 1
});

minusBtn.addEventListener('click', () =>{
  previousValue = quantityField.value
  quantityField.value = parseInt(previousValue) - 1
});