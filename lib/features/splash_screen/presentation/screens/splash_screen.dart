import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pler_to_pler_app/core/utils/constants/image_path.dart';
import 'package:pler_to_pler_app/features/splash_screen/controllers/splash_controller.dart';
import '../../../../core/utils/constants/app_sizes.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(getWidth(16)),
        child: Center(
          child: AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: controller.fadeAnimation,
                child: ScaleTransition(
                  scale: controller.scaleAnimation,
                  child: child,
                ),
              );
            },
            child: Image.asset(
              ImagePath.appLogo,
              width: getWidth(200),
              height: getHeight(200),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
