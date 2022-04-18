import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:slbfe_client/data/models/slbfe_user.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class UserCard extends StatelessWidget {
  final SlbfeUser user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    user.name,
                    style: AppTextStyles.h4Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    user.email,
                    style: AppTextStyles.p2Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    user.nic,
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
  }
}
