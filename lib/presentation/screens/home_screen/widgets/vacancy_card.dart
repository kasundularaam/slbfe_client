import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slbfe_client/presentation/router/app_router.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../data/models/vacancy.dart';

class VacancyCard extends StatelessWidget {
  final Vacancy vacancy;
  const VacancyCard({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRouter.vacancyPage,
          arguments: vacancy),
      child: Card(
        color: AppColors.lightElv0,
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vacancy.jobTitle,
                style: AppTextStyles.h3Dark,
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
                "Deadline: ${vacancy.deadline}",
                style: AppTextStyles.p2Dark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
