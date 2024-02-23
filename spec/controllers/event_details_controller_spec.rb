# frozen_string_literal: true

# spec/controllers/event_details_controller_spec.rb

require 'rails_helper'

RSpec.describe EventDetailsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      event_detail = EventDetail.create!(event_detail_params)
      get :show, params: { id: event_detail.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new event detail' do
        expect do
          post :create, params: { event_detail: valid_event_detail_params }
        end.to change(EventDetail, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template' do
        post :create, params: { event_detail: invalid_event_detail_params }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      event_detail = EventDetail.create!(event_detail_params)
      get :edit, params: { id: event_detail.id }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    let!(:event_detail) { EventDetail.create!(event_detail_params) }

    context 'with valid parameters' do
      it 'updates the event detail' do
        new_params = valid_event_detail_params
        patch :update, params: { id: event_detail.id, event_detail: new_params }
        event_detail.reload
        expect(event_detail.EventDate).to eq(Date.parse(new_params[:EventDate]))
        # Add similar expectations for other attributes
      end
    end

    context 'with invalid parameters' do
      it 'renders the edit template' do
        patch :update, params: { id: event_detail.id, event_detail: invalid_event_detail_params }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the event detail' do
      event_detail = EventDetail.create!(event_detail_params)
      expect do
        delete :destroy, params: { id: event_detail.id }
      end.to change(EventDetail, :count).by(-1)
    end
  end

  private

  def event_detail_params
    {
      EventDate: '2023-10-23',
      School: 'Sample School',
      ConsentFD: 2.0,
      DenHrs: 5.0,
      DenTravelHrs: 2.5,
      DenTravelMil: 50.0,
      HygHours: 4.0,
      HygTravelHrs: 1.5,
      HygTravelMil: 30.0,
      AssistantHrs: 3.0,
      AssistantTravelHrs: 1.0,
      AssistantTravelMil: 20.0,
      OtherHrs: 2.0,
      OtherTravelHrs: 0.5,
      OtherTravelMiles: 10.0,
      NumberOfSSPDriven: 2,
      TotalMilesDriven: 100.0,
      ChildScreened: 23,
      ChildReceivingSealant: 13,
      NumberOfSealed: 3,
      NumberFlourideVarnish: 4,
      NumberProphy: 5,
      uid: '1'
    }
  end

  def valid_event_detail_params
    # Define valid parameters for updating an event detail
    {
      EventDate: '2023-10-24',
      School: 'New School',
      ConsentFD: 3.0,
      DenHrs: 4.5,
      DenTravelHrs: 2.0,
      DenTravelMil: 40.0,
      HygHours: 3.5,
      HygTravelHrs: 1.0,
      HygTravelMil: 25.0,
      AssistantHrs: 2.5,
      AssistantTravelHrs: 0.5,
      AssistantTravelMil: 15.0,
      OtherHrs: 1.5,
      OtherTravelHrs: 0.2,
      OtherTravelMiles: 8.0,
      NumberOfSSPDriven: 1,
      TotalMilesDriven: 80.0,
      ChildScreened: nil, # Optional, can be nil
      ChildReceivingSealant: nil, # Optional, can be nil
      NumberOfSealed: nil, # Optional, can be nil
      NumberFlourideVarnish: nil, # Optional, can be nil
      NumberProphy: nil, # Optional, can be nil
      uid: 'def456'
    }
  end

  def invalid_event_detail_params
    # Define invalid parameters for testing error cases
    {
      EventDate: nil, # Invalid, missing EventDate
      School: 'Sample School2',
      ConsentFD: 4.0,
      DenHrs: 5.0,
      DenTravelHrs: 2.5,
      DenTravelMil: 50.0,
      HygHours: 4.0,
      HygTravelHrs: 1.5,
      HygTravelMil: 30.0,
      AssistantHrs: 3.0,
      AssistantTravelHrs: 1.0,
      AssistantTravelMil: 20.0,
      OtherHrs: 2.0,
      OtherTravelHrs: 0.5,
      OtherTravelMiles: 10.0,
      NumberOfSSPDriven: 2,
      TotalMilesDriven: 100.0,
      ChildScreened: 'Yes', # Optional, but still valid if provided
      ChildReceivingSealant: 'No', # Optional, but still valid if provided
      NumberOfSealed: 3, # Optional, but still valid if provided
      NumberFlourideVarnish: 4, # Optional, but still valid if provided
      NumberProphy: 5, # Optional, but still valid if provided
      uid: 'ghi789'
    }
  end

  render_views
end
