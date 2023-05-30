window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     const taxRate = 0.1;
    const taxPrice = Math.floor(inputValue * taxRate);
    addTaxDom.innerHTML = taxPrice;
    const profitDom = document.getElementById("profit");
    const profit = inputValue - taxPrice;
    profitDom.innerHTML = profit;
  })
});

