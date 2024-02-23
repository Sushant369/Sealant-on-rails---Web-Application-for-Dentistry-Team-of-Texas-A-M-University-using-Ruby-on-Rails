# frozen_string_literal: true

require 'application_system_test_case'

class EventDetailsTest < ApplicationSystemTestCase
  setup do
    @event_detail = event_details(:one)
  end

  test 'visiting the index' do
    visit event_details_url
    assert_selector 'h1', text: 'Event details'
  end

  test 'should create event detail' do
    visit event_details_url
    click_on 'New event detail'

    fill_in 'Assistanthrs', with: @event_detail.AssistantHrs
    fill_in 'Assistanttravel', with: @event_detail.AssistantTravel
    fill_in 'Childreceivingsealant', with: @event_detail.ChildReceivingSealant
    fill_in 'Childscreened', with: @event_detail.ChildScreened
    fill_in 'Consentfd', with: @event_detail.ConsentFD
    fill_in 'Denhrs', with: @event_detail.DenHrs
    fill_in 'Dentravelhrs', with: @event_detail.DenTravelHrs
    fill_in 'Dentravelmil', with: @event_detail.DenTravelMil
    fill_in 'Eventdate', with: @event_detail.EventDate
    fill_in 'Hyghours', with: @event_detail.HygHours
    fill_in 'Hygmiles', with: @event_detail.HygMiles
    fill_in 'Numberflouridevarnish', with: @event_detail.NumberFlourideVarnish
    fill_in 'Numberofsspdriven', with: @event_detail.NumberOfSSPDriven
    fill_in 'Numberofsealed', with: @event_detail.NumberOfSealed
    fill_in 'Numberprophy', with: @event_detail.NumberProphy
    fill_in 'Otherhrs', with: @event_detail.OtherHrs
    fill_in 'Othertravelhrs', with: @event_detail.OtherTravelHrs
    fill_in 'Othertravelmiles', with: @event_detail.OtherTravelMiles
    fill_in 'School', with: @event_detail.School
    fill_in 'Totalmilesdriven', with: @event_detail.TotalMilesDriven
    fill_in 'Date', with: @event_detail.date
    fill_in 'Flaot', with: @event_detail.flaot
    fill_in 'Float', with: @event_detail.float
    fill_in 'Integer', with: @event_detail.integer
    fill_in 'String', with: @event_detail.string
    fill_in 'Uid', with: @event_detail.uid
    click_on 'Create Event detail'

    assert_text 'Event detail was successfully created'
    click_on 'Back'
  end

  test 'should update Event detail' do
    visit event_detail_url(@event_detail)
    click_on 'Edit this event detail', match: :first

    fill_in 'Assistanthrs', with: @event_detail.AssistantHrs
    fill_in 'Assistanttravel', with: @event_detail.AssistantTravel
    fill_in 'Childreceivingsealant', with: @event_detail.ChildReceivingSealant
    fill_in 'Childscreened', with: @event_detail.ChildScreened
    fill_in 'Consentfd', with: @event_detail.ConsentFD
    fill_in 'Denhrs', with: @event_detail.DenHrs
    fill_in 'Dentravelhrs', with: @event_detail.DenTravelHrs
    fill_in 'Dentravelmil', with: @event_detail.DenTravelMil
    fill_in 'Eventdate', with: @event_detail.EventDate
    fill_in 'Hyghours', with: @event_detail.HygHours
    fill_in 'Hygmiles', with: @event_detail.HygMiles
    fill_in 'Numberflouridevarnish', with: @event_detail.NumberFlourideVarnish
    fill_in 'Numberofsspdriven', with: @event_detail.NumberOfSSPDriven
    fill_in 'Numberofsealed', with: @event_detail.NumberOfSealed
    fill_in 'Numberprophy', with: @event_detail.NumberProphy
    fill_in 'Otherhrs', with: @event_detail.OtherHrs
    fill_in 'Othertravelhrs', with: @event_detail.OtherTravelHrs
    fill_in 'Othertravelmiles', with: @event_detail.OtherTravelMiles
    fill_in 'School', with: @event_detail.School
    fill_in 'Totalmilesdriven', with: @event_detail.TotalMilesDriven
    fill_in 'Date', with: @event_detail.date
    fill_in 'Flaot', with: @event_detail.flaot
    fill_in 'Float', with: @event_detail.float
    fill_in 'Integer', with: @event_detail.integer
    fill_in 'String', with: @event_detail.string
    fill_in 'Uid', with: @event_detail.uid
    click_on 'Update Event detail'

    assert_text 'Event detail was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Event detail' do
    visit event_detail_url(@event_detail)
    click_on 'Destroy this event detail', match: :first

    assert_text 'Event detail was successfully destroyed'
  end
end
