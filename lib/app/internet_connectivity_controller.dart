import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetController extends GetxController {
  Future<bool> checkInternet() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == false) {
      Get.snackbar(
        'Network Problem',
        "No Internet Connection ".tr,
        backgroundColor: ColorManager.error,
        colorText: ColorManager.white,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      );

      update();
      return false;
    }
    update();
    return true;
  }
}
