# spec/features/statistics_spec.rb

require 'rails_helper'

RSpec.feature 'Statistics', type: :feature do
  
  scenario 'Check the presence of statistics and buttons' do
    visit '/child_data' # Replace with the actual URL of your page

    expect(page).to have_selector('h1', text: 'Statistics')
    expect(page).to have_selector('.statistics-container', visible: true)
    expect(page).to have_selector('.statistics-item', count: 4)
    expect(page).to have_button('Screening')
    expect(page).to have_button('Preventative')
    expect(page).to have_button('Follow Up')
  end
  
  scenario 'Check the default values of statistics' do
    visit '/child_data' # Replace with the actual URL of your page

    expect(page).to have_content('Untreated Cavities: 0')
    expect(page).to have_content('Caries Experience: 0')
    expect(page).to have_content('Sealants Present: 0')
    expect(page).to have_content('Referred for treatment: 0')
  end

  scenario 'Check the presence of buttons and initial cell text' do
    visit '/child_data' # Replace with the actual URL of your page

    # Check for the presence of buttons in the first row of the table
    (1..3).each do |tooth_number|
      expect(page).to have_selector("button[data-popup='popup#{tooth_number}']", text: tooth_number.to_s)
    end

    (4..13).each do |tooth_number|
      expect(page).to have_selector("button[data-popup='popup#{tooth_number}']", text: "#{tooth_number}#{('A'..'J').to_a[tooth_number - 4]}")
    end

    (14..16).each do |tooth_number|
      expect(page).to have_selector("button[data-popup='popup#{tooth_number}']", text: tooth_number.to_s)
    end

    # Check the text in the initial cells
    (1..16).each do |tooth_number|
      expect(page).to have_selector("td[data-cell='popup#{tooth_number}']", text: 'Make a selection')
    end
  end

end

# # spec/features/screening_spec.rb

# require 'rails_helper'

# RSpec.feature 'Screening page' do
#   scenario 'displays the screening page and interacts with popups' do
#     visit '/screening'  # Adjust the URL to match your route

#     # Test the initial state of the page
#     # expect(page).to have_content('Screening')
#     expect(page).to have_selector('.button', count: 35)
#     expect(page).to have_selector('.popup-container', count: 32)
#     expect(page).to have_content('Untreated Cavities: 0')
#     expect(page).to have_content('Caries Experience: 0')
#     expect(page).to have_content('Sealants Present: 0')
#     expect(page).to have_content('Referred for treatment: 0')

#     # Test interacting with popups
#     # You can use Capybara to click buttons, select radio options, etc.
#     find('.button', text: '31').click
#     within('.popup-container', text: '31') do
#       find('.popup-box-small label', text: 'D - Decay').click
#       find('button', text: 'Close').click
#     end

#     # Ensure the selected option appears in the corresponding cell
#     within('.popup-container', text: '31') do
#       expect(page).to have_content('D - Decay')
#     end

#     # Test updates to the summary elements
#     expect(page).to have_content('Untreated Cavities: 1')
#     expect(page).to have_content('Caries Experience: 0')
#     expect(page).to have_content('Sealants Present: 0')
#     expect(page).to have_content('Referred for treatment: 0')
#   end

#   # Add more scenarios to test other interactions and functionality
# end


