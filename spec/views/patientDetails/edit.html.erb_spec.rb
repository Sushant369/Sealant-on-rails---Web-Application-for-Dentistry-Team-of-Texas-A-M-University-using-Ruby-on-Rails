# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patient_details/edit', type: :view do
  let(:patient_detail) do
    PatientDetail.create!(
      ProgramName: 'MyString',
      SchoolName: 'MyString',
      Date: Date.today,
      Age: 1,
      Insurance: 'MyString',
      Grade: 'MyString',
      PID: 'MyString',
      PatientId: 1
    )
  end

  before(:each) do
    assign(:patient_detail, patient_detail)
  end

  it 'renders the edit patient_detail form' do
    render

    assert_select 'form[action=?][method=?]', patient_detail_path(patient_detail), 'post' do
      assert_select 'input[name=?]', 'patient_detail[PatientId]'

      assert_select 'input[name=?]', 'patient_detail[ProgramName]'

      assert_select 'input[name=?]', 'patient_detail[SchoolName]'

      assert_select 'input[name=?]', 'patient_detail[Age]'

      assert_select 'input[name=?]', 'patient_detail[Insurance]'

      assert_select 'input[name=?]', 'patient_detail[Grade]'
    end
  end
end
