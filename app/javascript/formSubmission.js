document.addEventListener("submit", function(event) {
    event.preventDefault();
    // console.log("Form Submitted");

    if (event.submitter && event.submitter.id === "submitButton") {
        var form = event.target;

        var childLevelDetailID = new URLSearchParams(window.location.search).get('patient_detail_id');
        // var pid = form.querySelector('[name="child_level_detail[PID]"]').value;

        if (childLevelDetailID) {
            // If an ID exists, this is an update
            form.action = '/child_level_details/' + childLevelDetailID;
            form.method = 'patch';
        } else {
            // If there's no ID, it's a new record creation
            form.action = '/patient_details/' + pid + '/child_level_details';
            form.method = 'post';
        }

        // Set the value of TeethScreening using your existing logic
        var TeethScreeningStr = JSON.stringify(selectedOptions);
        var TeethScreeningInput = form.querySelector('[name="child_level_detail[TeethScreening]"]');
        TeethScreeningInput.value = TeethScreeningStr;

        form.submit();
    }
});