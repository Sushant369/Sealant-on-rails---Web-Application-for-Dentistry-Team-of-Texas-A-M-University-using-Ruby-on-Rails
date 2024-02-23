Feature: Event Detail Form

  Scenario: User submits a new event detail form
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

  Scenario: User submits an incomplete event detail form
    Given I am on the event detail form page
    When I click the "Create Event" button
    Then I should see "prohibited this event_detail from being saved"

  Scenario: User cancels creating a new event detail
    Given I am on the event details page
    When I click the "Add a new event's details" button
    And I should see "Dentist"
    When I change the School to "Something Random"
    When I click the "Back to event details" button
    Then I should be on the event details page

  Scenario: User deletes a detail after creating a form
    Given I am on the event detail form page
    When I fill in the Event Date with "2023-10-22"
    And I fill in the School with "Sample School"
    And I fill in the Consent Forms Distributed with "103"
    And I fill in the Dentist Hours with "5"
    And I fill in the Hygienist Hours with "33"
    And I fill in the Assistant Hours with "22"
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
    When I click the "Destroy this event detail" button
    Then I should see "Event detail was successfully destroyed."
