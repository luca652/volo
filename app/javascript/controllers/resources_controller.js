import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "resources World!"
    console.log("Resources is working")
  }
}
