# frozen_string_literal: true

# spec/views/event_details/show.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'event_details/show', type: :view do
  before(:each) do
    @event_detail = assign(:event_detail, EventDetail.create(
                                            EventDate: Date.parse('2023-10-23'),
                                            School: 'Sample School',
                                            ConsentFD: 2,
                                            DenHrs: 3,
                                            DenTravelHrs: 4,
                                            DenTravelMil: 6,
                                            HygHours: 2,
                                            HygTravelMil: 4,
                                            HygTravelHrs: 2,
                                            AssistantTravelMil: 5,
                                            AssistantHrs: 1,
                                            AssistantTravelHrs: 5,
                                            OtherHrs: 2,
                                            OtherTravelHrs: 4,
                                            OtherTravelMiles: 5,
                                            NumberOfSSPDriven: 2,
                                            TotalMilesDriven: 21
                                          ))
  end

  it 'renders attributes in the show view' do
    render
    expect(rendered).to have_button('Edit this event detail')
    expect(rendered).to have_button('Back to event details')
    # You can add more button expectations as necessary
  end
end
