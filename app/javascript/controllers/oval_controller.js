import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="oval"
export default class extends Controller {
  static targets = ["form", "container", "spinner"];

  connect() {
    console.log("Oval controller connected");
    console.log(this.buttonTarget);
  }

  // loading() {
  //   this.containerTarget.classList.add("hidden-content")
  //   this.spinnerTarget.classList.add("display-spinner")
  // }

}
