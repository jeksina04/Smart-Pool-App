import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationService {
  Future<List<Location>> getAddressFromString(String addressString) async {
    return await locationFromAddress(addressString);
  }

  Future<List<Placemark>> getAddressFromLatLng(
      double latitude, double longitude) async {
    return await placemarkFromCoordinates(latitude, longitude);
  }

  openMap(double latitude, double longitude) async {
    Uri uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open the map.';
    }
  }
}
