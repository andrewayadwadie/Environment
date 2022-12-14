
 

import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../presentation/Home/home_screen.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../network/auth_services.dart';
 

class LoginController extends GetxController {
  bool vis = true;

  RxBool loading = true.obs;

  void sendLoginData({required String? email, required String? password}) {
    loading.value = false;
    AuthServices.login(email: email ?? Constants.empty, password: password ?? Constants.empty)
        .then((res) {
      //! success
      if (res.runtimeType == List) {
        loading.value = true;
        SharedPreferencesHelper.setTokenValue(res[0].toString());
        SharedPreferencesHelper.setExpireDateValue(res[1].toString());
        SharedPreferencesHelper.setRoleValue(res[2].toString());
         

        Get.offAll(()=>  HomeScreen());
        //!Error
      } else if (res.runtimeType == String) {
        loading.value = true;
        Get.defaultDialog(
          title: AppStrings.error,
          middleText: res.toString(),
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor:  ColorManager.error,
          backgroundColor:ColorManager.white  ,
        );
      }
    });
  }

  void eyetToggle() {
    vis = !vis;
    update();
  }
}
