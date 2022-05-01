import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:slbfe_client/core/themes/app_colors.dart';
import 'package:slbfe_client/logic/cubit/connections_cubit/connections_cubit.dart';
import 'package:slbfe_client/presentation/screens/home_screen/widgets/connection_card.dart';

import '../../../../core/themes/app_text_styles.dart';

class ConnectionsPage extends StatefulWidget {
  const ConnectionsPage({Key? key}) : super(key: key);

  @override
  State<ConnectionsPage> createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        Text(
          "Complaints",
          style: AppTextStyles.h2Primary,
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () {},
              child: Text(
                "Users",
                style: AppTextStyles.h3Primary,
              ),
            )),
            Expanded(
                child: TextButton(
              onPressed: () {},
              child: Text(
                "Connections",
                style: AppTextStyles.h3Primary,
              ),
            ))
          ],
        ),
        BlocConsumer<ConnectionsCubit, ConnectionsState>(
          listener: (context, state) {
            if (state is ConnectionsFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is ConnectionsLoading) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ));
            }
            if (state is ConnectionsLoaded) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  itemCount: state.connectionUsers.length,
                  itemBuilder: (context, index) => ConnectionCard(
                      connectionUser: state.connectionUsers[index]),
                ),
              );
            }
            return const SizedBox();
          },
        )
      ],
    );
  }
}
