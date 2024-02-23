# frozen_string_literal: true

# spec/views/event_details/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'event_details/index', type: :view do
  before(:each) do
    @event_details = assign(:event_details, [
                              EventDetail.create(EventDate: Date.parse('2023-10-23'),
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
                                                 TotalMilesDriven: '21'),
                              EventDetail.create(EventDate: Date.parse('2023-10-24'),
                                                 School: 'ab',
                                                 ConsentFD: '7',
                                                 DenHrs: '3',
                                                 DenTravelHrs: '4',
                                                 DenTravelMil: '6',
                                                 HygHours: '2',
                                                 HygTravelMil: '6',
                                                 HygTravelHrs: '2',
                                                 AssistantTravelMil: '5',
                                                 AssistantHrs: '1',
                                                 AssistantTravelHrs: '9',
                                                 OtherHrs: '2',
                                                 OtherTravelHrs: '4',
                                                 OtherTravelMiles: '1',
                                                 NumberOfSSPDriven: '2',
                                                 TotalMilesDriven: '21')
                              # Add more EventDetail instances as needed
                            ])
  end

  it 'renders a list of event details' do
    render

    expect(rendered).to have_selector('h1', text: 'Events Details')

    # Verify the "Add a new event's details" button
    assert_select 'form[action=?][method=?]', new_event_detail_path, 'get' do
      assert_select 'form'
    end

    # Verify the table structure and data
    assert_select 'table.table.table-striped.table-bordered.table-hover' do
      assert_select 'thead.thead-dark' do
        assert_select 'tr' do
          assert_select 'th', text: 'Event Date'
          assert_select 'th', text: 'School'
          assert_select 'th', text: 'Link'
        end
      end

      assert_select 'tbody' do
        @event_details.each do |event_detail|
          assert_select 'tr' do
            formatted_date = event_detail.EventDate.strftime('%Y-%m-%d')
            assert_select 'td', text: formatted_date
            assert_select 'td', text: event_detail.School
            assert_select 'td' do
              assert_select 'form[action=?][method=?]', event_detail_path(event_detail), 'get' do
                assert_select 'button[type=?]', 'submit', text: 'Show this event detail'
              end
            end
          end
        end
      end
    end
  end
end
