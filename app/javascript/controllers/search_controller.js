import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["params"];

  search() {
    const value = this.paramsTarget.value;

    fetch(`/rooms/search?search=${value}`)
      .then((response) => response.text())
      .then((res) => {
        document.getElementById("rooms").innerHTML = res;
      });
  }
  connect() {}
}
