import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandFormController extends GetxController {
  List<String> landFormList = [
    "land form 1 ",
    "land form 2 ",
    "land form 3 ",
    "land form 4 ",
    "land form 5 ",
  ];

  RxString landFormText = 'Land Form '.obs;

  RxInt landFormId = 0.obs;

  void onTapSelected(BuildContext con, int id, index) {
    landFormId.value = id + 1;
    Navigator.pop(con);

    landFormText.value = landFormList[index];

    update();
  }
}
