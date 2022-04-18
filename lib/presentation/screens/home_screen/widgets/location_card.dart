import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
