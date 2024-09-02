import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/Provider/change_password_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/utils/validation.dart';

import '../../theme/theme.dart';
import '../personaldata/personaldata.dart';

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
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
        Colors.black
            : const Color(0XFFF1F1FF),
        appBar:  CustomAppBarInAll(leading: false,title: AppLocalizations.of(context)!.change_password),
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
                        Text(
                          AppLocalizations.of(context)!.password,
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
                      hintText:  AppLocalizations.of(context)!.enter_password,
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
                        Text( AppLocalizations.of(context)!.new_password,
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
                              hintText:  AppLocalizations.of(context)!.enter_password,
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
                        Text( AppLocalizations.of(context)!.confirm_password,
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
                              hintText:  AppLocalizations.of(context)!.enter_password,
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
                    FlutterToast.toastMessage(message: AppLocalizations.of(context)!.confirm_password_doesnt_get_matched_with_password, isError: true);
                  }
                }
                },
              titleText:  AppLocalizations.of(context)!.save,
            );
          },)
          ],
        ));
  }
}
