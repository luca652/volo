// resources.js


document.addEventListener("DOMContentLoaded", function() {
  // Select the element with the class 'card-title'
  var cardTitles = document.querySelectorAll('.card-title');

  // Loop through each card title and modify its text
  cardTitles.forEach(function(title) {
    title.textContent = "Updated Title";
  });

  
document.addEventListener("DOMContentLoaded", () => {
  const categoryFilter = document.getElementById("category-filter");
  const sortButton = document.getElementById("sort-button");
  const cardContainer = document.querySelector(".card-container");

  categoryFilter.addEventListener("change", () => {
    filterCardsByCategory(categoryFilter.value);
  });

  sortButton.addEventListener("click", () => {
    sortCardsAlphabetically();
  });

  function filterCardsByCategory(category) {
    const cards = cardContainer.querySelectorAll(".card");

    cards.forEach((card) => {
      const cardCategory = card.querySelector(".card-text").textContent;
      if (category === "" || cardCategory === category) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  }

  function sortCardsAlphabetically() {
    const cards = Array.from(cardContainer.querySelectorAll(".card"));

    cards.sort((a, b) => {
      const titleA = a.querySelector(".card-title").textContent.toUpperCase();
      const titleB = b.querySelector(".card-title").textContent.toUpperCase();
      return titleA.localeCompare(titleB);
    });

    cards.forEach((card) => {
      cardContainer.appendChild(card);
    });
  }
});
