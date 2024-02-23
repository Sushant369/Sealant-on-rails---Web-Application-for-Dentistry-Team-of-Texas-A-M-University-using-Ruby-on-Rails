# frozen_string_literal: true

require 'application_system_test_case'

class PatientDetailsTest < ApplicationSystemTestCase
  setup do
    @patient_detail = patient_details(:one)
  end

  test 'visiting the index' do
    visit patient_details_url
    assert_selector 'h1', text: 'Patient details'
  end

  test 'should create patient detail' do
    visit patient_details_url
    click_on 'New patient detail'

    fill_in 'Age', with: @patient_detail.Age
    fill_in 'Date', with: @patient_detail.Date
    fill_in 'Grade', with: @patient_detail.Grade
    fill_in 'Insurance', with: @patient_detail.Insurance
    fill_in 'Pid', with: @patient_detail.PID
    fill_in 'Patientid', with: @patient_detail.PatientId
    fill_in 'Programname', with: @patient_detail.ProgramName
    fill_in 'Schoolname', with: @patient_detail.SchoolName
    click_on 'Create Patient detail'

    assert_text 'Patient detail was successfully created'
    click_on 'Back'
  end

  test 'should update Patient detail' do
    visit patient_detail_url(@patient_detail)
    click_on 'Edit this patient detail', match: :first

    fill_in 'Age', with: @patient_detail.Age
    fill_in 'Date', with: @patient_detail.Date
    fill_in 'Grade', with: @patient_detail.Grade
    fill_in 'Insurance', with: @patient_detail.Insurance
    fill_in 'Pid', with: @patient_detail.PID
    fill_in 'Patientid', with: @patient_detail.PatientId
    fill_in 'Programname', with: @patient_detail.ProgramName
    fill_in 'Schoolname', with: @patient_detail.SchoolName
    click_on 'Update Patient detail'

    assert_text 'Patient detail was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Patient detail' do
    visit patient_detail_url(@patient_detail)
    click_on 'Destroy this patient detail', match: :first

    assert_text 'Patient detail was successfully destroyed'
  end
end
