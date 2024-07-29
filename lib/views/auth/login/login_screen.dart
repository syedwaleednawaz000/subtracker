import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/Provider/login_provider.dart';
import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import 'package:sub_tracker/views/forgot_password/forget_password.dart';
import 'package:sub_tracker/views/home_screen/home_screen.dart';

import '../../../theme/theme.dart';
import '../../base/field_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Validate password complexity (e.g., length and character types)
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Additional custom checks (optional), e.g., character types
    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, lowercase letter, number, and special character';
    }
    return null; // Return null if validation succeeds
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Basic email format validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    // Additional custom checks (optional), e.g., domain name validation
    if (!value.contains('@gmail') || !value.contains('.com')) {
      return 'Enter a Gmail address with .com domain';
    }
    return null; // Return null if validation succeeds
  }

  bool val = false;
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() =>
        Provider.of<LoginProvider>(context, listen: false).getRememberMe());
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: const Color(0XFF1C1C23),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.loginBg), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Consumer<LoginProvider>(
              builder: (context, loginProvider, child) {
                return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 28, bottom: 165, left: 115, right: 115),
                        ),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 22),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'E-mail address',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF666680),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    validator: validateEmail,
                                    controller: loginProvider.emailController,
                                    style: const TextStyle(
                                        color: Color(0XFF666680)),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins_Regular',
                                        color: const Color(0XFF666680)
                                            .withOpacity(.3),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.mail,
                                        color: const Color(0XFF666680)
                                            .withOpacity(.3),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: const Color(0XFF4E4E61)
                                                  .withOpacity(.2))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: const Color(0XFF4E4E61)
                                                .withOpacity(.2)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: const Color(0XFF4E4E61)
                                                .withOpacity(.2)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF666680),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    controller:
                                        loginProvider.passwordController,
                                    validator: validatePassword,
                                    style: const TextStyle(
                                        color: Color(0XFF666680)),
                                    obscureText: isSelected,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins_Regular',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0XFF666680)
                                            .withOpacity(.3),
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isSelected = !isSelected;
                                            });
                                          },
                                          icon: isSelected
                                              ? Icon(
                                                  Icons.lock_open,
                                                  color: const Color(0XFF666680)
                                                      .withOpacity(.3),
                                                )
                                              : Icon(
                                                  Icons.lock_rounded,
                                                  color: const Color(0XFF666680)
                                                      .withOpacity(.3),
                                                )),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: const Color(0XFF4E4E61)
                                                  .withOpacity(.2))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: const Color(0XFF4E4E61)
                                                .withOpacity(.2)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: const Color(0XFF4E4E61)
                                                .withOpacity(.2)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      fillColor: MaterialStateProperty.all(
                                        Provider.of<ThemeChanger>(context)
                                                    .themeData ==
                                                darkMode
                                            ? Colors.transparent
                                            : Colors.transparent,
                                      ),
                                      visualDensity: const VisualDensity(
                                          horizontal: -4, vertical: -4),
                                      checkColor:
                                          Provider.of<ThemeChanger>(context)
                                                      .themeData ==
                                                  darkMode
                                              ? const Color(0XFFA2A2B5)
                                              : const Color(0XFFA2A2B5),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1,
                                          color: const Color(0XFF353542)
                                              .withOpacity(.95)),
                                      value: val,
                                      onChanged: (value) => setState(() {
                                        val = !val;
                                      }),
                                    ),
                                    const Text(
                                      'Remember me',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF666680),
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPassword()));
                                      },
                                      child: const Text(
                                        'Forgot password?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF666680),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Consumer<LoginProvider>(
                          builder: (context, loginProvider, child) {
                            return GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  loginProvider.login(
                                      context: context,
                                      email: loginProvider.emailController.text
                                          .trim(),
                                      password: loginProvider
                                          .passwordController.text
                                          .trim(),
                                      rememberMe: val);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: MySize.size28,
                                ),
                                child: Container(
                                    height: MySize.scaleFactorHeight * 48,
                                    width: MySize.scaleFactorWidth * 333,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(MySize.size40),
                                      border: Border(
                                          top: BorderSide(
                                              color:
                                                  Colors.white.withOpacity(.5)),
                                          left: BorderSide(
                                              color:
                                                  Colors.white.withOpacity(.5)),
                                          // right: BorderSide(color: Colors.white.withOpacity(.5)),
                                          bottom: BorderSide.none),
                                      // border: Border.all(color: Colors.white.withOpacity(.5)),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 8),
                                            blurRadius: 25,
                                            color: const Color(0XFF4F63BE)
                                                .withOpacity(.5))
                                      ],
                                      color: const Color(0XFF758AFF),
                                    ),
                                    child: Center(
                                      child: loginProvider.isLogin == true
                                          ? const CircularProgressIndicator()
                                          : const Text('Sign In',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                    )),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AppImages.faceID,
                              height: 58,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Enable Face ID',
                              style: TextStyle(
                                  fontFamily: 'Poppins_Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFFF0F4F7)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 25, right: 25, bottom: 12),
                          child: Text(
                            'If you don\'t have an account yet?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: MySize.size30),
                            child: FieldContainer(
                              containerColor: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? AppColors.grey30.withOpacity(.15)
                                  : AppColors.grey30.withOpacity(.15),
                              mytitle: 'Sign Up',
                              textColor: AppColors.white100.withOpacity(.7),
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ));
  }
}
