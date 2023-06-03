// resources.js

document.addEventListener("DOMContentLoaded", function() {
  // Select the element with the class 'card-title'
  var cardTitles = document.querySelectorAll('.card-title');

  // Loop through each card title and modify its text
  cardTitles.forEach(function(title) {
    title.textContent = "Updated Title";
  });
});
