# frozen_string_literal: true

# spec/features/event_details/new_event_view_spec.rb

require 'rails_helper'

RSpec.feature 'New Event View', type: :feature do
  scenario 'User visits the new event creation page' do
    visit new_event_detail_path

    # Check if the page title is correct
    expect(page).to have_selector('h1', text: 'New event')

    # Check if the form is rendered
    expect(page).to have_selector('form')

    # Check if the "Back to event details" button is present
    expect(page).to have_button('Back to event details')
  end

  scenario "User clicks the 'Back to event details' button" do
    visit new_event_detail_path

    # Click the "Back to event details" button
    click_button 'Back to event details'

    # Check if the user is redirected to the event details index page
    expect(current_path).to eq(event_details_path)
  end
end
