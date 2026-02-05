import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pler_to_pler_app/core/utils/constants/app_colors.dart';
import 'package:pler_to_pler_app/custom_assets/assets.gen.dart';
import 'package:pler_to_pler_app/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Availability days
  final List<Map<String, dynamic>> availabilityDays = [
    {'day': 'M', 'isAvailable': false},
    {'day': 'T', 'isAvailable': true},
    {'day': 'W', 'isAvailable': false},
    {'day': 'T', 'isAvailable': true},
    {'day': 'F', 'isAvailable': true},
    {'day': 'S', 'isAvailable': false},
    {'day': 'S', 'isAvailable': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header image with gradient - STATIC
                Container(
                  height: 221.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.img1.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // Profile content
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.h),

                      // Name and Edit Profile button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Maxime Castel',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.edit, size: 16.r),
                            label: Text('Edit Profile'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: BorderSide(color: Colors.grey.shade300),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // About me and Exercise plans tabs
                      Row(
                        children: [
                          _buildTab('About me', isSelected: true),
                          SizedBox(width: 8.w),
                          _buildTab('Exercise plans', isSelected: false),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Bio
                      Text(
                        'Bio',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Welcome to the CEO\'s Channel ....',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Specialties
                      Text(
                        'Specialties',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Strength, Rehab, Post-Op Recovery',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Certifications
                      Text(
                        'Certifications',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.verified, color: Colors.green, size: 16.r),
                          SizedBox(width: 4.w),
                          Text(
                            'ACE, NASM, PT Licenses',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.verified, color: Colors.green, size: 16.r),
                          SizedBox(width: 4.w),
                          Text(
                            'Upload certification',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Trainer Experience
                      Text(
                        'Trainer Experience',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '8 years',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Availability section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Availability',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      // Availability days
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: availabilityDays.map((day) {
                          return _buildAvailabilityDay(
                            day['day'],
                            day['isAvailable'],
                          );
                        }).toList(),
                      ),

                      SizedBox(height: 12.h),

                      // Edit Availability button
                      Center(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.edit, size: 16.r),
                          label: Text('Edit Availability'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.h,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Services section
                      Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // 1-on-1 In-Person Training
                      _buildServiceCard(
                        title: '1-on-1 In-Person Training',
                        description:
                        '60 / 30 min results. Pay-as-you-go / no commitments. Personal training tailored & coordinated specifically for you.',
                        priceRange: '\$24 - \$49 / hour',
                      ),

                      SizedBox(height: 12.h),

                      // Recovery OP
                      _buildServiceCard(
                        title: 'Recovery OP',
                        description:
                        '90 Recovery Goals. This session is here you bring by vol physical therapist.',
                        priceRange: null,
                      ),

                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Profile picture - STATIC (No edit/camera icon)
          Positioned(
            top: 160.h,
            left: 20.w,
            child: Container(
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                image: DecorationImage(
                  image: AssetImage(Assets.images.img1.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // App bar
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SafeArea(
              child: CustomAppBar(
                backgroundColor: Colors.transparent,
                title: 'Profile',
                foregroundColor: Colors.white,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Assets.icons.setting.svg(
                      height: 48.r,
                      width: 48.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, {required bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildAvailabilityDay(String day, bool isAvailable) {
    return Container(
      width: 40.r,
      height: 40.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isAvailable ? Colors.black : Colors.transparent,
        border: Border.all(
          color: isAvailable ? Colors.black : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: 14.sp,
            color: isAvailable ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String description,
    String? priceRange,
  }) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),
          if (priceRange != null) ...[
            SizedBox(height: 8.h),
            Text(
              'Service charges',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              priceRange,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}