
import 'package:get/get.dart';

import '../../domain/model/epicenter_model.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../network/all_epicenter_service.dart';

class AllEpicenterController extends GetxController {
  RxBool loading = true.obs;
  List<EpicenterModel> allEpicenter = [];
  @override
  void onInit() {
    getAllEpicenter();
    super.onInit();
  }

  void getAllEpicenter() {
    // loading.value = false;
    AllEpicenterServices.getAllEpicenter().then((res) {
      //! success
      if (res.runtimeType == List<EpicenterModel>) {
        loading.value = false;
        allEpicenter = res;
      } else if (res == 500) {
        //!Server Error
        loading.value = false;
        Get.defaultDialog(
          title: AppStrings.serverErrorTitle,
          middleText: AppStrings.serverError,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      } else if (res == 400) {
        loading.value = false;
        Get.defaultDialog(
          title: AppStrings.error,
          middleText: AppStrings.errorMsg,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      }
    });
  }
}
