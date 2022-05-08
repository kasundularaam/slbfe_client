import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../data/models/vacancy.dart';

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;
  const VacancyPage({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  Vacancy get vacancy => widget.vacancy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
      color: AppColors.lightElv0,
      child: Column(
        children: [
         SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    vacancy.jobTitle,
                    style: AppTextStyles.h4Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                   vacancy.jobDescription,
                    style: AppTextStyles.p2Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    vacancy.deadline,
                    style: AppTextStyles.p2Dark,
                  ),
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.house_rounded,
                      color: AppColors.primaryColor,
                      size: 22.sp,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          user.address,
                          style: AppTextStyles.p2Dark,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.work_rounded,
                      color: AppColors.primaryColor,
                      size: 22.sp,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          user.profession,
                          style: AppTextStyles.p2Dark,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: AppColors.primaryColor,
                      size: 22.sp,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          user.age,
                          style: AppTextStyles.p2Dark,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
            ],
          ),
        ),
      ),
    );
  }
}
