import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_colors.dart';
import 'package:pler_to_pler_app/widgets/widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  int currentIndex = 0;

  final PageController _pageController = PageController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        backAction: (){
          if(currentIndex >0){
            setState(() {
              currentIndex--;
            });
          }else{
            Navigator.pop(context);
          }
        },
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
            (index) => Expanded(
              child: CustomContainer(
                marginLeft: 4.w,
                height: 6.h,
                color: currentIndex == index
                    ? AppColors.textPrimary
                    : AppColors.textWhite,
                radiusAll: 99.r,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: CustomText(
              text: 'Skip',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 24.h),
          AppLogoWidget(
            subtitle: 'Let’s start with building your profile',
          ),
          SizedBox(height: 40.h),

          Expanded(
            child: PageView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  CustomText(
                    text: 'What’s your name ?',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    labelText: 'First name',
                    hintText: 'Enter your first name', controller: firstNameController,
                  ),
                  CustomTextField(
                    labelText: 'Last name',
                    hintText: 'Enter your last name', controller: lastNameController,
                  ),
                ],
              );
            }, onPageChanged: (index){
              setState(() {
                currentIndex = index;
              });
            },),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(child: Padding(
        padding:  EdgeInsets.all(16.w),
        child: CustomButton(onPressed: (){
          if(currentIndex<5){
            setState(() {
              currentIndex++;
            });
          }
        },label: 'Next'),
      )),
    );
  }
}
