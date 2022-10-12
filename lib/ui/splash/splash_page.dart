import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/splash/splash_controller.dart';
import 'package:sample_app_getx/core/paints/icon_logo_painter.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => const Scaffold(
        body: Center(
          child: CustomPaint(
            painter: IconLogoPainter(
              color: AppColors.black,
            ),
            size: Size(120, 120),
          ),
        ),
      ),
    );
  }
}
