
  Given('I am on the Patient Details Form page') do
    visit '/patient_details/new'
  end

  Given('I am logged in') do
    visit '/login'
    fill_in 'session[username]', :with => 'sgullion'
    fill_in 'session[password]', :with => 'Licanius'
    click_button "Login"
  end

  When("I enter the date with {string}") do |string|
    fill_in "patient_detail[Date]", :with => string
  end

  When('I enter the Patientid field with {int}') do |int|
    fill_in "patient_detail[PatientId]", :with => int
  end
  
  When('I enter the Program Name field with {string}') do |string|
    fill_in "patient_detail[ProgramName]", :with => string
  end
  
  When('I enter the School Name field with {string}') do |string|
    fill_in "patient_detail[SchoolName]", :with => string
  end
  
  When('I enter the Age field with {int}') do |int|
    fill_in "patient_detail[Age]", :with => int
  end
  
  When('I choose the date {string}') do |string|
    pending
  end
  
  When("I enter the Insurance field with {string}") do |ins|
    fill_in 'patient_detail[Insurance]', :with => ins
  end

  When("I enter the Grade field with {string}") do |grade|
    fill_in 'patient_detail[Grade]', :with => grade
  end
  
  When('I click Create Patient detail') do
    click_button "Create Patient detail"
  end
  
  Then('I should see a patient detail validation message') do
    expect(page).to have_content("Patient detail was successfully created.")
  end
  
  Then('I should see an error message for age') do
    expect(page).to have_content("Age can't be blank")
  end
  
  Then('I should see an error message for school name') do
    expect(page).to have_content("Schoolname can't be blank")
  end

  Then('I should see an error message for insurance') do
    expect(page).to have_content("Insurance is required")
  end
  
  Then('I should see an error message for grade') do
    expect(page).to have_content("Grade can't be blank")
  end


  Given('I am on the Patient Display page') do
    visit "/patient_details"
  end
  
  When('I click the New Patient Details button') do
    click_button "New patient detail"
  end
  
  Then('I should be taken to the patient details form') do
    expect(page.has_current_path?('/patient_details/new')).to be_truthy
  end
  
  Given('I have created a patient entry') do

    visit '/patient_details/new'
    fill_in 'patient_detail[PatientId]', :with => 24
    fill_in 'patient_detail[ProgramName]', :with => "Lorem"
    fill_in 'patient_detail[SchoolName]', :with => "test elementary"
    fill_in 'patient_detail[Age]', :with => 7
    fill_in 'patient_detail[Insurance]', :with => "blue cross"
    fill_in 'patient_detail[Grade]', :with => "fifth"
    fill_in "patient_detail[Date]", :with => "04/04/2023"
    click_button "Create Patient detail"
    visit "/patient_details"

  end
  
  When('I go to the patient display page') do
    visit "/patient_details"
  end
  
  Then('I should see that entry') do
    expect(page).to have_content("Lorem")
    expect(page).to have_content("test elementary") 
  end
  
  When("I click Show This Patient's Details") do
    click_button "Show this Patient's Details"
  end
  
  When('I click Screening') do
    click_button "screeningButton"
  end
  
  Then('I should be on the screening form') do
    expect(page.has_current_path?('/screening')).to be_truthy
  end
  
  When('I click Preventive Service') do
    click_button "preventiveservicesButton"
  end
  
  When('I click Follow Up') do
    click_button "FollowUpButton"
  end
  
  When('I click Edit this patients details') do
    click_button "Edit this patient detail"
  end
  
  When('I change the Age to {int}') do |int|
    fill_in "patient_detail[Age]", :with => int
  end
  
  When('I click Update Patient detail') do
    click_button "Update Patient detail"
  end
  
  Then('I should see a message confirming the update') do
    expect(page).to have_content("Patient detail was successfully updated.")
  end
  
  Then("the patient's age should be {int}") do |int|
    expect(page).to have_content(int)
  end

  When('I click New patient details') do
    click_button "New patient detail"
  end

  When('I click on Destroy this patient detail') do
    click_button "Destroy this patient detail"
  end
  
  Then('I should see a message confirming the deletion') do
    expect(page).to have_content("Patient detail was successfully destroyed.")
  end

  Then('I should see an error message for date') do
    expect(page).to have_content("Date can't be blank")
  end