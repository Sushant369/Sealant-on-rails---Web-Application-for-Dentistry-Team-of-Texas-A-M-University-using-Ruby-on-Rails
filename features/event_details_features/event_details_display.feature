Feature: Displaying Event Details

  Scenario: Viewing Event Details - Initial Page
    Given I am on the event details page
    Then I should see "Events Details"
    And I should see "Event Date"
    And I should see "School"
    And I should see "Link"

  Scenario: Viewing Event Details - After Clicking "Add New Event"
    Given I am on the event details page
    When I click the "Add a new event's details" button
    Then I should see "Labor"
    And I should see "Dentist"
    And I should see "Hygienist"
    And I should see "Assistant"
    And I should see "Other"
    And I should see "Total hours at school"
    And I should see "Total hours traveling to and from school"
    And I should see "Total miles traveling to and from school"
    And I should see "Vehicles"
    And I should see "No. owned/operated by SSP driven to event"
    And I should see "Total miles driven for event"

  Scenario: User edits an existing event detail
    Given there is an existing event detail
    And I am on the event details edit page
    When I change the Event Date to "2023-11-10"
    And I click the "Create Event" button
    Then I should see "Event detail was successfully updated."

  Scenario: There are one or more event displayed
    Given I am on the event detail form page
    When I fill in the Event Date with "2023-10-26"
    And I fill in the School with "Sample School"
    And I fill in the Consent Forms Distributed with "10"
    And I fill in the Dentist Hours with "5"
    And I fill in the Hygienist Hours with "3"
    And I fill in the Assistant Hours with "2"
    And I fill in the Other Hours with "1"
    And I fill in the Dentist Travel Hours with "1"
    And I fill in the Hygienist Travel Hours with "2"
    And I fill in the Assistant Travel Hours with "1.5"
    And I fill in the Other Travel Hours with "0.5"
    And I fill in the Dentist Travel Miles with "10"
    And I fill in the Hygienist Travel Miles with "20"
    And I fill in the Assistant Travel Miles with "15"
    And I fill in the Other Travel Miles with "5"
    And I fill in the No. owned/operated by SSP driven to event with "3"
    And I fill in the Total miles driven for event with "45"
    And I click the "Create Event" button
    Then I should see "Event detail was successfully created."
    And I click the "Back to event details" button
    Then I should see "Show this event detail"
