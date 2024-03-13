window.initMap = function(lat, lng) {
  mapboxgl.accessToken = 'pk.eyJ1IjoibG9yZW56b2JjMjAyMyIsImEiOiJjbHBqdWp6aTYwMzNzMmpteXp6MDVoYzkyIn0.Cj9LGQ3Fm3jTAHCpHFuc1g';

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
