import { initDataTable } from '../helpers/datatables';

$(document).on('turbolinks:load', () => initDataTable('dosages-table', {scrollX: true}));