import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/Provider/register_provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/utils/validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_Images.dart';
import '../../base/field_container.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  bool val = false;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: const Color(0XFF1C1C23),
        resizeToAvoidBottomInset: false,

        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg3Image), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  const Padding(
                    padding: EdgeInsets.only(
                         left: 115, right: 115),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60,right: 280),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(AppImages.backArrow,color: const Color(0XFFA2A2B5),)),
                  ),
                  const SizedBox(height: 100,),
                   Text( AppLocalizations.of(context)!.create_account,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 24,
                        color: Colors.white
                    ),
                  ),

                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, top: 22),                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             Text(AppLocalizations.of(context)!.user_name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF666680)
                              ),),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  color:  Color(0XFF666680)
                              ),
                              obscureText: isSelected1,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                  isDense: true,
                                  hintText: AppLocalizations.of(context)!.enter_user_name,
                                  hintStyle:  TextStyle(
                                    fontFamily: 'Poppins_Regular',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0XFF666680).withOpacity(.3),
                                  ),
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      isSelected1 = !isSelected1;
                                    });
                                  }, icon: isSelected1
                                      ? Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)
                                      : Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3),)),
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
                              ),

                            ),
                          ],
                        ),
                      ),
                 Padding(
                   padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
                   child: Column(
                     children: [
                       CustomTextFormField(
                         controller: emailController,
                         text: AppLocalizations.of(context)!.email_address,
                         hintText: AppLocalizations.of(context)!.email,
                         validator: Validation.validateEmail,
                         suffixIcons: IconButton(onPressed: (){},
                             icon:  Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       CustomTextFormField(
                         controller: passwordController,
                         text: AppLocalizations.of(context)!.password,
                         hintText: AppLocalizations.of(context)!.password,
                         validator:  Validation.validatePassword,
                         obscureText: isSelected1 ,
                         suffixIcons: IconButton(
                             onPressed: (){
                               isSelected1 = !isSelected1;

                             setState(() {
                                   });
                                 }, icon: isSelected1
                                     ? Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3))
                                     : Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                   Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
                     return                        CustomTextFormField(
                       onChanged: (newValue){
                         registerProvider.updatePassword(newValue);
                       },
                       controller: confirmPasswordController,
                       text: AppLocalizations.of(context)!.confirm_password,
                       hintText: AppLocalizations.of(context)!.confirm_password,
                       obscureText: isSelected2,
                       validator:  Validation.validatePassword,
                       suffixIcons: IconButton(onPressed: (){
                         setState(() {
                           isSelected2 = !isSelected2;
                         });
                       }, icon: isSelected2
                           ? Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3))
                           : Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)),
                     );
                   },),
                       const SizedBox(
                         height: 10,
                       ),

                       Padding(
                         padding: const EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 16),
                         child:  Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
                           return StepProgressIndicator(
                             totalSteps: 4,
                             currentStep: registerProvider.strengthLevel,
                             size: 8,
                             padding: 0,
                             selectedColor: registerProvider.strengthLevel == 0
                                 ? Colors.grey
                                 : registerProvider.colors[registerProvider.strengthLevel - 1],
                             unselectedColor: Color(0XFF353542),
                             roundedEdges: Radius.circular(10),
                           );
                         },),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(left: 7),
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Text(AppLocalizations.of(context)!.use_or_more_characters_with_a_mix_of_letters_numbers_symbols_to_be_secure,
                             textAlign: TextAlign.start,
                             style: TextStyle(
                               fontSize: 15,
                               // fontWeight: FontWeight.w600,
                               // color: Color(0XFF666680),
                                 color: AppColors.grey30.withOpacity(.3)
                             ),),
                         ),
                       ),
                        const SizedBox(
                         height: 12,
                       ),
                       Row(
                         children: [
                           Checkbox(
                             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                             visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
                             checkColor: const Color(0XFF666680),
                             side: BorderSide(
                               style: BorderStyle.solid,
                               width: 3,
                               color: const Color(0XFF353542).withOpacity(.5),
                             ),
                             value: val,
                             onChanged: (value) => setState(() {
                               val = !val;
                             }),
                           ),
                           SizedBox(width: MySize.size25),
                           Expanded( // Ensure text wraps within available space
                             child: RichText(
                               text: TextSpan(
                                 children: [
                                   TextSpan(
                                     text: "${AppLocalizations.of(context)!.by_proceeding_you_agree_to_our} ",
                                     style: TextStyle(
                                       fontSize: 15,
                                       color: AppColors.grey30.withOpacity(.3),
                                     ),
                                   ),
                                    TextSpan(
                                     text: AppLocalizations.of(context)!.privacy_policy,
                                     style: TextStyle(
                                       color: Color(0XFF758AFF),
                                       fontSize: 15,
                                       decoration: TextDecoration.underline,
                                       decorationColor: AppColors.lightBlue,
                                     ),
                                   ),
                                   TextSpan(
                                     text: ' ${AppLocalizations.of(context)!.and} ',
                                     style: TextStyle(
                                       color: AppColors.grey30.withOpacity(.3),
                                       fontSize: 15,
                                     ),
                                   ),
                                    TextSpan(
                                     text: AppLocalizations.of(context)!.terms_of_use,
                                     style:  TextStyle(
                                       color: Color(0XFF758AFF),
                                       fontSize: 15,
                                       decoration: TextDecoration.underline,
                                       decorationColor: AppColors.lightBlue,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
              Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
                return  GestureDetector(
                  onTap: (){
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
                        if (val == true) {
                          registerProvider.register(
                            context: context,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        } else {
                          FlutterToast.toastMessage(
                            message: "Please accept privacy and policy",
                            isError: true,
                          );
                        }
                      } else {
                        FlutterToast.toastMessage(
                          message: "Password doesn't match with confirm password",
                          isError: true,
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.only(top: MySize.size34, bottom: MySize.size15),
                    child:Container(
                        height: MySize.scaleFactorHeight * 48,
                        width: MySize.scaleFactorWidth * 333,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size40),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 8),
                                blurRadius: 25,
                                color: const Color(0XFF4F63BE).withOpacity(.5)
                            )
                          ],
                          color: const Color(0XFF758AFF),
                        ),
                        child:  Center(
                          child: registerProvider.isRegister == true ?  const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(color: AppColors.purpleFF,)) :  Text(AppLocalizations.of(context)!.get_started,
                            style: TextStyle(color:Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                );
              },),
                   Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 12, bottom: 12),
                    child:   Text(
                      AppLocalizations.of(context)!.do_you_have_already_an_account,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MySize.size20),
                      child: FieldContainer(
                        // containerColor: AppColors.grey30.withOpacity(.3),
                        containerColor:  Provider.of<ThemeChanger>(context)
                            .themeData == darkMode
                            ?  AppColors.grey30.withOpacity(.15)
                            :  AppColors.grey30.withOpacity(.15),

                        mytitle: AppLocalizations.of(context)!.sign_in,
                        textColor: AppColors.white100.withOpacity(.8),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}

  class CustomTextFormField extends StatelessWidget {
     CustomTextFormField({
      super.key,
      required this.hintText,
      required this.text,
      this.suffixIcons,
      this.prefixIcons,
      this.onChanged,
      required this.validator,
      this.obscureText,
      required this.controller,
    });

    final String hintText;
    final TextEditingController controller;
    final String text;
    final IconButton? suffixIcons;
    final Icon? prefixIcons;
    void Function(String)? onChanged;
    final FormFieldValidator<String> validator;
    final bool? obscureText ;

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFF666680),
            ),),
         // color: Color(0XFF666680),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText ?? false,
            validator: validator,
            style: const TextStyle(
                 color:  Color(0XFF666680)
            ),
            decoration: InputDecoration(
               isDense: true,
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                hintText: hintText,
                hintStyle:  TextStyle(
                  fontFamily: 'Poppins_Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFF666680).withOpacity(.3),
                ),
                // hintStyle: TextStyle(color: Color(0XFF666680)),
                // suffixIcon: Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),),
                suffixIcon: suffixIcons,
                prefixIcon: prefixIcons,
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
            ),
          ),
        ],
      );
    }
  }
