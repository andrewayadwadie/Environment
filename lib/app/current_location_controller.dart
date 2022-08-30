import 'package:get/get.dart';
import 'package:location/location.dart';

class CurrentLocationController extends GetxController {
  @override
  void onInit() {
    getLocationByLocation();
    super.onInit();
  }

  final Location location = Location();

  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  double? _lat;
  double? _long;

  get currentLat => _lat;

  get currentLong => _long;
  getLocationByLocation() async {
    if (permissionGranted == null || locationData == null) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      location.getLocation().then((currentLocation) {
        _lat = currentLocation.latitude;
        _long = currentLocation.longitude;
        update();
      });
    }
  }
}
