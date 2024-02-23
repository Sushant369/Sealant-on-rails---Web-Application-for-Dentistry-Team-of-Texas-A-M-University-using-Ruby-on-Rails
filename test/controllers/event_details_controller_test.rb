# frozen_string_literal: true

require 'test_helper'

class EventDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_detail = event_details(:one)
  end

  test 'should get index' do
    get event_details_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_detail_url
    assert_response :success
  end

  test 'should create event_detail' do
    assert_difference('EventDetail.count') do
      post event_details_url,
           params: { event_detail: { AssistantHrs: @event_detail.AssistantHrs, AssistantTravel: @event_detail.AssistantTravel,
                                     ChildReceivingSealant: @event_detail.ChildReceivingSealant, ChildScreened: @event_detail.ChildScreened, ConsentFD: @event_detail.ConsentFD, DenHrs: @event_detail.DenHrs, DenTravelHrs: @event_detail.DenTravelHrs, DenTravelMil: @event_detail.DenTravelMil, EventDate: @event_detail.EventDate, HygHours: @event_detail.HygHours, HygMiles: @event_detail.HygMiles, NumberFlourideVarnish: @event_detail.NumberFlourideVarnish, NumberOfSSPDriven: @event_detail.NumberOfSSPDriven, NumberOfSealed: @event_detail.NumberOfSealed, NumberProphy: @event_detail.NumberProphy, OtherHrs: @event_detail.OtherHrs, OtherTravelHrs: @event_detail.OtherTravelHrs, OtherTravelMiles: @event_detail.OtherTravelMiles, School: @event_detail.School, TotalMilesDriven: @event_detail.TotalMilesDriven, date: @event_detail.date, flaot: @event_detail.flaot, float: @event_detail.float, integer: @event_detail.integer, string: @event_detail.string, uid: @event_detail.uid } }
    end

    assert_redirected_to event_detail_url(EventDetail.last)
  end

  test 'should show event_detail' do
    get event_detail_url(@event_detail)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_detail_url(@event_detail)
    assert_response :success
  end

  test 'should update event_detail' do
    patch event_detail_url(@event_detail),
          params: { event_detail: { AssistantHrs: @event_detail.AssistantHrs, AssistantTravel: @event_detail.AssistantTravel,
                                    ChildReceivingSealant: @event_detail.ChildReceivingSealant, ChildScreened: @event_detail.ChildScreened, ConsentFD: @event_detail.ConsentFD, DenHrs: @event_detail.DenHrs, DenTravelHrs: @event_detail.DenTravelHrs, DenTravelMil: @event_detail.DenTravelMil, EventDate: @event_detail.EventDate, HygHours: @event_detail.HygHours, HygMiles: @event_detail.HygMiles, NumberFlourideVarnish: @event_detail.NumberFlourideVarnish, NumberOfSSPDriven: @event_detail.NumberOfSSPDriven, NumberOfSealed: @event_detail.NumberOfSealed, NumberProphy: @event_detail.NumberProphy, OtherHrs: @event_detail.OtherHrs, OtherTravelHrs: @event_detail.OtherTravelHrs, OtherTravelMiles: @event_detail.OtherTravelMiles, School: @event_detail.School, TotalMilesDriven: @event_detail.TotalMilesDriven, date: @event_detail.date, flaot: @event_detail.flaot, float: @event_detail.float, integer: @event_detail.integer, string: @event_detail.string, uid: @event_detail.uid } }
    assert_redirected_to event_detail_url(@event_detail)
  end

  test 'should destroy event_detail' do
    assert_difference('EventDetail.count', -1) do
      delete event_detail_url(@event_detail)
    end

    assert_redirected_to event_details_url
  end
end
