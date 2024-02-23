# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patient_details/show', type: :view do
  before(:each) do
    assign(:patient_detail, PatientDetail.create!(
                              ProgramName: 'Program Name',
                              SchoolName: 'School_Name',
                              Date: Date.today,
                              Age: 2,
                              Insurance: 'Insurance',
                              Grade: 'Grade',
                              PID: 'PID',
                              PatientId: 1
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to have_button('Destroy this patient detail')
  end
end
