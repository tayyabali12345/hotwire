import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset() {
    debugger;
    console.log("I am here in this tab");
    this.element.reset();
  }
}
