import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slbfe_client/core/constants/strings.dart';
import 'package:slbfe_client/core/themes/app_colors.dart';
import 'package:slbfe_client/core/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Text(
            Strings.appTitle,
            style: AppTextStyles.h2Primary,
          ),
          SizedBox(
            height: 2.h,
          ),
          Card(
            color: AppColors.lightElv0,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Strings.avatarImage,
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Tony Stark",
                          style: AppTextStyles.h4Dark,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "stark@gmail.com",
                          style: AppTextStyles.p2Dark,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "1997628362V",
                          style: AppTextStyles.p2Dark,
                        ),
                      ],
                    )
                  ],
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
                                "1009 Mulberry St Burns, Tennessee(TN), 37029",
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
                                "Actor",
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
                                "46 years",
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
          ),
          Card(
            color: AppColors.lightElv0,
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Documents",
                    style: AppTextStyles.h3Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Upload your CV and certificates here.",
                    style: AppTextStyles.p2Dark,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Documents accepted",
                          style: AppTextStyles.h4Primary,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Document you uploaded has accepted by SLBFE",
                          style: AppTextStyles.p2Dark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Upload"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: AppColors.lightElv0,
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: AppTextStyles.h3Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Update your current location as soon as you visit the foreign company",
                    style: AppTextStyles.p2Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Update"),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
