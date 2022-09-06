import 'package:get/get.dart';

import '../../../app/constants.dart';

class AddReportController extends GetxController {
  String extentOfPolluationDescription = Constants.empty;
  double epicenterSize = 0.0;
  double polluationSize = 0.0;
  RxBool loading = true.obs;

  void changeExtentOfPolluationDescription(String? value) {
    extentOfPolluationDescription = value ?? Constants.empty;
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
