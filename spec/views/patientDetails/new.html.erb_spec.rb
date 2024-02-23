# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patient_details/new', type: :view do
  before(:each) do
    assign(:patient_detail, PatientDetail.new(
                              ProgramName: 'Program Name',
                              SchoolName: 'School Name',
                              Age: 2,
                              Insurance: 'Insurance',
                              Grade: 'Grade',
                              PatientId: 1
                            ))
  end

  it 'renders new patient_detail form' do
    render

    assert_select 'form[action=?][method=?]', patient_details_path, 'post' do
      assert_select 'input[name=?]', 'patient_detail[ProgramName]'

      assert_select 'input[name=?]', 'patient_detail[SchoolName]'

      assert_select 'input[name=?]', 'patient_detail[Age]'

      assert_select 'input[name=?]', 'patient_detail[Insurance]'

      assert_select 'input[name=?]', 'patient_detail[Grade]'
    end
  end
end
