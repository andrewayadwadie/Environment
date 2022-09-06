import 'dart:async';

import 'package:enivronment/data/network/nearst_epicenter_service.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/model/epicenter/epicenter_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';

enum NearstEpicenterRadio { all, notVisited, visited }

class NearstEpicenterController extends GetxController {
  final double lat;
  final double long;
  RxBool loading = true.obs;
  List<EpicenterModel> nearstEpicenter = [];
  NearstEpicenterRadio charcter = NearstEpicenterRadio.all;
  Set<Marker> markers = {};
  Completer<GoogleMapController> compeleteController = Completer();
 
 
  void onRadioChange(NearstEpicenterRadio value) {
    if (value == NearstEpicenterRadio.notVisited) {
      charcter = value;
      update();
      getNearstEpicenter(0, lat, long);
    }   if (value == NearstEpicenterRadio.visited) {
      charcter = value;
      update();
      getNearstEpicenter(1, lat, long);
    } if(value == NearstEpicenterRadio.all) {
      charcter = value;
      update();
      getNearstEpicenter(2, lat, long);
    }
  }

  NearstEpicenterController(this.lat, this.long);
  @override
  void onInit() {
    getNearstEpicenter(2, lat, long);
    super.onInit();
  }

  void setMarker(List<EpicenterModel> allEpicenter) {
    for (var i = 0; i < allEpicenter.length; i++) {
      markers.add(Marker(
          markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
          position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
          infoWindow: const InfoWindow(
            title: "teeeest",
            snippet: "sippet"
          )
          )); update();
    }
   
  }

  void getNearstEpicenter(int status, double lat, double long) {
    loading.value = true;
    NearstEpicenterServices.getNearstEpicenter(status, lat, long).then((res) {
      //! success
      if (res.runtimeType == List<EpicenterModel>) {
        loading.value = false;
        update();
        nearstEpicenter = res;
        setMarker(res);
      } else if (res == 500) {
        //!Server Error
        loading.value = false;
        update();
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
        update();
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
