import { initDataTable } from '../helpers/datatables';

document.addEventListener('turbolinks:load', () => initDataTable('regimens-table'));
