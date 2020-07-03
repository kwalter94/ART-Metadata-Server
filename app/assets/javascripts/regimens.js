// Dynamically add nested model fields (see http://railscasts.com/episodes/196-nested-model-form-revised).

/**
 *  Adds a form field  for either a new drug or a new drug combination.
 */
function addField(event) {
  const {target} = event
  const time = new Date().getTime()
  const regexp = new RegExp(target.getAttribute('data-id'), 'g')

  target.insertAdjacentHTML('beforebegin', target.getAttribute('data-fields').replace(regexp, time))
  // After adding a new combination line, its `+ Drug` link needs to be registered 
  registerFieldListeners();

  event.preventDefault()
}

function removeField(event) {
  const parent = event.target.parentNode
  const drugSelectFields = parent.querySelectorAll('select')  // :last-child???
  const lastDrugSelectField = drugSelectFields[drugSelectFields.length - 1];
  lastDrugSelectField.parentNode.remove();
  
  event.preventDefault()
}

/**
 * Adds event listeners (addField above) on all links with the add_field class.
 */
function registerFieldListeners() {
  document.querySelectorAll('.add_fields')
          .forEach(link => link.addEventListener('click', addField))

  document.querySelectorAll('.remove_fields')
          .forEach(link => link.addEventListener('click', removeField))
}

registerFieldListeners()
