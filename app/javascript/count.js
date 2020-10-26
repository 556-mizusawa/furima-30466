function count() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("keyup", ()  => {
    const totalPrice = itemPrice.value;
    totalPrice.innerHTML
    addTaxPrice.innerHTML = Math.floor(totalPrice * 0.1);
    profit.innerHTML = Math.floor(totalPrice * 0.9);
  });
}

addEventListener("keydown", count);

