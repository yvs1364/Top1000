import "bootstrap";
import {initAutocomplete} from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox.js';
import {geolocateUser} from "../plugins/geolocation.js.erb"

initAutocomplete();
initMapbox();
geolocateUser();
