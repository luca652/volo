import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hide" ]
  static classes =["display"]

  connect() {
    console.log("connected")
    this.hideTarget.classList.add(this.displayClass)
  }

  toggle(){
   this.hideTarget.classList.toggle("display-cards")}
}
