# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patient_details/index', type: :view do
  before(:each) do
    assign(:patient_details, [
             PatientDetail.create!(
               ProgramName: 'Program Name',
               SchoolName: 'School Name',
               Date: Date.today,
               Age: 2,
               Insurance: 'Insurance',
               Grade: 'Grade',
               PID: '1-School Name',
               PatientId: 1
             ),
             PatientDetail.create!(
               ProgramName: 'Program Name',
               SchoolName: 'School Name',
               Date: Date.today,
               Age: 2,
               Insurance: 'Insurance',
               Grade: 'Grade',
               PID: '2-School Name',
               PatientId: 2
             )
           ])
  end

  it 'renders a list of patient_detail' do
    render
    # cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select 'tr>td', text: Regexp.new('Program Name'.to_s), count: 2
    assert_select 'tr>td', text: Regexp.new('School Name'.to_s), count: 2
  end

  it 'validates uniqueness of PID' do
    patient_detail = PatientDetail.new(
      ProgramName: 'Program Name',
      SchoolName: 'School Name',
      Age: 2,
      Insurance: 'Insurance',
      Grade: 'Grade',
      PID: '1-School Name', # Duplicate PID
      PatientId: 3
    )

    expect(patient_detail).not_to be_valid
  end

  it 'validates uniqueness of PatientId within the same SchoolName' do
    patient_detail = PatientDetail.new(
      ProgramName: 'Program Name',
      SchoolName: 'School Name',
      Age: 2,
      Insurance: 'Insurance',
      Grade: 'Grade',
      PID: '3-School Name',
      PatientId: 1 # Duplicate PatientId within the same SchoolName
    )

    expect(patient_detail).not_to be_valid
  end
end
