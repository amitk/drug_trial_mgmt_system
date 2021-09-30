$(document).on('click', '#exampleModal', function() {
  $('#feedback_update').one('click', (evt) => {
    evt.stopImmediatePropagation();
    let patient_id = $('#feedback_update').data('patient-id')
    $.ajax({
      type: 'PATCH',
      url: `/patients/${patient_id}`,
      data: {
        "patient": {
          "feedback": $('input[type=radio]:checked').val()
        }
      },
    })
  })
})
