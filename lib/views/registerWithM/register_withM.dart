import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../auth/login/login_screen.dart';
import '../base/field_container.dart';



class RegisterWithM extends StatelessWidget {
  const RegisterWithM({super.key});
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        // backgroundColor: Color(0XFF1C1C23),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg2Image), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const Spacer(),
               FieldContainer(
                myImage: AppImages.appleIcon,
                containerColor: AppColors.grey100, // Always grey100
                mytitle:  AppLocalizations.of(context)!.sign_up_with_apple,
                textColor: Colors.white, // Always white
              ),
               SizedBox(height:MySize.size16,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MySize.size30),
                decoration: BoxDecoration(
                  color:  Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.25),
                      offset: const Offset(0, 8),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(MySize.size40),
                ),
                child:  FieldContainer(
                  myImage: AppImages.googleIcon,
                  containerColor: Colors.white,
                  mytitle:AppLocalizations.of(context)!.sign_up_with_google,
                  textColor: Colors.black,
                ),
              ),

              SizedBox(height:MySize.size25,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => const SignupScreen()));
                },
                child: FieldContainer(
                  containerColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ? AppColors.grey30.withOpacity(.3)
                      : AppColors.grey30.withOpacity(.3),
                  mytitle: AppLocalizations.of(context)!.sign_up_with_email,
                  textColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ?  AppColors.white100
                      :  AppColors.white100,
                ),
              ),
              SizedBox(height:MySize.size19,),
              Text(AppLocalizations.of(context)!.or_or,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Provider.of<ThemeChanger>(context)
                  .themeData == darkMode
                  ? const Color(0XFFFFFFFF)
                  :  const Color(0XFFFFFFFF),
              ),
              ),
              SizedBox(height:MySize.size19,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
                },
                child: FieldContainer(
                  containerColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ?  AppColors.grey30.withOpacity(.3)
                      :  AppColors.grey30.withOpacity(.3),

                  mytitle: AppLocalizations.of(context)!.sign_in_with_email,
                  textColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ?   AppColors.white100
                      :    AppColors.white100,
                ),
              ),
              SizedBox(height:MySize.size24,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MySize.size24),
                child:  Text(
                  AppLocalizations.of(context)!.by_registering_you_agree_to_our_terms_of_use_learn_how_we_collect_use_and_share_your_data,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF666680),
                ),),
              ),
              SizedBox(height:MySize.size38,),
            ],
          ),
        ));
  }
}

