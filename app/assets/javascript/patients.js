$(document).on('click', '#exampleModal', function() {
  console.log('hello world')
  $('#exampleModal').one('show.bs.modal', () => {
  })
})
