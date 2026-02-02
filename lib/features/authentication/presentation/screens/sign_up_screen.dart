import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_colors.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_sizer.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_sizes.dart';
import 'package:pler_to_pler_app/core/utils/constants/image_path.dart';
import 'package:pler_to_pler_app/features/authentication/controllers/sign_up_controller.dart';
import 'package:pler_to_pler_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:pler_to_pler_app/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<SignUpController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagePath.appLogo,
                    width: 84.w,
                    height:84.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16.h),
                  CustomText(
                    text: "Sign up to  fitness",
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _helperTabBar(
                            text: "Trainer",
                            controller: controller,
                          ),
                        ),
                        Expanded(
                          child: _helperTabBar(
                            text: "User",
                            controller: controller,
                          ),
                        ),
                        Expanded(
                          child: _helperTabBar(
                            text: "Facility",
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Obx(() {
                    if (controller.selectedTab.value == "Facility") {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Facility name",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(height: 4.h),
                          CustomTextField(
                            controller: controller.facilityNameController,
                            hintText: "Enter your facility name",
                            prefixIcon: Icon(Icons.factory, size: 24.sp),
                            onChanged: (_) =>
                                controller.validateFieldFacility(),
                            // validation: AppValidator.validateNotEmpty,
                          ),
                          SizedBox(height:12.h),
                          CustomText(
                            text: "Facility type",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(height: 4.h),
                          // Obx(
                          //   () => CustomDropdownField(
                          //     hintText: "Select a facility type",
                          //     items: controller.facilityList,
                          //     selectedValue:
                          //         controller.selectedFacilityType.value,
                          //     onChanged: (value) {
                          //       controller.changeFacilityType(value);
                          //       controller.validateFieldFacility();
                          //     },
                          //     borderRedius: 16,
                          //   ),
                          // ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text: "Facility Registration/Accreditation number",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(height: 4.h),
                          CustomTextField(
                            controller:
                                controller.facilityAccountNumberController,
                            hintText: "000-000-000-0000",
                            // prefixIcon: Icon(Icons.factory, size: 24.sp),
                            onChanged: (_) =>
                                controller.validateFieldFacility(),
                            // validation: AppValidator.validateNotEmpty,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: () {
                              controller.pickFile();
                            },
                            child: DottedBorder(
                              child: Padding(
                                padding: EdgeInsets.all(16.r),
                                child: Obx(() {
                                  if (controller.filePath.value.isNotEmpty) {
                                    return Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(
                                            12.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.textWhite,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.file_copy,
                                            size: 24.sp,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        SizedBox(width: 14.w),
                                        Expanded(
                                          child: CustomText(
                                            text: controller.filePath.value,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        GestureDetector(
                                          onTap: () {
                                            controller.filePath.value = "";
                                            controller.validateFieldFacility();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(
                                              12.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.textWhite,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(
                                              CupertinoIcons.delete,
                                              size: 24.sp,
                                              color: AppColors.error,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.textWhite,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 24.sp,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      SizedBox(width: 14.w),
                                      CustomText(
                                        text:
                                            "Trade license /\nAccreditation certificate",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          CustomButton(
                            label: "Continue",
                            onPressed: () {
                              if (controller.isValidateFacility.value) {
                                log("Validate user");
                              } else {
                                log("Invalid user");
                              }
                            },
                          ),
                        ],
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Email",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: "Enter your email address",
                          prefixIcon: Icon(Icons.email, size: 24.sp),
                        ),
                        SizedBox(height: 12.h),
                        CustomText(
                          text: "Password",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(height: 4.h),
                        Obx(
                          () => CustomTextField(
                            controller: controller.passwordController,
                            hintText: "Enter your password",
                            prefixIcon: Icon(Icons.vpn_key, size: 24.sp),
                            isPassword: true,


                          ),
                        ),
                        SizedBox(height: 12.h),
                        CustomText(
                          text: "Confirm password",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(height: 4.h),
                        Obx(
                          () => CustomTextField(
                            controller: controller.conPasswordController,
                            hintText: "Enter your password",
                            prefixIcon: Icon(Icons.vpn_key, size: 24.sp),
                            isPassword: true,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              log("Forgot password click");
                            },
                            child: CustomText(
                              text: "Forgot password?",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSecondary,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Obx(
                          () => CustomButton(
                            label: "Sign up",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                log("Validate");
                              } else {
                                log("Not validate");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            SizedBox(width: 8.w),
                            CustomText(
                              text: "Or continue with",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSecondary,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        CustomButton(
                          label: "Sign up with Google",
                          onPressed: () {},
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Don’t have an account? ",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              GestureDetector(
                onTap: () {
                  log("Sign in screen");
                  Get.to(() => LoginScreen());
                },
                child: CustomText(
                  text: "Sign in",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _helperTabBar({
  required String text,
  required SignUpController controller,
}) {
  return Obx(
    () => GestureDetector(
      onTap: () {
        controller.changeTab(text);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == text
              ? AppColors.textPrimary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: CustomText(
          text: text,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
