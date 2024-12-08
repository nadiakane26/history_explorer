document.addEventListener("DOMContentLoaded", () => {
    console.log("This is autocomplete");

    let autocomplete;

    function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
            document.getElementById('autocomplete'),
            {
                types: ['geocode', 'establishment'], // Allow both full addresses and establishments
                componentRestrictions: { country: 'US' }, // Optional: restrict to US addresses
                fields: ['place_id', 'geometry', 'formatted_address', 'name'] // Include full address and name
            }
        );

        // Listen for when the user selects a place from the autocomplete suggestions
        autocomplete.addListener('place_changed', onPlaceChanged);
    }

    function onPlaceChanged() {
        var place = autocomplete.getPlace();

        if (!place.geometry) {
            // User did not select a valid prediction; reset the input field
            document.getElementById('autocomplete').placeholder = 'Enter a place';
        } else {
            // Get the coordinates from the place's geometry object
            var coordinates = place.geometry.location;
            var lat = coordinates.lat();
            var lng = coordinates.lng();

            // Get the full address of the place or establishment
            var address = place.formatted_address;
            var name = place.name;

            // Display the coordinates and address (or establishment name)
            document.getElementById('details').innerHTML = `
                Coordinates: ${lat}, ${lng}<br>
            `;
        }
    }

    // Initialize autocomplete
    initAutocomplete();
});
