# frozen_string_literal: true

json.extract! patient_detail, :id, :PatientId, :ProgramName, :SchoolName, :Age, :Date, :Insurance, :Grade, :PID,
              :created_at, :updated_at
json.url patient_detail_url(patient_detail, format: :json)
