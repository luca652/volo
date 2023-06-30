import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="group-request"
export default class extends Controller {
  static targets = ["container"]

  connect() {  console.log("group-request connected")
  }

  hideContainer(event) {
    event.preventDefault()
    this.containerTarget.classList.add("hidden")
  }
}
