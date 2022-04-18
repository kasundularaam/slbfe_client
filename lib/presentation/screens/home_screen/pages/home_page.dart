import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:slbfe_client/core/constants/strings.dart';
import 'package:slbfe_client/core/themes/app_colors.dart';
import 'package:slbfe_client/core/themes/app_text_styles.dart';
import 'package:slbfe_client/logic/cubit/slbfe_user_cubit/slbfe_user_cubit.dart';
import 'package:slbfe_client/logic/cubit/upload_docs_cubit/upload_docs_cubit.dart';
import 'package:slbfe_client/presentation/screens/home_screen/widgets/document_card.dart';
import 'package:slbfe_client/presentation/screens/home_screen/widgets/location_card.dart';
import 'package:slbfe_client/presentation/screens/home_screen/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SlbfeUserCubit>(context).getUser();
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
          BlocConsumer<SlbfeUserCubit, SlbfeUserState>(
            listener: (context, state) {
              if (state is SlbfeUserFailed) {
                SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is SlbfeUserLoading) {
                return const Expanded(
                    child: Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                ));
              }
              if (state is SlbfeUserLoaded) {
                return Column(
                  children: [
                    UserCard(
                      user: state.user,
                    ),
                    BlocProvider(
                      create: (context) => UploadDocsCubit(),
                      child: const DocumentCard(),
                    ),
                    const LocationCard(),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
