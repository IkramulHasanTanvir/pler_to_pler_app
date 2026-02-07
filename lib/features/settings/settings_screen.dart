import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_colors.dart';
import 'package:pler_to_pler_app/features/settings/children/account_details_screen.dart';
import 'package:pler_to_pler_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: 'Settings'),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            _buildContainerCard(
              label: 'Account',
              children: [
                CustomContainer(
                  color: Colors.black.withOpacity(0.08),
                  width: double.infinity,
                  paddingAll: 12.r,
                  radiusAll: 12.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Email',
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                        bottom: 2.h,
                      ),
                      CustomText(text: 'Ethancarter77@gmail.com'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            _buildContainerCard(
              label: 'App',
              children: [
                _buildCardListWidget(label: 'App Preferences', onTap: () {
                  Get.to(() => AccountDetailsScreen());
                }),
                _buildCardListWidget(label: 'Language & Region', onTap: () {},isSpacer: false,),
                // _buildCardListWidget(
                //   label: 'Notifications',
                //   onTap: () {},
                //   isSpacer: false,
                // ),
              ],
            ),

            SizedBox(height: 8.h),
            _buildContainerCard(
              label: 'Options',
              children: [
                _buildCardListWidget(label: 'Earnings', onTap: () {}),
                _buildCardListWidget(
                  label: 'Privacy & Security',
                  onTap: () {},
                  isSpacer: false,
                ),
              ],
            ),

            SizedBox(height: 8.h),
            _buildContainerCard(
              label: 'About',
              sublabel: 'App version 1.58.7.1',
              children: [
                _buildCardListWidget(label: 'Privacy Policy', onTap: () {}),
                _buildCardListWidget(label: 'Terms of Service', onTap: () {}),
                _buildCardListWidget(label: 'Logout', onTap: () {}),
                _buildCardListWidget(
                  label: 'Delete my acount',
                  onTap: () {},
                  isSpacer: false,
                  textColor: AppColors.error,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerCard({
    required String label,
    String? sublabel,
    required List<Widget> children,
  }) {
    return CustomContainer(
      radiusAll: 16.r,
      paddingAll: 16.r,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                textAlign: TextAlign.start,
                text: label,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                bottom: 12.h,
              ),
              if (sublabel != null)
                CustomText(
                  textAlign: TextAlign.end,
                  text: sublabel,
                  fontSize: 12.sp,
                  bottom: 12.h,
                  color: AppColors.textSecondary,
                ),
            ],
          ),

          Column(children: children),
          //_buildCardListWidget(),
        ],
      ),
    );
  }

  Widget _buildCardListWidget({
    required String label,
    required VoidCallback onTap,
    Color? textColor,
    bool isSpacer = true,
  }) {
    return CustomContainer(
      onTap: onTap,
      marginBottom: isSpacer ? 8.h : 0,
      color: Colors.black.withOpacity(0.08),
      width: double.infinity,
      paddingAll: 12.r,
      radiusAll: 12.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: label,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.r,
            color: textColor ?? AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
