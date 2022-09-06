import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants.dart';
import '../../app/current_location_controller.dart';
import '../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../app/shared_widgets/label_widget.dart';
import '../../data/controller/land_form/land_form_controller.dart';
import '../../data/controller/location/cities_controller.dart';
import '../../data/controller/location/governorate_controller.dart';
import '../../data/controller/location/region_controller.dart';
import '../../data/controller/polluation_sources/polluation_sources_controller.dart';
import '../../data/controller/pollutant_place/pollutant_place_controller.dart';
import '../../data/controller/pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../../data/controller/potential_pollutants/potential_pollutants_controller.dart';
import '../../data/controller/report/add_report_controller.dart';
import '../../data/controller/report/ground_water_controller.dart';
import '../../data/controller/report/report_image_picker_controller.dart';
import '../../data/controller/report/residential_area_controller.dart';
import '../../data/controller/report/vegetation_controller.dart';
import '../../data/controller/report_industrial_activites/get_industrial_activities_controller.dart';
import '../../data/controller/report_industrial_polluation_source/industrial_polluation_source_controller.dart';
import '../../data/controller/surface_water/surface_water_controller.dart';
import '../../data/controller/surrounding_buildings/surrounding_buildings_controller.dart';
import '../../data/controller/weather/weather_controller.dart';
import '../../data/network/add_report_service.dart';
import '../../domain/model/report/add_report_model.dart';
import '../Home/home_screen.dart';
import '../login/login_screen.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/cities_widget.dart';
import 'widget/governorate_widget.dart';
import 'widget/industrial_polluation_source_widget.dart';
import 'widget/land_form_widget.dart';
import 'widget/polluation_source_widget.dart';
import 'widget/pollutant_place_widget.dart';
import 'widget/pollutant_reactivities_widget.dart';
import 'widget/potential_pollutants_widget.dart';
import 'widget/region_widget.dart';
import 'widget/report_divider_widget.dart';
import 'widget/report_industrial_activities_widget.dart';
import 'widget/report_radio_widget.dart';
import 'widget/surfae_water_widget.dart';
import 'widget/surrounding_buildings_widget.dart';
import 'widget/weather_widget.dart';

