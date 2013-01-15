ItemWithForm =
  showForm: (formSelector, buttonSelector, buttonText) =>
    form = @$(formSelector)
    button = @$(buttonSelector)
    if form.hasClass 'active'
      button.text buttonText.normal
      button.removeClass 'btn-warning'
      button.addClass 'btn-primary'
    else
      button.text buttonText.cancel
      button.removeClass 'btn-primary'
      button.addClass 'btn-warning'
    form.toggleClass 'active'


module.exports = ItemWithForm
