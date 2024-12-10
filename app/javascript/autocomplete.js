document.addEventListener("DOMContentLoaded", () => {
    let autocomplete;
    let map;
    let marker;
  
    // Initialize Map
    async function initMap() {
      const { Map } = await google.maps.importLibrary("maps");
      const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
  
      // Default position (St. Paul)
      const defaultPosition = { lat: 44.9537, lng: -93.0900 };
  
      // Create the map
      map = new Map(document.getElementById("map"), {
        zoom: 14,
        center: defaultPosition,
        mapId: "Landmark",
      });


      // The marker
     const marker = new AdvancedMarkerElement({
        map: map,
        position: defaultPosition,
        title: "St. Paul",
      });
  
      // Initialize Autocomplete after the map is ready
      initAutocomplete();
    }
  
    // Initialize Autocomplete
    function initAutocomplete() {
      autocomplete = new google.maps.places.Autocomplete(
        document.getElementById("autocomplete"),
        {
          types: ["geocode", "establishment"],
          componentRestrictions: { country: "US" },
          fields: ["place_id", "geometry", "formatted_address", "name"],
        }
      );
  
      autocomplete.addListener("place_changed", onPlaceChanged);
  
      // Get existing latitude and longitude from the hidden fields
      const lat = parseFloat(document.getElementById("lat").value);
      const lng = parseFloat(document.getElementById("lng").value);

      // If coordinates exist, update map with saved coordinates
      if (!isNaN(lat) && !isNaN(lng)) {
        const position = { lat, lng };
        updateMap(position.lat, position.lng);
  
      }
    }
  
    // Handle Place Change
    function onPlaceChanged() {
      const place = autocomplete.getPlace();
  
      if (!place.geometry) {
        document.getElementById("autocomplete").placeholder = "Enter a valid place";
      } else {
        const { lat, lng } = place.geometry.location;
        const name = place.name;
        const address = place.formatted_address
  
        // Update the hidden lat/lng input fields
        document.getElementById("lat").value = lat();
        document.getElementById("lng").value = lng();
        
        // Update the address field with the selected place's address
        document.getElementById("autocomplete").value = address;

        // Update the map and marker
        updateMap(lat(), lng(), name);
      }
    }
  
    // Update Map Position
    function updateMap(lat, lng, name = "Selected Location") {
      const position = { lat, lng };
  
      // Pan map to new position
      map.setCenter(position);
  
      // Update marker position
      marker.position(position);
      marker.title(name); // Use the name of the place for the marker's title
    }
  
    // Initialize the map and autocomplete
    initMap();
    initAutocomplete();
  });
  