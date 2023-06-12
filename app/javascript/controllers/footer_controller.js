import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="footer"
export default class extends Controller {
  connect() {
    const currentPage = window.location.pathname;
    const regex = /^\/groups\/(\d+$)/;

    if (regex.test(currentPage)) {
      const match = regex.exec(currentPage);
      const newLink = document.createElement('a');
      const newI = document.createElement('i');
      newI.classList.add('fa-regular', 'fa-comment');
      newLink.appendChild(newI);
      newLink.classList.add("footer-item");
      newLink.href = '/groups/' + match[1] + '/chatrooms/' + match[1];
      newLink.target = '_blank';

      const footerLinks = document.querySelector('.footer-links');
      footerLinks.appendChild(newLink);
    }
  }
}
