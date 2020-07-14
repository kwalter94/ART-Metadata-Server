// Initialise/Re-initialise datatable.
//
// See https://stackoverflow.com/questions/44670160/make-datatables-work-with-turbolinks
function initDataTable(tableId, params = {}) {
  if ($(`#${tableId}_wrapper`).length > 0) return;

  $(`#${tableId}`).DataTable(params);
}

export { initDataTable };