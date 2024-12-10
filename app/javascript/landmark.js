document.addEventListener("DOMContentLoaded", () => {
    // Initialize and add the map
let map;
async function initMap() {
  // The location of landmark
  const position = { lat: landmark.lat, lng: landmark.lng };
  // Request needed libraries.
  //@ts-ignore
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
  // The map
  map = new Map(document.getElementById("map"), {
    zoom: 14,
    center: position,
    mapId: "Landmark"
  });
  // The marker
  const marker = new AdvancedMarkerElement({
    map: map,
    position: position,
    title: landmark.title,
  });
}
initMap();
});