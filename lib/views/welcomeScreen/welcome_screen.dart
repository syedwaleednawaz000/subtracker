import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../base/field_container.dart';
import '../registerWithM/register_withM.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
        ),
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: 300, width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0XFF3F3F4B), Color(0XFF1C1C23), ]),

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: AppColors.black00.withOpacity(.25)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( left: 44, right: 48, bottom: 11),
                      child: Text('Manage all your \nsubscriptions in one place effortlessly.',
                      style: TextStyle(
                          color: Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ? Colors.white
                              : Colors.white,
                          fontWeight: FontWeight.w600, fontSize: 20
                      ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterWithM()));
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 52, width: 190,
                              decoration: BoxDecoration(
                                color: Color(0XFF424252),
                                // color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(-4, 8),
                                    blurRadius: 25,
                                    color: Colors.white.withOpacity(.2)
                                  )
                                ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Get started',
                                    style: TextStyle(
                                       color: Provider.of<ThemeChanger>(context)
                                            .themeData == darkMode
                                            ? Colors.white
                                            : Colors.white,
                                        fontSize: 14, fontWeight: FontWeight.w600
                                    ),
                                      ),

                                   SizedBox(width:  MySize.size5,),
                                 Image.asset('assets/icons/right_arrow.png', scale: 3.5,),
                                ],
                              ),
                            ),

                            Stack(
                             children: [
                               Positioned(
                                   child: Image.asset('assets/images/bb.png', scale: 3.4,)),
                               Positioned(
                                   right: MySize.size56,
                                   top: MySize.size56,
                                   child: Image.asset('assets/images/s.png', scale: 3,)),
                               Positioned(
                                   left: MySize.size64,
                                   top: MySize.size68,
                                   child: Image.asset('assets/images/m.png', scale: 3.4,)),


                             ],
                           )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )


            ],
          ),
      ));
    }
}

