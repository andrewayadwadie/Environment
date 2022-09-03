import 'package:get/get.dart';

class AddEpicenterController extends GetxController {
  String description = "";
  double epicenterSize = 0.0;
  double reason = 0.0;
  double markLat = 0.0;
  double markLong = 0.0;

  void setEpicenterLocation(double lat, double long) {
    markLat = lat;
    markLong = long;
    update();
  }

  void changeDescription(String? value) {
    description = value ?? "";
    update();
  }

  void changeEpicenterSize(String? value) {
    epicenterSize = double.parse(value ?? "0.0");
    update();
  }

  void changeReason(String? value) {
    reason = double.parse(value ?? "0.0");
    update();
  }
}
