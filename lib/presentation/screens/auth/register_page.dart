import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../router/app_router.dart';
import 'widgets/auth_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nicController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController affiliationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        AppRouter.landingPage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv0,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv0,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "Register",
                    style: AppTextStyles.h1Primary,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.card_membership_rounded,
                            ),
                            labelText: 'NIC',
                          ),
                          validator: (value) {
                            if (!RegExp(
                                    r'^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$')
                                .hasMatch(value!)) {
                              return 'Invalid NIC Number!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_rounded,
                            ),
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is empty!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.calendar_today_rounded,
                            ),
                            labelText: 'Age',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ae is Empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: addressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.house_rounded,
                            ),
                            labelText: 'Address',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address is empty!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: professionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.work_rounded,
                            ),
                            labelText: 'Profession',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Profession is empty!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: affiliationController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.contacts_rounded,
                            ),
                            labelText: 'Affiliation',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Affiliation is empty!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                            ),
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is empty!';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Invalid Email address!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.password_rounded,
                            ),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is empty!';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        AuthButton(
                          text: "Register",
                          onTap: () => register(),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: " LOG IN",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        AppRouter.loginPage, (route) => false),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
