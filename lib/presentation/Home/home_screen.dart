import 'package:enivronment/app/shared_widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/all_epicenter_controller.dart';
import '../resources/color_manager.dart';
import '../resources/size_manager.dart';
import '../resources/values_manager.dart';
import 'widget/home_header_widget.dart';
import 'widget/list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const HomeHeaderWidget(),
          Container(
            height: AppSize.s4,
            color: ColorManager.primary,
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(
                    bottom: AppPadding.p8,
                    top: AppPadding.p20,
                    right: AppPadding.p14,
                    left: AppPadding.p14),
                width: double.infinity,
                color: ColorManager.lightGrey,
                child: GetX<AllEpicenterController>(
                    init: AllEpicenterController(),
                    builder: (epicenterCtrl) {
                      return epicenterCtrl.loading.value == true
                          ? const LoaderWidget()
                          : ListView.builder(
                              itemCount: epicenterCtrl.allEpicenter.length,
                              itemBuilder: (BuildContext context, index) {
                                return ListItemWidget(
                                  images: epicenterCtrl
                                      .allEpicenter[index].epicenterPhotos,
                                  title:epicenterCtrl
                                      .allEpicenter[index].reason ,
                                  description:epicenterCtrl
                                      .allEpicenter[index].description ,
                                  date : epicenterCtrl
                                      .allEpicenter[index].creationDate,
                                  size: epicenterCtrl
                                      .allEpicenter[index].size,
                                );
                              });
                    })),
          ),
        ]),
      ),
    );
  }
}
