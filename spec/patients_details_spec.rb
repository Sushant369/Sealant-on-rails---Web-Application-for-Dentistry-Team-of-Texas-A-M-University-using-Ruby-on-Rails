# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/patient_details', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # PatientsDetail. As you add validations to PatientsDetail, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      ProgramName: 'Program Name',
      SchoolName: 'School_Name',
      Age: 25,
      Date: Date.today,
      Insurance: 'Insurance',
      Grade: 'A',
      PID: '1-School_Name',
      PatientId: 1
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      PatientDetail.create! valid_attributes
      get patient_details_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      patients_detail = PatientDetail.create! valid_attributes
      get patient_detail_url(patients_detail)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_patient_detail_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      patient_detail = PatientDetail.create! valid_attributes
      get edit_patient_detail_url(patient_detail)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new PatientsDetail' do
        expect do
          post patient_details_url, params: { patient_detail: valid_attributes }
        end.to change(PatientDetail, :count).by(1)
      end

      it 'redirects to the created patients_detail' do
        post patient_details_url, params: { patient_detail: valid_attributes }
        expect(response).to redirect_to(patient_detail_url(PatientDetail.last))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          ProgramName: 'Updated Program Name',
          Age: 30,
          Date: Date.today,
          Insurance: 'Updated Insurance',
          Grade: 'B'

        }
      end

      it 'updates the requested patients_detail' do
        patient_detail = PatientDetail.create! valid_attributes
        patch patient_detail_url(patient_detail), params: { patient_detail: new_attributes }
        patient_detail.reload
        expect(patient_detail.ProgramName).to eq('Updated Program Name')
        expect(patient_detail.Age).to eq(30)
        expect(patient_detail.Insurance).to eq('Updated Insurance')
      end

      it 'redirects to the patients_detail' do
        patient_detail = PatientDetail.create! valid_attributes
        patch patient_detail_url(patient_detail), params: { patient_detail: new_attributes }
        patient_detail.reload
        expect(response).to redirect_to(patient_detail_url(patient_detail))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested patients_detail' do
      patient_detail = PatientDetail.create! valid_attributes
      expect do
        delete patient_detail_url(patient_detail)
      end.to change(PatientDetail, :count).by(-1)
    end

    it 'redirects to the patients_details list' do
      patients_detail = PatientDetail.create! valid_attributes
      delete patient_detail_url(patients_detail)
      expect(response).to redirect_to(patient_details_url)
    end
  end
end
