import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_colors.dart';
import 'package:pler_to_pler_app/custom_assets/assets.gen.dart';
import 'package:pler_to_pler_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        titleWidget: ListTile(
          leading: CustomImageAvatar(
            image: '',
            radius: 22.r,
            showBorder: true,
          ),
          title: Row(
            children: [
              CustomText(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                textAlign: TextAlign.start,
                  text: 'Hi Maxime!'),


              SizedBox(width: 6.w),
              CustomContainer(
                paddingHorizontal: 8.w,
                radiusAll: 100.r,
                bordersColor: AppColors.textSecondary,
                child: Row(
                  children: [
                    Icon(Icons.circle, color: Colors.green, size: 14.r),
                    CustomText(text: 'Online',fontSize: 12.sp,left: 4.w,)
                  ],
                ),
              )
            ],
          ),
          subtitle: CustomText(
            textAlign: TextAlign.start,
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            text: 'Let’s Manage your  users'),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Assets.icons.notification.svg(height: 48.r,width: 48.r)),
      ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
