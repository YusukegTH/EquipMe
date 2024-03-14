window.initMap = function(lat, lng) {
  const mapboxgl = require('mapbox-gl');
  const MAPBOX_API_KEY = process.env.MAPBOX_API_KEY;

  mapboxgl.accessToken = MAPBOX_API_KEY;

  var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [lng, lat],
    zoom: 9
  });

  new mapboxgl.Marker()
    .setLngLat([lng, lat])
    .addTo(map);
}
