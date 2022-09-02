import 'dart:developer';

import 'package:enivronment/presentation/report/widget/potential_pollutants_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/current_location_controller.dart';
import '../../app/shared_widgets/label_widget.dart';
import '../../data/controller/land_form/land_form_controller.dart';
import '../../data/controller/location/cities_controller.dart';
import '../../data/controller/location/governorate_controller.dart';
import '../../data/controller/location/region_controller.dart';
import '../../data/controller/pollutant_place/pollutant_place_controller.dart';
import '../../data/controller/pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../../data/controller/report/add_report_controller.dart';
import '../../data/controller/report/ground_water_controller.dart';
import '../../data/controller/report/report_image_picker_controller.dart';
import '../../data/controller/report/residential_area_controller.dart';
import '../../data/controller/report/vegetation_controller.dart';
import '../../data/controller/surface_water/surface_water_controller.dart';
import '../../data/controller/weather/weather_controller.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/cities_widget.dart';
import 'widget/governorate_widget.dart';
import 'widget/industrial_polluation_source_widget.dart';
import 'widget/land_form_widget.dart';
import 'widget/polluation_source_widget.dart';
import 'widget/pollutant_place_widget.dart';
import 'widget/pollutant_reactivities_widget.dart';
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
            "Add Report",
            overflow: TextOverflow.clip,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ),
      body: GetBuilder<AddReportController>(
          init: AddReportController(),
          builder: (reportCtrl) {
            return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
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
                    ),
                    //!submit data
                    GetBuilder<CurrentLocationController>(
                        init: CurrentLocationController(),
                        builder: (location) {
                          return GetBuilder<ResidentialAreaRadioController>(
                              init: ResidentialAreaRadioController(),
                              builder: (resCtrl) {
                                return GetBuilder<VegetationRadioController>(
                                    init: VegetationRadioController(),
                                    builder: (vegCtrl) {
                                      return GetBuilder<
                                              GroundWaterRadioController>(
                                          init: GroundWaterRadioController(),
                                          builder: (groundCtrl) {
                                            return GetBuilder<
                                                    AllLandFormController>(
                                                init: AllLandFormController(),
                                                builder: (landFormCtrl) {
                                                  return GetBuilder<
                                                          AllPollutantReactivitiesController>(
                                                      init:
                                                          AllPollutantReactivitiesController(),
                                                      builder:
                                                          (pollutantReactivitiesCtrl) {
                                                        return GetBuilder<
                                                                PollutantPlaceController>(
                                                            init:
                                                                PollutantPlaceController(),
                                                            builder:
                                                                (pollutantPlaceCtrl) {
                                                              return GetBuilder<
                                                                      SurfaceWaterController>(
                                                                  init:
                                                                      SurfaceWaterController(),
                                                                  builder:
                                                                      (surfaceWaterCtrl) {
                                                                    return GetBuilder<
                                                                            WeatherController>(
                                                                        init:
                                                                            WeatherController(),
                                                                        builder:
                                                                            (weatherCtrl) {
                                                                          return InkWell(
                                                                            focusColor:
                                                                                ColorManager.primary,
                                                                            highlightColor:
                                                                                ColorManager.error,
                                                                            onTap:
                                                                                () {
                                                                              if (_formKey.currentState!.validate()) {
                                                                                _formKey.currentState!.save();
                                                                                log("lat : ${location.currentLat} , long : ${location.currentLong}");
                                                                                log("EpicenterId : $epicenterId");
                                                                                log("extentOfPolluationDescription : ${polluationDescriptionCtrl.text}");
                                                                                log("epicenterSize : ${epicenterSizeCtrl.text}");
                                                                                log("polluationSize : ${polluationSizeCtrl.text}");
                                                                                log("ResidentialAreaRadioController : ${resCtrl.charcter == ResidentialAreaRadio.yes ? true : false}");
                                                                                log("VegetationRadioController : ${vegCtrl.charcter == VegetationRadio.yes ? true : false}");
                                                                                log("GroundWaterRadioController : ${groundCtrl.charcter == GroundWaterRadio.yes ? true : false}");
                                                                                log("landFormCtrl : ${landFormCtrl.landFormId.value}");
                                                                                log("pollutantReactivitiesCtrl : ${pollutantReactivitiesCtrl.pollutantReactivitiesId.value}");
                                                                                log("pollutantPlaceCtrl : ${pollutantPlaceCtrl.pollutantPlaceId.value}");
                                                                                log("surfaceWaterCtrl : ${surfaceWaterCtrl.surfaceWaterId.value}");
                                                                                log("weatherCtrl : ${weatherCtrl.weatherId.value}");
                                                                                log("cityId : $cityId");
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              alignment: Alignment.center,
                                                                              width: double.infinity,
                                                                              height: MediaSize.m50,
                                                                              color: ColorManager.primary,
                                                                              child: Text(
                                                                                'Confirm Report',
                                                                                style: getLightStyle(color: ColorManager.white, fontSize: FontSize.s18),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  });
                                                            });
                                                      });
                                                });
                                          });
                                    });
                              });
                        })
                  ],
                ));
          }),
    ));
  }
}
