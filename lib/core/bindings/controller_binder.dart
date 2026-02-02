import 'package:get/get.dart';
import 'package:pler_to_pler_app/features/authentication/controllers/login_controller.dart';
import 'package:pler_to_pler_app/features/authentication/controllers/sign_up_controller.dart';
import 'package:pler_to_pler_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:pler_to_pler_app/features/splash_screen/controllers/splash_controller.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // splash controllers
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
      fenix: true,
    );

    // auth controllers
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  }
}
