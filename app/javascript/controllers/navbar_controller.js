import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"]
  connect() {
  }

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  }

  toggleNavbarColor(event) {
    event.preventDefault()
    if (this.element.classList.contains("black")) {
      this.navbarTarget.classList.remove("black")
      console.log("navbar class black removed")
    } else {
      this.navbarTarget.classList.add("black")
      console.log("navbar class black added")
    }
  }
}
