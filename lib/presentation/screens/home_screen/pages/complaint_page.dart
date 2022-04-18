import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:slbfe_client/core/themes/app_colors.dart';
import 'package:slbfe_client/logic/cubit/complaints_cubit/complaints_cubit.dart';
import 'package:slbfe_client/logic/cubit/new_complaint_cubit/new_complaint_cubit.dart';
import 'package:slbfe_client/presentation/screens/home_screen/widgets/complaint_card.dart';

import '../../../../core/themes/app_text_styles.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ComplaintsCubit>(context).getComplaints();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
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
          Card(
            color: AppColors.lightElv0,
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New complaint",
                    style: AppTextStyles.h4Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormField(
                    controller: messageController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      labelText: 'Message',
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: BlocConsumer<NewComplaintCubit, NewComplaintState>(
                      listener: (context, state) {
                        if (state is NewComplaintFailed) {
                          SnackBar snackBar =
                              SnackBar(content: Text(state.errorMsg));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (state is NewComplaintSucceed) {
                          messageController.clear();
                          SnackBar snackBar = const SnackBar(
                              content: Text("Your complaint added"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          BlocProvider.of<ComplaintsCubit>(context)
                              .getComplaints();
                        }
                      },
                      builder: (context, state) {
                        if (state is NewComplaintLoading) {
                          return const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          );
                        }
                        return ElevatedButton(
                          onPressed: () =>
                              BlocProvider.of<NewComplaintCubit>(context)
                                  .addComplaint(
                                      message: messageController.text),
                          child: const Text("Send"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Previous complaints",
              style: AppTextStyles.h4Primary,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocConsumer<ComplaintsCubit, ComplaintsState>(
            listener: (context, state) {
              if (state is ComplaintsFailed) {
                SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is ComplaintsLoading) {
                return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                );
              }
              if (state is ComplaintsLoaded) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.complaints.length,
                  itemBuilder: (context, index) =>
                      ComplaintCard(complaint: state.complaints[index]),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
