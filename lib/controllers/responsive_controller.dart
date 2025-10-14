import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    // 🔹 Pastikan update dilakukan setelah frame selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool newValue = constraints.maxWidth < 600;
      if (isMobile.value != newValue) {
        isMobile.value = newValue;
      }
    });
  }
}
