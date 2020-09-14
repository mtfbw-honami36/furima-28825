window.addEventListener('load', function(){
  const Price = document.getElementById("item-price");
  Price.addEventListener('input', function(){
    const Price = document.getElementById("item-price").value;
    taxPrice = Price * 0.1;
    document.getElementById('add-tax-price').innerHTML = taxPrice;

    Profit = Price - taxPrice;
    document.getElementById('profit').innerHTML = Profit;
  });
})