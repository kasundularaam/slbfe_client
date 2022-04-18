import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slbfe_client/logic/cubit/complaints_cubit/complaints_cubit.dart';
import 'package:slbfe_client/logic/cubit/new_complaint_cubit/new_complaint_cubit.dart';
import 'package:slbfe_client/logic/cubit/slbfe_user_cubit/slbfe_user_cubit.dart';
import 'package:slbfe_client/logic/cubit/upload_docs_cubit/upload_docs_cubit.dart';
import 'package:slbfe_client/presentation/screens/home_screen/pages/complaint_page.dart';

import '../../../core/themes/app_colors.dart';
import 'pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> widgetOptions = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SlbfeUserCubit()),
        BlocProvider(create: (context) => UploadDocsCubit()),
      ],
      child: const HomePage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ComplaintsCubit()),
        BlocProvider(create: (context) => NewComplaintCubit()),
      ],
      child: const ComplaintPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv1,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv1,
        body: SafeArea(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback_rounded),
              label: "Complaint",
              backgroundColor: AppColors.primaryColor,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.lightElv0,
          unselectedItemColor: AppColors.lightElv0.withOpacity(0.7),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5,
        ),
      ),
    );
  }
}
