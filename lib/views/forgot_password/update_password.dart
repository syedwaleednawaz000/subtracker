import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/utils/validation.dart';
import '../../utils/app_Images.dart';



class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _formKey = GlobalKey<FormState>();



  bool password = true;
  bool confirmPassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1C1C23),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.restPassBg), fit: BoxFit.cover)
        ),
        child: Consumer<ForgotPasswordProvider>(builder:  (context, forgotPasswordProvider, child) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: MySize.scaleFactorHeight*170.0,left: MySize.size36,top: MySize.size60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(AppImages.backArrow)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MySize.size40),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 200,),
                         Text( AppLocalizations.of(context)!.reset_password,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Poppins_Regular',
                              fontSize: 26,
                              color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 16,),
                         Text( AppLocalizations.of(context)!.heres_a_tip_use_a_combination_of_numbers_uppercase_lowercase_and_special_characters,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Poppins_Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),),
                        SizedBox(height: MySize.size25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(AppLocalizations.of(context)!.password,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0XFF666680),
                              ),
                            ),
              
                            SizedBox(height: MySize.size4,),
                            TextFormField(
                              validator: Validation.validatePassword,
                              obscureText: password,
                              controller: forgotPasswordProvider.password,
                              style: const TextStyle(
                                  color:  Color(0XFF666680)
                              ),
                              decoration: InputDecoration(
                                errorMaxLines: 3,
                                isDense: true,
                                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                hintText: AppLocalizations.of(context)!.password,
                                hintStyle:  TextStyle(
                                  fontFamily: 'Poppins_Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0XFF666680).withOpacity(.3),
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: (){setState(() {
                                      password = !password;
                                    });},
                                    child: Icon(password ?Icons.lock_open:Icons.lock_rounded  , color: const Color(0XFF666680).withOpacity(.3),)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.size25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(AppLocalizations.of(context)!.confirm_password,
                              style: const TextStyle(
                                 fontSize: 12,
                                color: Color(0XFF666680),
                              ),
                            ),
                             SizedBox(
                              height: MySize.size4,
                            ),
                            TextFormField(
                              obscureText: confirmPassword,
                              validator: Validation.validatePassword,
                              controller: forgotPasswordProvider.confirmPassword,
                              style: const TextStyle(
                                  color:  Color(0XFF666680)
                              ),

                              decoration: InputDecoration(
                                errorMaxLines: 3,
                                isDense: true,
                                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                hintText: AppLocalizations.of(context)!.confirm_password,
                                hintStyle:  TextStyle(
                                  fontFamily: 'Poppins_Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0XFF666680).withOpacity(.3),
                                ),

                                suffixIcon: GestureDetector(
                                    onTap: (){setState(() {
                                      confirmPassword = !confirmPassword;
                                    });},
                                    child: Icon(confirmPassword ?Icons.lock_open:Icons.lock_rounded  , color: const Color(0XFF666680).withOpacity(.3),)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                                ),
                              ),  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.size25,),
                  Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                    return GestureDetector(
                      onTap:(){
                        if(_formKey.currentState!.validate()){
                          if(forgotPasswordProvider.password.text.trim() == forgotPasswordProvider.confirmPassword.text.trim()){
                            forgotPasswordProvider.changePassword(context: context);
                          }else{
                            FlutterToast.toastMessage(message: "Confirm password doesn't get matched with password",isError: true);
                          }
                        }
                      },
                      child: Container(
                        height: MySize.scaleFactorHeight * 48,
                        margin:  EdgeInsets.symmetric(horizontal: MySize.size35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border(
                                top: BorderSide(color: Colors.white.withOpacity(.5)),
                                left: BorderSide(color: Colors.white.withOpacity(.5)),
                                bottom: BorderSide.none),
                            color: const Color(0XFF758AFF),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 8),
                                  blurRadius: 25,
                                  color: const Color(0XFF4F63BE).withOpacity(.5))
                            ]),
                        child:  Center(
                          child: forgotPasswordProvider.isChangePass == true ?  const CircularProgressIndicator(color: AppColors.white100,):  Text(
                            AppLocalizations.of(context)!.reset_password,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  },),
                ],
              ),
            ),
          );
        },),
      ),
      // floatingActionButton:,
    );
  }
}