// ignore: must_be_immutable
class AddReportScreen extends StatelessWidget {
  AddReportScreen({Key? key, required this.epicenterId}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final int epicenterId;
  TextEditingController polluationDescriptionCtrl = TextEditingController();
  TextEditingController epicenterSizeCtrl = TextEditingController();
  TextEditingController polluationSizeCtrl = TextEditingController();
  int cityId = 0;
  CurrentLocationController location = Get.find<CurrentLocationController>();
  ResidentialAreaRadioController resCtrl =
      Get.find<ResidentialAreaRadioController>();
  VegetationRadioController vegCtrl = Get.find<VegetationRadioController>();
  GroundWaterRadioController groundCtrl =
      Get.find<GroundWaterRadioController>();
  AllLandFormController landFormCtrl = Get.find<AllLandFormController>();
  AllPollutantReactivitiesController pollutantReactivitiesCtrl =
      Get.find<AllPollutantReactivitiesController>();
  PollutantPlaceController pollutantPlaceCtrl =
      Get.find<PollutantPlaceController>();
  SurfaceWaterController surfaceWaterCtrl = Get.find<SurfaceWaterController>();
  WeatherController weatherCtrl = Get.find<WeatherController>();
  AllIndustrialActivitiesController industrialActivitiesCtrl =
      Get.find<AllIndustrialActivitiesController>();
  AllIndustrialPolluationSourceController industrialPolluationSourceCtrl =
      Get.find<AllIndustrialPolluationSourceController>();
  AllPolluationSourcesController polluationSourcesCtrl =
      Get.find<AllPolluationSourcesController>();

  AllPotentialPollutantsController potentialPollutantsCtrl =
      Get.find<AllPotentialPollutantsController>();

  AllSurroundingBuildingsController surroundingBuildingsCtrl =
      Get.find<AllSurroundingBuildingsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.primary,
        ),
        title: Center(
          child: Text(
            "Add Report".tr,
            overflow: TextOverflow.clip,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              GetBuilder<AddReportController>(
                  init: AddReportController(),
                  builder: (reportCtrl) {
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p12,
                            horizontal: AppPadding.p18),
                        child: ListView(
                          children: [
                            //!Extent Of Polluation Description
                            const LabelWidget(
                                label: "Extent Of Polluation Description"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
                                controller: polluationDescriptionCtrl,
                                keyboardType: TextInputType.text,
                                cursorColor: ColorManager.secondary,
                                style: TextStyle(color: ColorManager.secondary),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    labelText:
                                        'Extent Of Polluation Description',
                                    hintText:
                                        'Extent Of Polluation Description',
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.grey),
                                    labelStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.secondary)),
                                onSaved: (val) {
                                  reportCtrl
                                      .changeExtentOfPolluationDescription(val);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Extent Of Polluation Description';
                                  }
                                  return null;
                                }, // enabledBorder: InputBorder.none,
                              ),
                            ),
                            //? divider
                            const ReportDividerWidget(),
                            //!Epicenter Size
                            const LabelWidget(label: "Epicenter Size"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
                                controller: epicenterSizeCtrl,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorManager.secondary,
                                style: TextStyle(color: ColorManager.secondary),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    labelText: 'Epicenter Size',
                                    hintText: 'Epicenter Size',
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.grey),
                                    labelStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.secondary)),
                                onSaved: (val) {
                                  reportCtrl.changeEpicenterSize(val);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Epicenter Size';
                                  }
                                  return null;
                                }, // enabledBorder: InputBorder.none,
                              ),
                            ),
                            //? divider
                            const ReportDividerWidget(),
                            //!Polluation Size
                            const LabelWidget(label: "Polluation Size"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
                                controller: polluationSizeCtrl,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorManager.secondary,
                                style: TextStyle(color: ColorManager.secondary),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    labelText: 'Polluation Size',
                                    hintText: 'Polluation Size',
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.grey),
                                    labelStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.secondary)),
                                onSaved: (val) {
                                  reportCtrl.changePolluationSize(val);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Polluation Size';
                                  }
                                  return null;
                                }, // enabledBorder: InputBorder.none,
                              ),
                            ),
                            //? divider
                            const ReportDividerWidget(),
                            //!Residential Area
                            const LabelWidget(
                                label: "Is there Residential Area ?"),
                            GetBuilder<ResidentialAreaRadioController>(
                                init: ResidentialAreaRadioController(),
                                builder: (residentialAreaCtrl) {
                                  return ReportRadioWidget(
                                    enumName: ResidentialAreaRadio,
                                    yesValue: ResidentialAreaRadio.yes,
                                    onChangedYes: (val) =>
                                        residentialAreaCtrl.onChange(
                                            val ?? ResidentialAreaRadio.yes),
                                    noValue: ResidentialAreaRadio.no,
                                    onChangedNo: (val) =>
                                        residentialAreaCtrl.onChange(
                                            val ?? ResidentialAreaRadio.no),
                                    groupValue: residentialAreaCtrl.charcter,
                                  );
                                }),
                            //? divider
                            const ReportDividerWidget(),
                            //!vegetation
                            const LabelWidget(label: "Is there vegetation?"),
                            GetBuilder<VegetationRadioController>(
                                init: VegetationRadioController(),
                                builder: (vegetationCtrl) {
                                  return ReportRadioWidget(
                                    enumName: VegetationRadio,
                                    yesValue: VegetationRadio.yes,
                                    onChangedYes: (val) => vegetationCtrl
                                        .onChange(val ?? VegetationRadio.yes),
                                    noValue: VegetationRadio.no,
                                    onChangedNo: (val) => vegetationCtrl
                                        .onChange(val ?? VegetationRadio.no),
                                    groupValue: vegetationCtrl.charcter,
                                  );
                                }),
                            //? divider
                            const ReportDividerWidget(),
                            //!ground water
                            const LabelWidget(label: "Is there ground water ?"),
                            GetBuilder<GroundWaterRadioController>(
                                init: GroundWaterRadioController(),
                                builder: (groundWaterCtrl) {
                                  return ReportRadioWidget(
                                    enumName: GroundWaterRadio,
                                    yesValue: GroundWaterRadio.yes,
                                    onChangedYes: (val) => groundWaterCtrl
                                        .onChange(val ?? GroundWaterRadio.yes),
                                    noValue: GroundWaterRadio.no,
                                    onChangedNo: (val) => groundWaterCtrl
                                        .onChange(val ?? GroundWaterRadio.no),
                                    groupValue: groundWaterCtrl.charcter,
                                  );
                                }),
                            //? divider
                            const ReportDividerWidget(),
                            //!Land Form
                            const LabelWidget(label: "Land Form "),
                            const LandFormWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Pollutant Reactivities
                            const LabelWidget(label: "Pollutant Reactivities"),
                            const PollutantReactivitiesWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Pollutant Place
                            const LabelWidget(label: "Pollutant Place"),
                            const PollutantPlaceWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Surface Water
                            const LabelWidget(label: "Surface Water"),
                            const SurfaceWaterWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Weather
                            const LabelWidget(label: "Weather "),
                            const WeatherWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!location
                            const LabelWidget(label: "Location"),
                            GetX<RegionController>(
                                init: RegionController(),
                                builder: (regionClr) {
                                  return Column(
                                    children: [
                                      const RegionWidget(),
                                      if (regionClr.regionId.value != 0)
                                        GetX<GovernorateController>(
                                            init: GovernorateController(
                                                regionClr.regionId.value),
                                            builder: (governoratCtrl) {
                                              return Column(
                                                children: [
                                                  GovernorateWidget(
                                                      regionId: regionClr
                                                          .regionId.value),
                                                  if (governoratCtrl
                                                          .governorateId
                                                          .value !=
                                                      0)
                                                    GetBuilder<
                                                            CitiesController>(
                                                        init: CitiesController(
                                                            governoratCtrl
                                                                .governorateId
                                                                .value),
                                                        builder: (cityCtrl) {
                                                          return StatefulBuilder(
                                                              builder: (context,
                                                                  setter) {
                                                            setter(() {
                                                              cityId = cityCtrl
                                                                  .citiesId
                                                                  .value;
                                                            });
                                                            return CitiesWidget(
                                                                gocvernorateId:
                                                                    governoratCtrl
                                                                        .governorateId
                                                                        .value);
                                                          });
                                                        }),
                                                ],
                                              );
                                            }),
                                    ],
                                  );
                                }),
                            //? divider
                            const ReportDividerWidget(),
                            //!add images and preview images
                            Container(
                              width: double.infinity,
                              height: SizeConfig.screenHeight! / MediaSize.m7,
                              decoration: BoxDecoration(
                                  color: ColorManager.lightGrey,
                                  borderRadius: BorderRadius.circular(
                                      BorderRadiusValues.br8)),
                              child: GetBuilder<ReportImagePickerController>(
                                  init: ReportImagePickerController(),
                                  builder: (imgCtrl) {
                                    return Row(
                                      children: [
                                        //! preview images
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: AppMargin.m8,
                                                horizontal: AppMargin.m12),
                                            child: ListView.builder(
                                                itemCount:
                                                    imgCtrl.imagesList.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: AppMargin.m8,
                                                        horizontal:
                                                            AppMargin.m8),
                                                    width: SizeConfig
                                                            .screenWidth! /
                                                        MediaSize.m5,
                                                    height: SizeConfig
                                                            .screenWidth! /
                                                        MediaSize.m8,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                imgCtrl.imagesList[
                                                                    index]),
                                                            fit: BoxFit.cover),
                                                        color:
                                                            ColorManager.black,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br5)),
                                                  );
                                                }),
                                          ),
                                        ),
                                        //! Add Icon
                                        InkWell(
                                          onTap: () {
                                            imgCtrl.pickImagesFormGallery();
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: AppMargin.m8),
                                            width: SizeConfig.screenWidth! /
                                                MediaSize.m8,
                                            height: SizeConfig.screenWidth! /
                                                MediaSize.m8,
                                            decoration: BoxDecoration(
                                                color: ColorManager.secondary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        BorderRadiusValues
                                                            .br5)),
                                            child: Icon(
                                              Icons.add_photo_alternate,
                                              color: ColorManager.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            //? divider
                            const ReportDividerWidget(),
                            //!Industrial Activities
                            const ReportIndustrialActivitiesWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Industrial Polluation Source
                            const ReportIndustrialPolluationSourceWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Polluation Source
                            const ReportPolluationSourcesWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Potential Pollutants
                            const ReportPotentialPollutantsWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Surrounding Buildings
                            const ReportSurroundingBuildingsWidget()
                          ],
                        ),
                      ),
                    );
                  }),
              //!submit data
              GetBuilder<ReportImagePickerController>(
                  init: ReportImagePickerController(),
                  builder: (imageCtrl) {
                    return GetX<AddReportController>(
                        init: AddReportController(),
                        builder: (reportCtrl) {
                          return InkWell(
                            focusColor: ColorManager.primary,
                            highlightColor: ColorManager.error,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                AddReportService.sendReport(
                                        allData: ReportModel(
                                            extentOfPolluationDescription:
                                                polluationDescriptionCtrl.text,
                                            photos: imageCtrl.imagesList,
                                            lat: location.currentLat,
                                            long: location.currentLong,
                                            hasResidentialArea: resCtrl.charcter ==
                                                    ResidentialAreaRadio.yes
                                                ? true
                                                : false,
                                            hasVegetation:
                                                vegCtrl.charcter == VegetationRadio.yes
                                                    ? true
                                                    : false,
                                            hasGroundWater:
                                                groundCtrl.charcter == GroundWaterRadio.yes
                                                    ? true
                                                    : false,
                                            epicenterSize:
                                                epicenterSizeCtrl.text,
                                            polluationSize:
                                                polluationSizeCtrl.text,
                                            epicenterId: epicenterId,
                                            cityId: cityId,
                                            landFormId:
                                                landFormCtrl.landFormId.value,
                                            pollutantReactivityId:
                                                pollutantReactivitiesCtrl
                                                    .pollutantReactivitiesId
                                                    .value,
                                            pollutantPlaceId: pollutantPlaceCtrl
                                                .pollutantPlaceId.value,
                                            surfaceWaterId: surfaceWaterCtrl.surfaceWaterId.value,
                                            weatherId: weatherCtrl.weatherId.value,
                                            reportIndustrialActivitiesIds: industrialActivitiesCtrl.industrialActivitiesIds,
                                            reportIndustrialPolluationSourcesIds: industrialPolluationSourceCtrl.industrialPolluationSourceIds,
                                            reportPolluationSourcesIds: polluationSourcesCtrl.polluationSourcesIds,
                                            reportPotentialPollutantsIds: potentialPollutantsCtrl.potentialPollutantsIds,
                                            reportSurroundingBuildingsIds: surroundingBuildingsCtrl.surroundingBuildingsIds))
                                    .then((res) {
                                  if (res == 200) {
                                    reportCtrl.loading.value = false;
                                    Get.defaultDialog(
                                      title: Constants.empty,
                                      middleText: AppStrings.sucuss,
                                      onConfirm: () => Get.back(),
                                      confirmTextColor: ColorManager.white,
                                      buttonColor: ColorManager.error,
                                      backgroundColor: ColorManager.white,
                                    );
                                    Get.offAll(() => HomeScreen());
                                  } else if (res == 400) {
                                    reportCtrl.loading.value = false;
                                    Get.defaultDialog(
                                      title: AppStrings.error,
                                      middleText: AppStrings.errorMsg,
                                      onConfirm: () => Get.back(),
                                      confirmTextColor: ColorManager.white,
                                      buttonColor: ColorManager.error,
                                      backgroundColor: ColorManager.white,
                                    );
                                  } else if (res == 401) {
                                    Get.offAll(() => const LoginScreen());
                                  } else if (res == 500) {
                                    //!Server Error
                                    reportCtrl.loading.value = false;
                                    Get.defaultDialog(
                                      title: AppStrings.serverErrorTitle,
                                      middleText: AppStrings.serverError,
                                      onConfirm: () => Get.back(),
                                      confirmTextColor: ColorManager.white,
                                      buttonColor: ColorManager.error,
                                      backgroundColor: ColorManager.white,
                                    );
                                  }
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: MediaSize.m50,
                              color: ColorManager.primary,
                              child: reportCtrl.loading.value == false
                                  ? const BubbleLoader()
                                  : Text(
                                      'Confirm Adding Report'.tr,
                                      style: getLightStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s18),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          );
                        });
                  })
            ],
          )),
    ));
  }
}
