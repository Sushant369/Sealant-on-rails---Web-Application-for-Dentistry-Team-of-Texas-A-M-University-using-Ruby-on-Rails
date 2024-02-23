Given("I am on the event details page") do
    visit event_details_path
end
  
Then("I should see {string}") do |content|
    expect(page).to have_content(content)
end

Given("I am on the event detail form page") do
    visit new_event_detail_path
end

When("I fill in the {string} with {string}") do |field, value|
    fill_in field, with: value
end

When("I click the {string} button") do |button_text|
    click_button button_text
end



# Edit Event Detail
Given("there is an existing event detail") do
    # Create an event detail in the database
    EventDetail.create(
      EventDate: Date.parse("2023-11-10"),
      School: "Sample School",
      ConsentFD: 10,
      DenHrs: 5.0,
      HygHours: 3.0,
      AssistantHrs: 2.0,
      OtherHrs: 1.0,
      DenTravelHrs: 1.0,
      HygTravelHrs: 2.0,
      AssistantTravelHrs: 1.5,
      OtherTravelHrs: 0.5,
      DenTravelMil: 10.0,
      HygTravelMil: 20.0,
      AssistantTravelMil: 15.0,
      OtherTravelMiles: 5.0,
      NumberOfSSPDriven: 3.0,
      TotalMilesDriven: 45.0
    )
end
  
When("I am on the event details edit page") do
    event_detail = EventDetail.last # You might need to fetch the specific event detail from the database
    visit edit_event_detail_path(event_detail)
end

When("I change the Event Date to {string}") do |new_event_date|
    fill_in "Event Date", with: new_event_date
end

Then("I should see the following details after clicking the 'Add New Event' button") do |table|
    table.raw.flatten.each do |content|
      expect(page).to have_content(content)
    end
end

# When("I click the \"Update Event\" button") do
#     click_button "Update Event"
# end

# # Reusing the existing step
# Then("I should see {string}") do |content|
#     expect(page).to have_content(content)
# end


When("I fill in the Event Date with {string}") do |event_date|
    fill_in "Event Date", with: event_date
end

When("I fill in the School with {string}") do |school|
    fill_in "School", with: school
end

When("I fill in the Consent Forms Distributed with {string}") do |consent_forms|
    fill_in "Consent Forms Distributed", with: consent_forms
end

# When("I fill in the Dentist Hours with {string}") do |dentist_hours|
#     fill_in "Dentist Hours", with: dentist_hours
# end

# When("I fill in the Dentist Hours with {string}") do |dentist_hours|
#     # Assuming that each field corresponds to the respective column in the table
#     within('tr', text: 'Total hours at school') do
#         find('td', text: 'Total hours at school').find('input').set(dentist_hours)
#     end
# end

When("I fill in the Dentist Hours with {string}") do |dentist_hours|
    fill_in 'event_detail_DenHrs', with: dentist_hours
end

When("I fill in the Hygienist Hours with {string}") do |hygienist_hours|
    fill_in 'event_detail_HygHours', with: hygienist_hours
end

When("I fill in the Assistant Hours with {string}") do |assistant_hours|
    fill_in 'event_detail_AssistantHrs', with: assistant_hours
end

When("I fill in the Other Hours with {string}") do |other_hours|
    fill_in 'event_detail_OtherHrs', with: other_hours
end

When("I fill in the Dentist Travel Hours with {string}") do |dentist_travel_hours|
    fill_in 'event_detail_DenTravelHrs', with: dentist_travel_hours
end

When("I fill in the Hygienist Travel Hours with {string}") do |hygienist_travel_hours|
    fill_in 'event_detail_HygTravelHrs', with: hygienist_travel_hours
end

When("I fill in the Assistant Travel Hours with {string}") do |assistant_travel_hours|
    fill_in 'event_detail_AssistantTravelHrs', with: assistant_travel_hours
end

When("I fill in the Other Travel Hours with {string}") do |other_travel_hours|
    fill_in 'event_detail_OtherTravelHrs', with: other_travel_hours
end

When("I fill in the Dentist Travel Miles with {string}") do |dentist_travel_miles|
    fill_in 'event_detail_DenTravelMil', with: dentist_travel_miles
end

When("I fill in the Hygienist Travel Miles with {string}") do |hygienist_travel_miles|
    fill_in 'event_detail_HygTravelMil', with: hygienist_travel_miles
end

When("I fill in the Assistant Travel Miles with {string}") do |assistant_travel_miles|
    fill_in 'event_detail_AssistantTravelMil', with: assistant_travel_miles
end

When("I fill in the Other Travel Miles with {string}") do |other_travel_miles|
    fill_in 'event_detail_OtherTravelMiles', with: other_travel_miles
end

When('I fill in the No. owned\/operated by SSP driven to event with {string}') do |number_ssp_driven|
    fill_in "No. owned/operated by SSP driven to event", with: number_ssp_driven
end

When("I fill in the Total miles driven for event with {string}") do |total_miles_driven|
    fill_in "Total miles driven for event", with: total_miles_driven
end

When("I change the School to {string}") do |new_school|
    fill_in("School", with: new_school)
end
  
  
  Then("I should be on the event details page") do
    expect(current_path).to eq(event_details_path)
end
  



######