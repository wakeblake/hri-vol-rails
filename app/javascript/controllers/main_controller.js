import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  onEdit(event) {
    event.preventDefault();
    var elems = document.querySelectorAll('#' + event.target.id + '_e');
    for (var e of elems) {
      e.readOnly = false;
      e.disabled = false;
    }
    //document.getElementById("edit_table").style.display = 'inline-block';
  }
}
