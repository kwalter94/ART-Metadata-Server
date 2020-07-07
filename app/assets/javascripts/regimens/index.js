// Attach event listener to prevent re-initialisation of datatable.
//
// See https://stackoverflow.com/questions/44670160/make-datatables-work-with-turbolinks
document.addEventListener("turbolinks:load", function() {
  "use strict";
  
  if ($("#regimens-table_wrapper").length == 0) {
    $('#regimens-table').DataTable({destroy: true})
  }
})