import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  onEdit(event) {
    event.preventDefault();
    //document.getElementById("show_table").style.display = 'none';
    //document.getElementById("edit_table").style.display = 'inline-block';
  }
}
