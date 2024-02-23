# frozen_string_literal: true

require 'test_helper'

class PatientDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_detail = patient_details(:one)
  end

  test 'should get index' do
    get patient_details_url
    assert_response :success
  end

  test 'should get new' do
    get new_patient_detail_url
    assert_response :success
  end

  test 'should create patient_detail' do
    assert_difference('PatientDetail.count') do
      post patient_details_url,
           params: { patient_detail: { Age: @patient_detail.Age, Date: @patient_detail.Date, Grade: @patient_detail.Grade,
                                       Insurance: @patient_detail.Insurance, PID: @patient_detail.PID, PatientId: @patient_detail.PatientId, ProgramName: @patient_detail.ProgramName, SchoolName: @patient_detail.SchoolName } }
    end

    assert_redirected_to patient_detail_url(PatientDetail.last)
  end

  test 'should show patient_detail' do
    get patient_detail_url(@patient_detail)
    assert_response :success
  end

  test 'should get edit' do
    get edit_patient_detail_url(@patient_detail)
    assert_response :success
  end

  test 'should update patient_detail' do
    patch patient_detail_url(@patient_detail),
          params: { patient_detail: { Age: @patient_detail.Age, Date: @patient_detail.Date, Grade: @patient_detail.Grade,
                                      Insurance: @patient_detail.Insurance, PID: @patient_detail.PID, PatientId: @patient_detail.PatientId, ProgramName: @patient_detail.ProgramName, SchoolName: @patient_detail.SchoolName } }
    assert_redirected_to patient_detail_url(@patient_detail)
  end

  test 'should destroy patient_detail' do
    assert_difference('PatientDetail.count', -1) do
      delete patient_detail_url(@patient_detail)
    end

    assert_redirected_to patient_details_url
  end
end
