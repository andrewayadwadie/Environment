import '../epicenter/add_epicenter_screen.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/shared_widgets/loader_widget.dart';
import '../../data/controller/epicenter/all_epicenter_controller.dart';
import '../login/login_screen.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/size_manager.dart';
import '../resources/values_manager.dart';

import 'widget/language_widget.dart';
import 'widget/list_item_widget.dart';
import 'widget/nearst_epicenters_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<Tab> tabs = <Tab>[
    Tab(text: 'all'.tr),
    Tab(text: 'nearst'.tr),
  ];
  AllEpicenterController epicenterCtrl = Get.find<AllEpicenterController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: Container(
                  margin: const EdgeInsets.all(AppMargin.m8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(ImageAssets.splashLogo),
                  )),
                ),
                actions: [
                  //! change Language
                  InkWell(
                    onTap: () {
                      Get.to(() => const LanguageScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: AppMargin.m16, horizontal: AppMargin.m8),
                      width: SizeConfig.screenWidth! / MediaSize.m6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(BorderRadiusValues.br5),
                          border: Border.all(
                              width: AppSize.s1,
                              color: ColorManager.secondary)),
                      child: Text(
                        'language'.tr,
                        style: getSemiBoldStyle(color: ColorManager.secondary),
                      ),
                    ),
                  ),
                  //! Add Epicenter
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: ColorManager.secondary,
                    ),
                    onPressed: () {
                      Get.to(() => AddEpicenterScreen());
                    },
                  ),

                  //!logout
                  IconButton(
                    icon: Image.asset(
                      ImageAssets.logout,
                      width: SizeConfig.screenWidth! / MediaSize.m17,
                      height: SizeConfig.screenHeight! / MediaSize.m17,
                    ),
                    onPressed: () {
                      SharedPreferencesHelper.clearToken();
                      Get.offAll(const LoginScreen());
                    },
                  ),
                ],
                backgroundColor: ColorManager.white,
                bottom: TabBar(
                  labelColor: ColorManager.secondary,
                  labelStyle: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s16),
                  indicatorColor: ColorManager.secondary,
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return ColorManager.lightGrey;
                    }
                    return null;
                  }),
                  tabs: tabs,
                ),
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: Obx(
                        () => Container(
                            padding: const EdgeInsets.only(
                                bottom: AppPadding.p8,
                                top: AppPadding.p20,
                                right: AppPadding.p14,
                                left: AppPadding.p14),
                            width: double.infinity,
                            color: ColorManager.lightGrey,
                            child: epicenterCtrl.loading.value == true
                                ? const LoaderWidget()
                                : epicenterCtrl.allEpicenter.isEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(
                                            AppPadding.p24),
                                        child:
                                            Image.asset(ImageAssets.emptyList),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            epicenterCtrl.allEpicenter.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return ListItemWidget(
                                            images: epicenterCtrl
                                                .allEpicenter[index]
                                                .epicenterPhotos,
                                            title: epicenterCtrl
                                                .allEpicenter[index]
                                                .description,
                                            description: epicenterCtrl
                                                .allEpicenter[index].reason,
                                            date: epicenterCtrl
                                                .allEpicenter[index]
                                                .creationDate,
                                            size: epicenterCtrl
                                                .allEpicenter[index].size,
                                            epicenterId: epicenterCtrl
                                                .allEpicenter[index].id,
                                            lat: epicenterCtrl
                                                .allEpicenter[index].lat,
                                            long: epicenterCtrl
                                                .allEpicenter[index].long,
                                          );
                                        })),
                      )),
                    ],
                  ),
                  NearstEpicentersWidget(),
                ],
              )),
        );
      }),
    );
  }
}
