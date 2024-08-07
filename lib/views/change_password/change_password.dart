import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/Provider/change_password_provider.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/validation.dart';
import 'package:sub_tracker/views/bottomnavbar/bottom_navBar.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../theme/theme.dart';
import '../base/field_container.dart';
import '../language_selection/base/custom_appBar.dart';
import '../personaldata/personaldata.dart';
import '../settings/settings.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool val = false;
  TextEditingController currentPassEditingController = TextEditingController();
  TextEditingController newPassTextEditingController = TextEditingController();
  TextEditingController newConfirmPassTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF1C1C23) : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: const EdgeInsets.only(left: 4, top: 25  ),
            child:  CustomAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Change Password',
              icon: Icons.arrow_back_rounded,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38, right: 37),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Current password',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: currentPassEditingController,
                          validator: Validation.validatePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(left: 20, right: 20),
                            hintText: 'Enter current password',
                            hintStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                              fontSize: MySize.size12,
                            ),
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Password',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: newPassTextEditingController,
                          validator: Validation.validatePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(left: 20, right: 20),
                            hintText: 'Enter new password',
                            hintStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                              fontSize: MySize.size12,
                            ),
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Confirm Password',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: newConfirmPassTextEditingController,
                          validator: Validation.validatePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(left: 20, right: 20),
                            hintText: 'Enter new Confirm Password',
                            hintStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ?
                              const Color(0XFF666680).withOpacity(.6) :
                              const Color(0XFF666680).withOpacity(.6),
                              fontSize: MySize.size12,
                            ),
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 28, ),
                      child: StepProgressIndicator(totalSteps: 4,
                       selectedColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                       unselectedColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                        // gradientColor: LinearGradient(
                        //     colors: [Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1)]),\
                      ),
                    ),

                  ],
                ),
              ),
            ),
            const Spacer(),
          Consumer<ChangePasswordProvider>(builder: (context, changePasswordProvider, child) {
            return             CustomSaveButton(
              loading: changePasswordProvider.isChangePassword,
              onTap: (){
                if (_formKey.currentState!.validate()) {
                  if (newPassTextEditingController.text.trim() == newConfirmPassTextEditingController.text.trim()) {
                    changePasswordProvider.updatePassword(
                      context: context,
                      currentPassword: currentPassEditingController.text.trim(),
                      newPassword: newPassTextEditingController.text.trim(),
                      newPasswordConfirmation: newConfirmPassTextEditingController.text.trim(),
                    );
                  } else {
                    FlutterToast.toastMessage(message: "Confirm password not matched", isError: true);
                  }
                }
                },
              titleText: 'Save',
            );
          },)
          ],
        ));
  }
}
