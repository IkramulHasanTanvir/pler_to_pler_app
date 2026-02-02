import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.all(16.r),
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
              width:200.r,
              height: 200.r,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
