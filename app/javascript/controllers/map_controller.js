import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ["map"];
  static values = { markers: Array }

  connect() {
    const MAPBOX_API_KEY = this.mapTarget.dataset.mapboxApiKey;

    mapboxgl.accessToken = MAPBOX_API_KEY;
    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [0, 0],
      zoom: 5
    });

    this.addMarkersToMap();
    this.setMapCenter();
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map);
    });
  }

  setMapCenter() {
    if (this.markersValue.length > 0) {
      const firstMarker = this.markersValue[0];
      this.map.setCenter([firstMarker.lng, firstMarker.lat]);
    }
  }
}

