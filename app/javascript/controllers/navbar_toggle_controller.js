import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-toggle"
export default class extends Controller {

  static targets = ["burgerMenu", "userMenu"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  fireBurger() {
    console.log("Hello, Stimulus!")
    if (!this.userMenuTarget.classList.contains('d-none')) {
      this.userMenuTarget.classList.toggle('d-none');
    }
    this.burgerMenuTarget.classList.toggle('d-none');
  }

  fireUser() {
    console.log("Hello, Stimulus!")
    if (!this.burgerMenuTarget.classList.contains('d-none')) {
      this.burgerMenuTarget.classList.toggle('d-none');
    }
    this.userMenuTarget.classList.toggle('d-none');
  }
}
