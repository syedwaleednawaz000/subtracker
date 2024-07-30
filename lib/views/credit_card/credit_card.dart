import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/views/base/settingIcon_screen.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';

import '../bottomnavbar/bottom_navBar.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';


class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {


  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0Xff1C1C23),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size32,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextWidgetInterRegular(
                      title: 'Credit Cards',
                      // color: AppColors.grey30,
                      fontSize: MySize.size16
                  ),
                  SizedBox(width: MySize.size100,),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child:  Image.asset('assets/icons/alert.png', height: 25, width: 25,),
                  ),
                ],
              ),
              SizedBox(height: MySize.size40,),
              Image.asset(AppImages.cardImage,  height: 280, width: 377,),
              SizedBox(height: MySize.size22,),
              TextWidgetInterMedium(title: 'Manage Plan',
                  // color: AppColors.white100, fontSize: 16
              ),
              SizedBox(height: MySize.size7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 68,
                    width: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: const Border(
                        top: BorderSide(color: AppColors.accentLine),
                      ),
                      color: AppColors.grey20.withOpacity(.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidgetInterMedium(
                            title: 'monthly',
                            fontSize: MySize.size12,
                            // color: Color(0XFF83839C)
                        ),
                        // color: AppColors.white100.withOpacity(.4)),
                        TextWidgetInterMedium(
                            title: '\9.95',
                            fontSize: MySize.size14,
                            // color: AppColors.white100
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    height: 68,
                    width: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: const Border(
                        top: BorderSide(color: AppColors.pinkLine),
                      ),
                      color: AppColors.grey20.withOpacity(.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidgetInterMedium(
                            title: 'Yearly',
                            fontSize: MySize.size12,
                            // color: Color(0XFF83839C)
                        ),
                        // color: AppColors.white100.withOpacity(.4)),
                        TextWidgetInterMedium(
                            title: '\39.95',
                            fontSize: MySize.size14,
                            // color: AppColors.white100
                        ),
                      ],
                    ),
                  ),
          
                ],
              ),
              SizedBox(height: MySize.size30,),
              Container(
                height: MySize.scaleFactorHeight * 185,
                width: MySize.scaleFactorWidth * 375,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: const Border(
                    top: BorderSide(color: AppColors.accentLine),
                  ),
                  color: Color(0XFF353542),
                ),
          child:     Center(
            child: DottedBorder(
              dashPattern: [10, 20],
              color: AppColors.grey30.withOpacity(.3),
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              // padding: EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: MySize.scaleFactorHeight * 84, width: MySize.scaleFactorWidth * 328,
                  // color: AppColors.progressColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidgetInterMedium(title: 'Add new Card',
                        // color: AppColors.grey30.withOpacity(.3),
                      ),
                      const SizedBox(width: 24,),
                      Icon(Icons.add_circle_outline_sharp, color: AppColors.grey30.withOpacity(.3),)
                    ],
                  ),
                ),
              ),
            ),
          ),
              ),
              // Expanded(child: BNavBar()),
            ],
          ),
        ),
      ),
    );
  }
}
