function isDataTableInitialised(tableId) {
  return $(`#${tableId}_wrapper`).length > 0;
}

export { isDataTableInitialised };