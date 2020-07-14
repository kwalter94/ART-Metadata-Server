import { isDataTableInitialised } from '../helpers/datatables';

$(document).on('turbolinks:load', function(_event) {
  if (!isDataTableInitialised('dosages-table')) {
    $('#dosages-table').DataTable({scrollX: true});
  }
});