# frozen_string_literal: true

json.array! @patient_details, partial: 'patient_details/patient_detail', as: :patient_detail
