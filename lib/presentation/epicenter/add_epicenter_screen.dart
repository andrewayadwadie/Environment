import 'dart:developer';

import 'package:enivronment/data/network/add_epicenter_service.dart';
import 'package:enivronment/domain/model/epicenter/add_epicenter_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/shared_widgets/label_widget.dart';
import '../../../data/controller/epicenter/add_epicenter_controller.dart';
import '../../../data/controller/epicenter/epicenter_image_picker_controller.dart';
import '../../../data/controller/location/cities_controller.dart';
import '../../../data/controller/location/governorate_controller.dart';
import '../../../data/controller/location/region_controller.dart';

import '../../app/constants.dart';
import '../../data/controller/polluation_sources/polluation_sources_controller.dart';
import '../login/login_screen.dart';
import '../report/add_report_screen.dart';
import '../report/widget/cities_widget.dart';
import '../report/widget/governorate_widget.dart';
import '../report/widget/polluation_source_widget.dart';
import '../report/widget/region_widget.dart';
import '../report/widget/report_divider_widget.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widgets/epicenter_map_widget.dart';

// ignore: must_be_immutable
class AddEpicenterScreen extends StatelessWidget {
  AddEpicenterScreen({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController reasonCtrl = TextEditingController();
  TextEditingController epicenterSizeCtrl = TextEditingController();
  TextEditingController sizeCtrl = TextEditingController();
  int cityId = 0;
  AllPolluationSourcesController polluationSourcesCtrl =
      Get.find<AllPolluationSourcesController>();

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
            "Add New HotSpot".tr,
            overflow: TextOverflow.clip,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ),
      body: GetBuilder<AddEpicenterController>(
          init: AddEpicenterController(),
          builder: (epicenterCtrl) {
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
                            //! Description
                              LabelWidget(label: "Description ".tr),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
                                controller: descriptionCtrl,
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
                                    labelText: 'Description',
                                    hintText: 'Description',
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.grey),
                                    labelStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.secondary)),
                                onSaved: (val) {
                                  epicenterCtrl.changeDescription(val);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Description';
                                  }
                                  return null;
                                }, // enabledBorder: InputBorder.none,
                              ),
                            ),
                            //? divider
                            const ReportDividerWidget(),

                            //!Reason
                              LabelWidget(label: "Reason ".tr),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p12,
                                  right: AppPadding.p12,
                                  top: AppPadding.p12),
                              child: TextFormField(
                                controller: reasonCtrl,
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
                                    labelText: 'Reason',
                                    hintText: 'Reason',
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.grey),
                                    labelStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.secondary)),
                                onSaved: (val) {
                                  epicenterCtrl.changeReason(val);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Reason';
                                  }
                                  return null;
                                }, // enabledBorder: InputBorder.none,
                              ),
                            ),

                            //? divider
                            const ReportDividerWidget(),
                            //! Epicenter Size
                              LabelWidget(label: "HotSpot Size".tr),
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
                                  epicenterCtrl.changeEpicenterSize(val);
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

                            //! Location
                              LabelWidget(label: "Location".tr),
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
                            //! Add images and preview images
                            Container(
                              width: double.infinity,
                              height: SizeConfig.screenHeight! / MediaSize.m7,
                              decoration: BoxDecoration(
                                  color: ColorManager.lightGrey,
                                  borderRadius: BorderRadius.circular(
                                      BorderRadiusValues.br8)),
                              child: GetBuilder<EpicenterImagePickerController>(
                                  init: EpicenterImagePickerController(),
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
                            //! Polluation Sources
                            const ReportPolluationSourcesWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //! Add Location
                            InkWell(
                              onTap: () {
                                Get.to(() => EpiCenterMapScreen());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height:
                                    SizeConfig.screenHeight! / MediaSize.m15,
                                decoration: BoxDecoration(
                                    color: ColorManager.secondary,
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: ColorManager.white,
                                    ),
                                    Text(
                                      "Add HotSpot Location".tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //!submit data
                    GetBuilder<EpicenterImagePickerController>(
                        init: EpicenterImagePickerController(),
                        builder: (imgCtrl) {
                          return InkWell(
                            focusColor: ColorManager.primary,
                            highlightColor: ColorManager.error,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                log("""

description:${descriptionCtrl.text},
photos:${imgCtrl.imagesList},
lat:${epicenterCtrl.markLat},
long:${epicenterCtrl.markLong},
reason:${reasonCtrl.text},
size:${epicenterSizeCtrl.text},
cityId:$cityId,
polluationSourcesIds:
${polluationSourcesCtrl.polluationSourcesIds}
""");
                                AddEpicenterService.sendEpicenter(
                                        allData: AddEpicenterModel(
                                            description: descriptionCtrl.text,
                                            photos: imgCtrl.imagesList,
                                            lat: epicenterCtrl.markLat,
                                            long: epicenterCtrl.markLong,
                                            reason: reasonCtrl.text,
                                            size: epicenterSizeCtrl.text,
                                            cityId: cityId,
                                            polluationSourcesIds:
                                                polluationSourcesCtrl
                                                    .polluationSourcesIds))
                                    .then((res) {
                                  if (res.runtimeType == String) {
                                    epicenterCtrl.loading.value = false;
                                    Get.defaultDialog(
                                      title: Constants.empty,
                                      middleText: AppStrings.sucuss,
                                      onConfirm: () => Get.back(),
                                      confirmTextColor: ColorManager.white,
                                      buttonColor: ColorManager.error,
                                      backgroundColor: ColorManager.white,
                                    );
                                    //Todo:
                                    Get.offAll(() => AddReportScreen(
                                          epicenterId: int.parse(res),
                                        ));
                                  } else if (res == 400) {
                                    epicenterCtrl.loading.value = false;
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
                                    epicenterCtrl.loading.value = false;
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
                              child: Text(
                                'Confirm Adding HotSpot'.tr,
                                style: getLightStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        })
                  ],
                ));
          }),
    ));
  }
}
