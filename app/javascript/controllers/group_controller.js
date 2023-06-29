import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="group"
export default class extends Controller {
  static targets = ["container"]

  connect() { console.log("group_controller connected")
  }

  hideContainer(event) {
    event.preventDefault()
    this.containerTarget.classList.add("hidden")
  }
}
