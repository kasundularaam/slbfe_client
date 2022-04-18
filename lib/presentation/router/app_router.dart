import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slbfe_client/logic/cubit/login_cubit/login_cubit.dart';
import 'package:slbfe_client/logic/cubit/regser_cubit/register_cubit.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/auth/login_page.dart';
import '../screens/auth/register_page.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/landing_screen/landing_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homeScreen = '/homeScreen';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginPage(),
          ),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterPage(),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
