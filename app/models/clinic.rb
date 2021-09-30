# frozen_string_literal: true

class Clinic < ApplicationRecord
  has_many :arms
  has_and_belongs_to_many :doctors
end
# let patient_id = $('#feedback_update').data('patient-id')
# $.ajax({
#   type: 'PATCH',
#   url: `/patients/${patient_id}`,
#   data: {
#     "patient": {
#       "feedback": $('input[type=radio]:checked').val()
#     }
#   },
# })
