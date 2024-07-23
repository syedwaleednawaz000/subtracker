import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
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
                mytitle: 'Sign up with Apple',
                textColor: Colors.white, // Always white
              ),
              // FieldContainer(
              //   myImage: 'assets/icons/apple.png',
              //   // containerColor:  Provider.of<ThemeChanger>(context)
              //   //   .themeData == darkMode
              //   //   ? AppColors.grey100
              //   //   : AppColors.grey100,
              //   containerColor: AppColors.grey100,
              //   mytitle: 'Sign up with Apple',
              //   // textColor: Provider.of<ThemeChanger>(context)
              //   //   .themeData == darkMode
              //   //   ? Colors.white
              //   //   : Colors.white,
              //   textColor: Colors.white,
              // ),
              SizedBox(height: 16,),
              FieldContainer(
                myImage: AppImages.googleIcon,
              containerColor:  Provider.of<ThemeChanger>(context)
                  .themeData == darkMode
                  ? AppColors.white100
                  : AppColors.white100,

                mytitle: 'Sign up with Google',
                  // 1C1C23
                textColor:  Provider.of<ThemeChanger>(context)
                  .themeData == darkMode
                  ? Color(0XFF1C1C23)
                  :  Color(0XFF1C1C23),
              ),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => LoginScreen()));
                },
                child: FieldContainer(
                  containerColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ? AppColors.grey30.withOpacity(.3)
                      : AppColors.grey30.withOpacity(.3),
                  mytitle: 'Sign up with E-mail',
                  textColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ?  AppColors.white100
                      :  AppColors.white100,
                ),
              ),
              SizedBox(height: 16,),
              Text('OR',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Provider.of<ThemeChanger>(context)
                  .themeData == darkMode
                  ? Color(0XFFFFFFFF)
                  :  Color(0XFFFFFFFF),
              ),
              ),


              SizedBox(height: 16,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => SignupScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.only( bottom: MySize.size30),
                  child: FieldContainer(
                    containerColor:  Provider.of<ThemeChanger>(context)
                        .themeData == darkMode
                        ?  AppColors.grey30.withOpacity(.3)
                        :  AppColors.grey30.withOpacity(.3),

                    mytitle: 'Sign in with E-mail',
                    textColor:  Provider.of<ThemeChanger>(context)
                        .themeData == darkMode
                        ?   AppColors.white100
                        :    AppColors.white100,


                  ),
                ),
              ),
              SizedBox(height: 16,),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: TextWidgetInterBold(title: 'By registering, you agree to our Terms of Use. Learn \nhow we collect, use and share your data.',
              //       align: TextAlign.center,
              //       fontSize: 11,
              //       // fontWeight: FontWeight.w400,
              //       color: AppColors.grey30.withOpacity(.3)),
              // ),
              Text('By registering, you agree to our Terms of Use. Learn \nhow we collect, use and share your data.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0XFF666680),
              ),),
              SizedBox(height: 25,),
            ],
          ),
        ));
  }
}

