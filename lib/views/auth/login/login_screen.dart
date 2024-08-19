import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Provider/login_provider.dart';
import 'package:sub_tracker/utils/textStyle.dart';
import 'package:sub_tracker/utils/validation.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:sub_tracker/views/forgot_password/forget_password.dart';

import '../../../theme/theme.dart';
import '../../base/field_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool val = false;
  bool isSelected = true;

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
                        Text(
                          '${AppLocalizations.of(context)!.welcome_back}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: MySize.size30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context)!.email_address}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF666680),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    validator: Validation.validateEmail,
                                    controller: loginProvider.emailController,
                                    style: const TextStyle(
                                        color: Color(0XFF666680)),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      hintText:
                                          AppLocalizations.of(context)!.email,
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins_Regular',
                                        color: const Color(0XFF666680)
                                            .withOpacity(.3),
                                      ),
                                      errorMaxLines: 3,
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
                                  Text(
                                    AppLocalizations.of(context)!.password,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
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
                                    validator: Validation.validatePassword,
                                    style: const TextStyle(
                                        color: Color(0XFF666680)),
                                    obscureText: isSelected,
                                    decoration: InputDecoration(
                                      errorMaxLines: 3,
                                      isDense: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      hintText: AppLocalizations.of(context)!
                                          .password,
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
                              SizedBox(
                                height: MySize.size20,
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.6,
                                    child: Checkbox(
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
                                  ),
                                  SizedBox(
                                    width: MySize.size6,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.remember_me,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .forgot_password,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF666680),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MySize.size20,
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
                                        bottom: BorderSide.none),
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
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            AppLocalizations.of(context)!
                                                .sign_in,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 14)),
                                  )),
                            );
                          },
                        ),
                        SizedBox(
                          height: MySize.size30,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AppImages.faceIdImage,
                              height: MySize.scaleFactorHeight * 69,
                              width: MySize.scaleFactorWidth * 69,
                              fit: BoxFit.cover,
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Colors.grey
                                  : const Color(0xFFF0F4F7),
                            ),
                            SizedBox(
                              height: MySize.scaleFactorHeight * 5,
                            ),
                            Text(
                              AppLocalizations.of(context)!.enable_face_id,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: MySize.size12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFF0F4F7)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MySize.scaleFactorHeight * 50,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .if_you_dont_have_an_account_yet,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.textStyleWith14WhiteBold400(),
                        ),
                        SizedBox(
                          height: MySize.size20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: FieldContainer(
                              containerColor: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? AppColors.grey30.withOpacity(.15)
                                  : AppColors.grey30.withOpacity(.15),
                              mytitle: AppLocalizations.of(context)!.sign_up,
                              textColor: Colors.white),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ));
  }
}
