import 'dart:developer';

import 'widget/pollutant_place_widget.dart';
import 'widget/surfae_water_widget.dart';
import 'widget/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/current_location_controller.dart';
import '../../app/shared_widgets/label_widget.dart';
import '../../data/controller/land_form/land_form_controller.dart';
import '../../data/controller/pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../../data/controller/report/add_report_controller.dart';
import '../../data/controller/report/ground_water_controller.dart';
import '../../data/controller/report/residential_area_controller.dart';
import '../../data/controller/report/vegetation_controller.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/land_form_widget.dart';
import 'widget/pollutant_reactivities_widget.dart';
import 'widget/report_divider_widget.dart';
import 'widget/report_radio_widget.dart';

class AddReportScreen extends StatelessWidget {
  AddReportScreen({Key? key, required this.epicenterId}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final int epicenterId;

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
                            const LabelWidget(
                                label: "Extent Of Polluation Description"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
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
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Epicenter Size"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
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
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Polluation Size"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
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
                            //! divider
                            const ReportDividerWidget(),
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
                            //! divider
                            const ReportDividerWidget(),
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
                            //! divider
                            const ReportDividerWidget(),
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
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Land Form "),
                            const LandFormWidget(),
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Pollutant Reactivities"),
                            const PollutantReactivitiesWidget(),
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Pollutant Place"),
                            const PollutantPlaceWidget(),
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Surface Water"),
                            const SurfaceWaterWidget(),
                            //! divider
                            const ReportDividerWidget(),
                            const LabelWidget(label: "Weather "),
                            const WeatherWidget(),
                            //! divider
                            const ReportDividerWidget(),
                          ],
                        ),
                      ),
                    ),
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
                                                        return InkWell(
                                                          focusColor:
                                                              ColorManager
                                                                  .primary,
                                                          highlightColor:
                                                              ColorManager
                                                                  .error,
                                                          onTap: () {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              _formKey
                                                                  .currentState!
                                                                  .save();
                                                              log("lat : ${location.currentLat} , long : ${location.currentLong}");
                                                              log("extentOfPolluationDescription : ${reportCtrl.extentOfPolluationDescription}");
                                                              log("epicenterSize : ${reportCtrl.epicenterSize}");
                                                              log("polluationSize : ${reportCtrl.polluationSize}");
                                                              log("landFormCtrl : ${landFormCtrl.landFormId.value}");
                                                              log("pollutantReactivitiesCtrl : ${pollutantReactivitiesCtrl.pollutantReactivitiesId.value}");
                                                              log("ResidentialAreaRadioController : ${resCtrl.charcter == ResidentialAreaRadio.yes ? true : false}");
                                                              log("VegetationRadioController : ${vegCtrl.charcter == VegetationRadio.yes ? true : false}");
                                                              log("EpicenterId : $epicenterId");
                                                              log("GroundWaterRadioController : ${groundCtrl.charcter == GroundWaterRadio.yes ? true : false}");
                                                            }
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                MediaSize.m50,
                                                            color: ColorManager
                                                                .primary,
                                                            child: Text(
                                                              'Confirm Report',
                                                              style: getLightStyle(
                                                                  color:
                                                                      ColorManager
                                                                          .white,
                                                                  fontSize:
                                                                      FontSize
                                                                          .s18),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        );
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
