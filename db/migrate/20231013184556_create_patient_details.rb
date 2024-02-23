# frozen_string_literal: true

class CreatePatientDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_details, id: false do |t|
      t.integer :PatientId
      t.string :ProgramName
      t.string :SchoolName
      t.integer :Age
      t.date :Date
      t.string :Insurance
      t.string :Grade
      t.string :PID, primary_key: true

      t.timestamps
    end
  end
end
