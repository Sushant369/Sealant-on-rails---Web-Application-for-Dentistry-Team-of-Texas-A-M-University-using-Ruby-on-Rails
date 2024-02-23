document.addEventListener("DOMContentLoaded", function() {
    ///Code for Screening

    const sections = {
        screening: 2,
        preventative: 3,
        followup: 4
    };

    // Track whether each section is currently visible
    const sectionVisibility = {
        screening: false,
        preventative: false,
        followup: false
    };

    // Add an event listener to the "Screening" button
    document.getElementById("screeningButton").addEventListener("click", function() {
        toggleSectionVisibility("screening");
    });

    // Add an event listener to the "Preventative" button
    document.getElementById("preventativeButton").addEventListener("click", function() {
        toggleSectionVisibility("preventative");
    });

    // Add an event listener to the "Follow Up" button
    document.getElementById("followupButton").addEventListener("click", function() {
        toggleSectionVisibility("followup");
    });

    function toggleSectionVisibility(section) {
        const table1Rows = document.querySelectorAll("#table1 tr");
        const table2Rows = document.querySelectorAll("#table2 tr");

        // Toggle visibility of the section
        sectionVisibility[section] = !sectionVisibility[section];

        // Determine the new display style for the section rows
        const displayStyle = sectionVisibility[section] ? "table-row" : "none";

        // Apply the display style to the section rows
        table1Rows.forEach((row, index) => {
            if (index < sections[section]) {
                row.style.display = displayStyle;
            }
        });

        table2Rows.forEach((row, index) => {
            if (index < sections[section]) {
                row.style.display = displayStyle;
            }
        });
    }

    const preventativeFormContainer = document.getElementById("preventativeFormContainer");
    const followUpFormContainer = document.getElementById("followUpFormContainer");
    const showPreventativeFormButton = document.getElementById("showPreventativeFormButton");
    const showFollowUpFormButton = document.getElementById("showFollowUpFormButton");

    let preventativeFormVisible = false;
    let followUpFormVisible = false;

    showPreventativeFormButton.addEventListener("click", function() {
        if (!preventativeFormVisible) {
            preventativeFormContainer.style.display = "block";
            followUpFormContainer.style.display = "none";
            preventativeFormVisible = true;
            followUpFormVisible = false;
        } else {
            preventativeFormContainer.style.display = "none";
            preventativeFormVisible = false;
        }
    });

    showFollowUpFormButton.addEventListener("click", function() {
        if (!followUpFormVisible) {
            followUpFormContainer.style.display = "block";
            preventativeFormContainer.style.display = "none";
            followUpFormVisible = true;
            preventativeFormVisible = false;
        } else {
            followUpFormContainer.style.display = "none";
            followUpFormVisible = false;
        }
    });

});