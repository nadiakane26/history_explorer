document.addEventListener("DOMContentLoaded", () => {
  let map;

  // Initialize and add the map
  async function initMap() {
    console.log(landmark); 
    // Define the position of the landmark
    const position = { lat: landmark.lat, lng: landmark.lng };

    // Request needed libraries
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary(
      "marker"
    );

    // Create the map
    map = new Map(document.getElementById("map"), {
      zoom: 14,
      center: position,
      mapId: "Landmark",
    });

    // Create an info window
    const infoWindow = new google.maps.InfoWindow();

    // Create a custom pin (optional)
    const pin = new PinElement({
      scale: 1,
    });

    // Create the marker
    const marker = new AdvancedMarkerElement({
      map: map,
      position: position,
      title: landmark.title, // Title for the marker
      content: pin.element,  // Custom pin content (optional)
      gmpClickable: true,    // Enables interactivity
    });

    // Add a click listener to the marker
    marker.addListener("click", () => {
      infoWindow.close(); // Close any previous info windows

      let formattedAddress = landmark.address.replace(/,?\s*USA$/, '').trim();
      formattedAddress = formattedAddress.replace(/,([^,]*)/, ',<br>$1');
      // Format the content with name in bold, address, and a link to Google Maps
      const contentString = `
        <div style = "width: 180px;">
          <strong>${landmark.title}</strong><br>
          <br>
          ${formattedAddress}<br>
          <a href="https://www.google.com/maps?q=${landmark.lat},${landmark.lng}" target="_blank">View on Google Maps</a>
        </div>
      `;

      // Set the content for the info window
      infoWindow.setContent(contentString);
      infoWindow.open(map, marker); // Open the info window on the marker
    });
  }

  // Initialize the map
  initMap();
});
