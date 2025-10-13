import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResponsiveController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600; 
  }
}
