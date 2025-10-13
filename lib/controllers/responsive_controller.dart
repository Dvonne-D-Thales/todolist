import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {
    var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value =
        constraints.maxWidth <
        600; //640px threshold for mobile but 600 is more common
  }
}