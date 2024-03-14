import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="availablecolor"
export default class extends Controller {
  static targets = ["status"]

  connect() {
    console.log("Hello, Stimulus!", this.elementinnerHTML)
  }
}
