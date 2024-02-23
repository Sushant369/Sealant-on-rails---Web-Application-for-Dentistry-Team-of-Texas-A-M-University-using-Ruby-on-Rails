const selectedOptions = {}; // Object to hold selected options for each popup

// Function to open the popup and set selected option
function openPopup(popupId) {
    // console.log(selected)
    const popup = document.getElementById(popupId);

    // Show the popup
    if (popup) {
        popup.style.display = 'block';
    }
}

// Function to save the selected option and close the popup
function closePopup(Id, popupId) {
    const radioOptions = document.querySelectorAll(`input[name="radio${Id}"]`);
    const cell = document.querySelector(`td[data-cell="${popupId}"]`); // Add this line to select the corresponding cell

    // Find the selected option for the specific popup
    radioOptions.forEach(option => {
        if (option.checked) {
            // Assuming selectedOptions is declared outside this function
            selectedOptions[Id] = option.value; // Save the selected option to the object
            cell.querySelector('.button').textContent = selectedOptions[Id]; // Update the button text in the cell
        }
    });

    // Close the popup
    closePopupActual(popupId);
    updateUntreatedCavities();
    updateReferredTreatment();
    updateCariesExperience();
    updateSealantPresent();
    updateRecommendedResealed();
    updateRecommendedResealedNot();
}

// Function to close the popup
function closePopupActual(popupId) {
    const popup = document.getElementById(popupId);
    if (popup) {
        popup.style.display = 'none';
    }
}