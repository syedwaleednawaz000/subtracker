import 'dart:ui';

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
  bool _isPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
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
                        Text('Password',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Colors.white
                          : Colors.black,
                      selectionColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Colors.blue.withOpacity(0.5)  // Dark mode selection color
                          : Colors.blue.withOpacity(0.3), // Light mode selection color
                      selectionHandleColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Colors.white
                        : Colors.black,
                    obscureText: _isPasswordVisible,
                    controller: currentPassEditingController,
                    enableInteractiveSelection: true,
                    validator: Validation.validatePassword,
                    decoration: InputDecoration(

                      isDense: true,
                      errorMaxLines: 3,
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'Enter password',
                      hintStyle: TextStyle(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0XFF666680).withOpacity(.6)
                            : const Color(0XFF666680).withOpacity(.6),
                        fontSize: MySize.size12,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          Icons.lock,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? const Color(0XFF666680).withOpacity(.6)
                              : const Color(0XFF666680).withOpacity(.6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? const Color(0XFF353542)
                              : const Color(0XFF353542).withOpacity(.1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? const Color(0XFF353542)
                              : const Color(0XFF353542).withOpacity(.1),
                        ),
                      ),
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
                        Text('New password',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                              cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Colors.black,
                              selectionColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.blue.withOpacity(0.5)  // Dark mode selection color
                                  : Colors.blue.withOpacity(0.3), // Light mode selection color
                              selectionHandleColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          child: TextFormField(
                            cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Colors.white
                                : Colors.black,
                            obscureText: _isNewPasswordVisible,
                            controller: newPassTextEditingController,
                            validator: Validation.validatePassword,
                            decoration: InputDecoration(

                              errorMaxLines: 3,
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              hintText: 'Enter password',
                              hintStyle: TextStyle(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                                fontSize: MySize.size12,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _isNewPasswordVisible = !_isNewPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  Icons.lock,
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680).withOpacity(.6) : const Color(0XFF666680).withOpacity(.6),
                                ),
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Confirm password',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                              cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Colors.black,
                              selectionColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.blue.withOpacity(0.5)  // Dark mode selection color
                                  : Colors.blue.withOpacity(0.3), // Light mode selection color
                              selectionHandleColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          child: TextFormField(
                            controller: newConfirmPassTextEditingController,
                            obscureText: _isConfirmPasswordVisible,
                            validator: Validation.validatePassword,
                            onChanged: (newValue) {
                              Provider.of<ChangePasswordProvider>(context, listen: false).updatePasswordStepper(newValue);
                            },
                            cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Colors.white
                                : Colors.black,
                            style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: MySize.size14,
                            ),
                            decoration: InputDecoration(
                              errorMaxLines: 3,
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              hintText: 'Enter password',
                              hintStyle: TextStyle(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF666680).withOpacity(.6)
                                    : const Color(0XFF666680).withOpacity(.6),
                                fontSize: MySize.size12,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  Icons.lock,
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                      ? const Color(0XFF666680).withOpacity(.6)
                                      : const Color(0XFF666680).withOpacity(.6),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                      ? const Color(0XFF353542)
                                      : const Color(0XFF353542).withOpacity(.1),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                      ? const Color(0XFF353542)
                                      : const Color(0XFF353542).withOpacity(.1),
                                ),
                              ),
                            ),
                            selectionControls: MaterialTextSelectionControls(), // Ensure text selection is supported
                            enableSuggestions: true, // Suggest words as you type
                            textInputAction: TextInputAction.done, // Specify the action when "done" is pressed
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.size20,),

                    Consumer<ChangePasswordProvider>(builder: (context, registerProvider, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(MySize.size90),
                        child: StepProgressIndicator(
                          totalSteps: 4,
                          currentStep: registerProvider.strengthLevel,
                          size: 8, // Ensure this value is half the height for fully rounded ends
                          padding: MySize.size2,
                          selectedColor: registerProvider.strengthLevel == 0
                              ? const Color(0XFF3535421A).withOpacity(.10)
                              : registerProvider.colors[registerProvider.strengthLevel - 1],
                          unselectedColor: const Color(0XFF3535421A).withOpacity(.10),
                          roundedEdges:Radius.circular(MySize.size90), // Full circular edges
                        ),
                      );

                    },
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
                    FlutterToast.toastMessage(message: "Confirm password doesn't get matched with password ", isError: true);
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
