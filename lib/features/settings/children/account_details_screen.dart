import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pler_to_pler_app/custom_assets/assets.gen.dart';
import 'package:pler_to_pler_app/widgets/widgets.dart';


class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  final TextEditingController _emailController = TextEditingController(text: 'Ethancarter77@gmail.com');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: 'Account details'),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Account information',
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            bottom: 8.h,
            top: 24.h,
          ),

          CustomTextField(
            prefixIcon: Assets.icons.emailIcon.image(height: 20.r, width: 20.r),
            labelText: 'Email',
            controller: _emailController,
          ),




          /// +++++++++++++++++++++++++ Password +++++++++++++++++++++++
          CustomText(
            text: 'Password',
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            bottom: 8.h,
            top: 24.h,
          ),

          CustomTextField(
            prefixIcon: Assets.icons.passwordIcon.image(
              height: 20.r,
              width: 20.r,
            ),
            labelText: 'Current password',
            hintText: 'Enter your current password',
            controller: _passwordController,
          ),

          CustomTextField(
            prefixIcon: Assets.icons.passwordIcon.image(
              height: 20.r,
              width: 20.r,
            ),
            labelText: 'New password',
            hintText: 'Enter your new password',
            controller: _confirmPasswordController,
          ),
        ],
      ),
    );
  }
}
