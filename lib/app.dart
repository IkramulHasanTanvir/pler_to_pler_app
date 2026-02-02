import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pler_to_pler_app/routes/app_routes.dart';
import 'core/bindings/controller_binder.dart';
import 'core/utils/constants/app_sizer.dart';
import 'core/utils/constants/app_sizes.dart';
import 'core/utils/theme/theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.init,
          getPages: AppRoute.routes,
          initialBinding: ControllerBinder(),

        );
      },
    );
  }

}
