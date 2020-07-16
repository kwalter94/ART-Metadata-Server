import { initDataTable } from '../helpers/datatables';

document.addEventListener('turbolinks:load', () => initDataTable('moh-names-table'));
