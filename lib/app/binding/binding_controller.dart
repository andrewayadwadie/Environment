import 'package:get/get.dart';

import '../../data/controller/epicenter/all_epicenter_controller.dart';
import '../../data/controller/land_form/land_form_controller.dart';
import '../../data/controller/pollutant_place/pollutant_place_controller.dart';
import '../../data/controller/pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../../data/controller/surface_water/surface_water_controller.dart';
import '../../data/controller/weather/weather_controller.dart';
import '../internet_connectivity_controller.dart';

class IntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetController>(() => InternetController(), fenix: true);
    Get.lazyPut<PollutantPlaceController>(() => PollutantPlaceController(),
        fenix: true);
    Get.lazyPut<AllLandFormController>(() => AllLandFormController(),
        fenix: true);
    Get.lazyPut<AllPollutantReactivitiesController>(
        () => AllPollutantReactivitiesController(),
        fenix: true);
    Get.lazyPut<SurfaceWaterController>(() => SurfaceWaterController(),
        fenix: true);
    Get.lazyPut<WeatherController>(() => WeatherController(), fenix: true);
    Get.lazyPut<AllEpicenterController>(() => AllEpicenterController(),
        fenix: true);
        
  }
}
