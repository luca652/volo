import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "display" ]
  static classes =["hide"]

  connect() {
    console.log("connected")
    // this.displayTarget.classList.add(this.hideClass)
  }

  toggle(){
  //  this.hideClass.classList.toggle("display-cards")
  this.displayTarget.classList.toggle(this.hideClass);
  }
}
