document.addEventListener('turbolinks:load', () => {
  $('.form-inline-link').on('click', formInlineLinkHandler)

  const errors = document.querySelector('.resource-errors')

  if(errors) {
    formInlineHandler(errors.dataset.resourceId)
  }
});

function formInlineLinkHandler(event) {
  event.preventDefault()
  formInlineHandler(this.dataset.testId)
}

function formInlineHandler(testId) {
  const $link = $(`.form-inline-link[data-test-id="${testId}"]`)
  const $testTitle = $(`.test-title[data-test-id="${testId}"]`)
  const $formInline = $(`.form-inline[data-test-id="${testId}"]`)

  $testTitle.toggle()
  $formInline.toggle()

  if($formInline.is(':visible')) {
    $link.text('Cancel')
  } else {
    $link.text('Edit')
  }
}
