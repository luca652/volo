import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["event-card-container"];

  connect() {
    this.hideCard();
  }

  toggleCard() {
    this.cardTarget.classList.toggle("hidden");
  }

  hideCard(event) {
    this.cardTarget.classList.add("hidden");
  }
}
