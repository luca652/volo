import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-show-menu"
export default class extends Controller {
  static targets = ["groupsButton", "eventsButton", "pinsButton", "groupsContent", "eventsContent", "pinsContent" ]

  activateMenu(event) {
    const menuButtons = [this.groupsButtonTarget, this.eventsButtonTarget, this.pinsButtonTarget]
    menuButtons.forEach(button => {
      if (button !== event.currentTarget) {
        button.classList.remove("active");
      }
      else {
        button.classList.add("active");
      }
    });
    this.loadContent(event.currentTarget.id)
  }

  loadContent(id) {
    const contentAreas = [this.groupsContentTarget, this.eventsContentTarget, this.pinsContentTarget]

    contentAreas.forEach(area => {
      if (area.id !== `${id}-content`) {
        area.classList.add("d-none");
      }
      else {
        area.classList.remove("d-none");
      }
    });
  }
}
