Feature: Display Table of Patients
    
    Scenario: Going to Patient Details Form
        Given I am on the Patient Display page
        When I click the New Patient Details button
        Then I should be taken to the patient details form
    
    Scenario: Display created entry 
        Given I have created a patient entry
        When I go to the patient display page
        Then I should see that entry
    
    Scenario: Visiting Patient Screening page
        Given I have created a patient entry
        Given I am on the Patient Display page
        When I click Show This Patient's Details
        And I click Screening
        Then I should be on the screening form

    Scenario: Visiting Patient Preventive Service page
        Given I have created a patient entry
        Given I am on the Patient Display page
        When I click Show This Patient's Details
        And I click Preventive Service
        Then I should be on the screening form
    
    Scenario: Visiting Patient Follow Up page
        Given I have created a patient entry
        Given I am on the Patient Display page
        When I click Show This Patient's Details
        And I click Follow Up
        Then I should be on the screening form

    Scenario: Editing a Patient's Details
        Given I have created a patient entry
        Given I am on the Patient Display page
        When I click Show This Patient's Details
        And I click Edit this patients details
        And I change the Age to 8
        And I click Update Patient detail
        Then I should see a message confirming the update
        And the patient's age should be 8

    Scenario: Deleting a Patient's details
        Given I have created a patient entry
        Given I am on the Patient Display page
        When I click Show This Patient's Details
        And I click on Destroy this patient detail
        Then I should see a message confirming the deletion
         


