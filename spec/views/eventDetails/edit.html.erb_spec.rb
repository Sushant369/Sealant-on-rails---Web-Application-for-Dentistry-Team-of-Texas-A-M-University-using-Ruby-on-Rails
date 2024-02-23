# frozen_string_literal: true

# spec/views/event_details/edit.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'event_details/edit', type: :view do
  before(:each) do
    @event_detail = assign(:event_detail, EventDetail.create(
                                            EventDate: '2023-10-23',
                                            School: 'abc',
                                            ConsentFD: '2',
                                            DenHrs: '3',
                                            DenTravelHrs: '4',
                                            DenTravelMil: '6',
                                            HygHours: '2',
                                            HygTravelMil: '4',
                                            HygTravelHrs: '2',
                                            AssistantTravelMil: '5',
                                            AssistantHrs: '1',
                                            AssistantTravelHrs: '5',
                                            OtherHrs: '2',
                                            OtherTravelHrs: '4',
                                            OtherTravelMiles: '5',
                                            NumberOfSSPDriven: '2',
                                            TotalMilesDriven: '21'
                                          ))
  end

  it 'renders the edit event detail form' do
    render

    assert_select 'h1', text: 'Editing event detail'

    # Verify the form fields
    assert_select 'form[action=?][method=?]', event_detail_path(@event_detail), 'post' do
      assert_select 'input[name=?]', 'event_detail[EventDate]'
      assert_select 'input[name=?]', 'event_detail[School]'
      assert_select 'input[name=?]', 'event_detail[ConsentFD]'
      assert_select 'input[name=?]', 'event_detail[DenHrs]'
      assert_select 'input[name=?]', 'event_detail[DenTravelHrs]'
      assert_select 'input[name=?]', 'event_detail[DenTravelMil]'
      assert_select 'input[name=?]', 'event_detail[HygHours]'
      assert_select 'input[name=?]', 'event_detail[HygTravelMil]'
      assert_select 'input[name=?]', 'event_detail[HygTravelHrs]'
      assert_select 'input[name=?]', 'event_detail[AssistantTravelMil]'
      assert_select 'input[name=?]', 'event_detail[AssistantHrs]'
      assert_select 'input[name=?]', 'event_detail[AssistantTravelHrs]'
      assert_select 'input[name=?]', 'event_detail[OtherHrs]'
      assert_select 'input[name=?]', 'event_detail[OtherTravelHrs]'
      assert_select 'input[name=?]', 'event_detail[OtherTravelMiles]'
      assert_select 'input[name=?]', 'event_detail[NumberOfSSPDriven]'
      assert_select 'input[name=?]', 'event_detail[TotalMilesDriven]'
    end
  end

  it "renders 'Show' and 'Back' links" do
    render

    assert_select 'a[href=?]', event_detail_path(@event_detail), text: 'Show this event detail'
    assert_select 'a[href=?]', event_details_path, text: 'Back to event details'
  end
end
