import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_Images.dart';



class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _formKey = GlobalKey<FormState>();
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Validate password complexity (e.g., length and character types)
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Additional custom checks (optional), e.g., character types
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, lowercase letter, number, and special character';
    }
    return null; // Return null if validation succeeds
  }


  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1C1C23),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.restPassBg), fit: BoxFit.cover)
        ),
        child: Consumer<ForgotPasswordProvider>(builder:  (context, forgotPasswordProvider, child) {
          return Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200,),
                       Text( AppLocalizations.of(context)!.reset_password,
                        style: TextStyle(
                            fontFamily: 'Poppins_Regular',
                            fontSize: 26,
                            color: Colors.white
                        ),

                      ),
                      const SizedBox(height: 16,),
                       Text( AppLocalizations.of(context)!.heres_a_tip_use_a_combination_of_numbers_uppercase_lowercase_and_special_characters,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins_Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),

                      ),

                      const SizedBox(height: 28,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(AppLocalizations.of(context)!.password,
                            style: TextStyle(
                              // fontFamily: 'Poppins_Regular',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0XFF666680),
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            validator: validatePassword,
                            controller: forgotPasswordProvider.password,
                            style: TextStyle(
                                color:  Color(0XFF666680)
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              hintText: AppLocalizations.of(context)!.password,
                              hintStyle:  TextStyle(
                                fontFamily: 'Poppins_Regular',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFF666680).withOpacity(.3),
                              ),
                              suffixIcon: Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),),
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
                      const SizedBox(height: 15,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(AppLocalizations.of(context)!.confirm_password,
                            style: const TextStyle(
                              // fontWeight: FontWeight.w400,
                              // fontFamily: 'Poppins_Regular',
                              fontSize: 12,
                              color: Color(0XFF666680),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            validator: validatePassword,
                            controller: forgotPasswordProvider.confirmPassword,
                            style: const TextStyle(
                                color:  Color(0XFF666680)
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              hintText: AppLocalizations.of(context)!.confirm_password,
                              hintStyle:  TextStyle(
                                fontFamily: 'Poppins_Regular',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFF666680).withOpacity(.3),
                              ),
                              suffixIcon: Icon(Icons.lock , color: const Color(0XFF666680).withOpacity(.3),),
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
                SizedBox(height: MySize.size100,)
              ],
            ),
          );
        },),
      ),
      floatingActionButton:Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
         return GestureDetector(
           onTap:(){
             if(_formKey.currentState!.validate()){
               if(forgotPasswordProvider.password.text.trim() == forgotPasswordProvider.confirmPassword.text.trim()){
                 forgotPasswordProvider.changePassword(context: context);
               }else{
                 FlutterToast.toastMessage(message: "Confirm password doesn't match");
               }
             }
           },
           child: Padding(
             padding: const EdgeInsets.only(left: 30.0),
             child: Container(
               height: MySize.scaleFactorHeight * 48,
               margin: const EdgeInsets.symmetric(horizontal: 60),
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
                 child: forgotPasswordProvider.isChangePass == true ?  const CircularProgressIndicator(color: AppColors.purpleFF,):  Text(
                   AppLocalizations.of(context)!.reset_password,
                   style: const TextStyle(
                       fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                 ),
               ),
             ),
           ),
         );
      },),
    );
  }
}
