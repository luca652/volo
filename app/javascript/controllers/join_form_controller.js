import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="join-form"
export default class extends Controller {
  static targets = ["form", "applyButton"];

  connect() {
  }

  submit(event) {
    event.preventDefault(); // Prevent default form submission

    const form = event.target.closest("form");
    const pendingApproval = document.createElement("p");
    pendingApproval.textContent = "Pending approval";
    form.parentNode.appendChild(pendingApproval);

    const applyButton = event.target;
    applyButton.style.display = "none";

    const url = form.action;
    const method = form.method;
    const formData = new FormData(form);

    fetch(url, {
      method: method,
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle success response
      })
      .catch((error) => {
        // Handle error response
      });
  }
}
