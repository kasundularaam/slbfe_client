import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slbfe_client/core/constants/strings.dart';
import 'package:slbfe_client/core/themes/app_text_styles.dart';
import 'package:slbfe_client/presentation/router/app_router.dart';

import '../../../core/themes/app_colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Duration duration = const Duration(seconds: 2);
  goToAuth() => Future.delayed(duration).then(
        (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouter.loginPage,
          (route) => false,
        ),
      );
  goToHome() => Future.delayed(duration).then(
        (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouter.homeScreen,
          (route) => false,
        ),
      );
  @override
  Widget build(BuildContext context) {
    goToAuth();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv0,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv0,
        body: SafeArea(
          child: Center(
            child: Text(
              Strings.appTitle,
              style: AppTextStyles.h1Primary,
            ),
          ),
        ),
      ),
    );
  }
}
