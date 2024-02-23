function updateUntreatedCavities() {
    let untreatedCavitiesCount = 0;

    for (const tooth in selectedOptions) {
        if (selectedOptions[tooth] === 'D') {
            untreatedCavitiesCount++;
        }
    }

    const untreatedCavitiesElement = document.getElementById('untreatedCavities');

    // Update the "Untreated Cavities" field
    untreatedCavitiesElement.textContent = untreatedCavitiesCount;
}

function updateReferredTreatment() {
    let ReferredTreatmentCount = 0;

    for (const tooth in selectedOptions) {
        if (selectedOptions[tooth] === 'RS') {
            ReferredTreatmentCount++;
        }
    }

    const referredTreatmentElement = document.getElementById('referredTreatment');

    // Update the "Untreated Cavities" field
    referredTreatmentElement.textContent = ReferredTreatmentCount;
}

function updateCariesExperience() {
    let CariesExperienceCount = 0;

    for (const tooth in selectedOptions) {
        if (selectedOptions[tooth] === 'F') {
            CariesExperienceCount++;
        }
    }

    const cariesExperienceElement = document.getElementById('cariesExperience');

    // Update the "Untreated Cavities" field
    cariesExperienceElement.textContent = CariesExperienceCount;
}

function updateSealantPresent() {
    let SealantPresentCount = 0;

    for (const tooth in selectedOptions) {
        if (selectedOptions[tooth] === 'S') {
            SealantPresentCount++;
        }
    }

    const sealantPresentElement = document.getElementById('sealantPresent');

    // Update the "Untreated Cavities" field
    sealantPresentElement.textContent = SealantPresentCount;
}

function updateRecommendedResealed() {
    let RecommendedResealedCount = 0;

    for (const tooth in selectedOptions) {
        if (selectedOptions[tooth] === 'RSD') {
            RecommendedResealedCount++;
        }
    }

    const recommendedResealedElement = document.getElementById('recommendedResealed');

    // Update the "Untreated Cavities" field
    recommendedResealedElement.textContent = RecommendedResealedCount;
}

function updateRecommendedResealedNot() {
    let RecommendedResealedNotCount = 0;

    for (const tooth in selectedOptions) {
        if (selectedOptions[tooth] === 'RSND') {
            RecommendedResealedNotCount++;
        }
    }

    const recommendedResealedNotElement = document.getElementById('recommendedResealedNot');

    // Update the "Untreated Cavities" field
    recommendedResealedNotElement.textContent = RecommendedResealedNotCount;
}