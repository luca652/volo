import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "display" ]
  static classes =["hide"]

  connect() {
    console.log("connected")
  }

  toggle(){
  this.displayTarget.classList.toggle(this.hideClass);

  const button = this.element.querySelector(".button-request-less");

    if (this.displayTarget.classList.contains(this.hideClass)) {
      button.textContent = "more";
    } else {
      button.textContent = "less";
    }
  }
}
