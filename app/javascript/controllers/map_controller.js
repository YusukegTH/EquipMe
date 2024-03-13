import { Controller } from "stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ["map"];

  connect() {
    mapboxgl.accessToken = process.env.MAPBOX_ACCESS_TOKEN;
    const latitude = parseFloat(this.data.get("latitude"));
    const longitude = parseFloat(this.data.get("longitude"));

    const map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [longitude, latitude],
      zoom: 14
    });

    new mapboxgl.Marker().setLngLat([longitude, latitude]).addTo(map);
  }
}