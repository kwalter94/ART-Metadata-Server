import { initDataTable } from '../helpers/datatables';

document.addEventListener('turbolinks:load', () => initDataTable('dosages-table', {scrollX: true}));