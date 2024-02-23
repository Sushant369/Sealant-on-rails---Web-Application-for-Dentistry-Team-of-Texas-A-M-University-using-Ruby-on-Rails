class AddColumnsToPatientDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :patient_details, :Gender, :string
    add_column :patient_details, :Race, :string
    add_column :patient_details, :Ethnicity, :string
  end
end
