let map;
let autocomplete;
let infoWindow;

async function initMap() {
  const { Map, InfoWindow } = await google.maps.importLibrary("maps");
  const { Autocomplete } = await google.maps.importLibrary("places");

  // Initialize map
  let center = new google.maps.LatLng(44.9537, -93.0900);
  map = new Map(document.getElementById("map"), {
    center: center,
    zoom: 11,
    mapId: "DEMO_MAP_ID",
  });

  // Initialize InfoWindow for displaying place details
  infoWindow = new InfoWindow();

  // Set up Autocomplete
  const input = document.getElementById("search-box");
  autocomplete = new Autocomplete(input, {
    fields: ["geometry", "name"],
  });

  // Add listener for place selection
  autocomplete.addListener("place_changed", async () => {
    const place = autocomplete.getPlace();
    if (!place.geometry) {
      console.error("No geometry available for this place.");
      return;
    }

    // Center the map on the selected place
    map.setCenter(place.geometry.location);
    map.setZoom(15);

    // Search for nearby historical landmarks
    nearbySearch(place.geometry.location);
  });

  // Initial nearby search
  nearbySearch(center);
}

async function nearbySearch(center) {
  const { Place, SearchNearbyRankPreference } = await google.maps.importLibrary("places");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  // Create the request object
  const request = {
    fields: ["displayName", "location"],
    locationRestriction: {
      center: center,
      radius: 2000,
    },
    includedPrimaryTypes: ["historical_landmark"],
    maxResultCount: 20,
    rankPreference: SearchNearbyRankPreference.POPULARITY,
    language: "en-US",
    region: "us",
  };

  // Perform the search
  //@ts-ignore
  const { places } = await Place.searchNearby(request);

  // Get the landmarks list container
  const landmarkList = document.getElementById("landmarks");
  landmarkList.innerHTML = ""; // Clear previous results

  if (places.length) {
    const { LatLngBounds } = await google.maps.importLibrary("core");
    const bounds = new LatLngBounds();

    // Clear existing markers
    map.markers?.forEach((marker) => marker.setMap(null));
    map.markers = [];

    // Loop through results and add markers
    places.forEach((place) => {
      const marker = new AdvancedMarkerElement({
        map,
        position: place.location,
        title: place.displayName,
      });

      // Store markers in the map object
      map.markers.push(marker);

      // Extend map bounds to include the marker
      bounds.extend(place.location);

      // Add a click listener to display place details
      marker.addListener("click", () => {
        infoWindow.setContent(`<div><strong>${place.displayName}</strong></div>`);
        infoWindow.open(map, marker);
      });

      // Add the landmark to the list
      const listItem = document.createElement("li");
      listItem.textContent = place.displayName;
      listItem.className = "list-group-item-action";
      landmarkList.appendChild(listItem);

      // Add a click listener to the list item to focus the marker
      listItem.addEventListener("click", () => {
        map.setCenter(place.location);
        map.setZoom(15);
        infoWindow.setContent(`<div><strong>${place.displayName}</strong></div>`);
        infoWindow.open(map, marker);
      });
    });

    map.fitBounds(bounds);
  } else {
    landmarkList.innerHTML = "<li class='list-group-item-action'>No results found.</li>";
  }
}

initMap();
