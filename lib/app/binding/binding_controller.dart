import 'package:get/get.dart';

import '../internet_connectivity_controller.dart';

class IntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetController>(() => InternetController(), fenix: true);
  }
}
