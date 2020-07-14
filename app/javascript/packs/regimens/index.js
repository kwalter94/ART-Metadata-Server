import { initDataTable } from '../helpers/datatables';

$(document).on('turbolinks:load', () => initDataTable('regimens-table'));
