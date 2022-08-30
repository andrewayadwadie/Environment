import 'package:get/get.dart';

class AddReportController extends GetxController {
  String extentOfPolluationDescription = "";
  double epicenterSize = 0.0;
  double polluationSize = 0.0;
 
  void changeExtentOfPolluationDescription(String? value) {
    extentOfPolluationDescription = value ?? "";
    update();
  }

  void changeEpicenterSize(String? value) {
    epicenterSize = double.parse(value ?? "0.0");
    update();
  }

  void changePolluationSize(String? value) {
    polluationSize = double.parse(value ?? "0.0");
    update();
  }

 
}
