import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
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
  bool val = false;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: Color(0XFF1C1C23),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg3Image), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 28, bottom: 165, left: 115, right: 115),
                ),
                Text( 'Welcome Back!',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 24,
                        color: Colors.white
                    ),),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24 ,top: 22),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('E-mail address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF666680),
                            ),),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color:  Color(0XFF666680)
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                                contentPadding: EdgeInsets.only(left: 20, right: 20),
                                hintText: 'Email',
                                hintStyle:  TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins_Regular',
                                  color: Color(0XFF666680).withOpacity(.3),
                                ),
                                suffixIcon: Icon(Icons.mail, color: Color(0XFF666680).withOpacity(.3),),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2))),
                                focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                          ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                            ),
                          ),)
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF666680),
                            ),),
                          SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color:  Color(0XFF666680)
                            ),
                            obscureText: isSelected,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 20, right: 20),
                                hintText: 'Password',
                                hintStyle:  TextStyle(
                                  fontFamily: 'Poppins_Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF666680).withOpacity(.3),
                                ),
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    isSelected = !isSelected;
                                  });
                                }, icon: isSelected
                                ? Icon(Icons.lock_open, color: Color(0XFF666680).withOpacity(.3),)
                                : Icon(Icons.lock_rounded, color: Color(0XFF666680).withOpacity(.3),)
                                 ),
            
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color:Color(0XFF4E4E61).withOpacity(.2))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                            ),
                          ),),
                        ],
                      ),
            
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Checkbox(

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              fillColor: MaterialStateProperty.all(
                                Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.transparent
                                    : Colors.transparent,
                              ),
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              checkColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                               ? Color(0XFFA2A2B5)
                               : Color(0XFFA2A2B5),
                              side: BorderSide(style: BorderStyle.solid,width: 1, color: Color(0XFF353542).withOpacity(.95)),
                              value: val, onChanged: (value) => setState(() {
                              val = !val;
                            } ),),
                            Text('Remember me',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF666680),
                              ),),
                              Spacer(),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                                },
                                child:  Text('Forgot password?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0XFF666680),
                                  ),),  )
                          ],
                        ),
                      ),
            
                    ],
                  ),
                ),
            
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => BnavBar()));
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.only(top: MySize.size28, ),
                    child: Container(
                        height: MySize.scaleFactorHeight * 48,
                        width: MySize.scaleFactorWidth * 333,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size40),
                          border: Border(
                            top: BorderSide(color: Colors.white.withOpacity(.5)),
                            left: BorderSide(color: Colors.white.withOpacity(.5)),
                            // right: BorderSide(color: Colors.white.withOpacity(.5)),
                            bottom: BorderSide.none
                          ),
                          // border: Border.all(color: Colors.white.withOpacity(.5)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 25,
                                color: Color(0XFF4F63BE).withOpacity(.5)
                            )
                          ],
                          color: Color(0XFF758AFF),
                        ),
                        child: Center(
                          child: Text('Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 16)
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 25,),
                Column(
                  children: [
                    Image.asset(AppImages.faceID, height: 58,),
                    SizedBox(height: 15,),
                    Text('Enable Face ID',
                        style: TextStyle(
                            fontFamily: 'Poppins_Regular',
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: Color(0XFFF0F4F7)
                        ),
                    )
                  ],
                ),
                SizedBox(height: 22,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 12),
                  child: Text(
                    'If you don\'t have an account yet?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => SignupScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MySize.size30),
                    child: FieldContainer(
                      containerColor:  Provider.of<ThemeChanger>(context)
                          .themeData == darkMode
                          ? AppColors.grey30.withOpacity(.15)
                          : AppColors.grey30.withOpacity(.15),
            
                      mytitle: 'Sign Up',
                      textColor: AppColors.white100.withOpacity(.7),
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        ));
  }
}
