import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ["map"];

  connect() {
    const MAPBOX_API_KEY = this.mapTarget.dataset.mapboxApiKey;

    mapboxgl.accessToken = MAPBOX_API_KEY;
    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [0, 0],
      zoom: 5
    });

    this.addPinToMap();
  }

  async addPinToMap() {
    const response = await fetch('https://restcountries.com/v3.1/all');
    const countries = await response.json();

    const randomCountry = countries[Math.floor(Math.random() * countries.length)];

    const lng = randomCountry.latlng[1];
    const lat = randomCountry.latlng[0];

    this.map.setCenter([lng, lat]);

    new mapboxgl.Marker()
      .setLngLat([lng, lat])
      .addTo(this.map);
  }
}
