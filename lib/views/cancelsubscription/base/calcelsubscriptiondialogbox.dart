// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// import '../../../utils/app_colors.dart';
// import '../../../utils/my_size.dart';
// import '../../base/text_widgets.dart';
// import '../../settings/settings.dart';
//
// class CancelSubsDialogBox extends StatelessWidget {
//   const CancelSubsDialogBox({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         showDialog(
//           context: context,
//           builder: (context) {
//             return BackdropFilter(
//               filter:
//               ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
//               child: AlertDialog(
//                   backgroundColor: AppColors.black00,
//                   surfaceTintColor: AppColors.whiteFF,
//                   titlePadding:
//                   EdgeInsets.only(top: MySize.size30),
//                   title: Column(
//                     children: [
//                       TextWidgetInterBold(
//                         title: 'Cancel Subscription',
//                         fontSize: MySize.size18,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteFF,
//                       ),
//                       SizedBox(height: MySize.size8,),
//                       TextWidgetInterBold(
//                         title:
//                         'Are you sure you want to delete the\naccount?',
//                         fontSize: MySize.size14,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.whiteFF,
//                         align: TextAlign.center,
//
//                       ),
//                       SizedBox(
//                         height: MySize.size20,
//                       ),
//                       const Divider(color: AppColors.grey61,),
//                       Row(
//                         mainAxisAlignment:
//                         MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: TextWidgetInterBold(
//                               title: 'Decline',
//                               fontSize: MySize.size14,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.red00,
//                               align: TextAlign.center,
//                             ),
//                           ),
//                           SizedBox(
//                             width: MySize.size10,
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 40),
//                               child: TextWidgetInterBold(
//                                 title: 'Accept',
//                                 fontSize: MySize.size14,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xff2B83F2),
//                                 align: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   )),
//             );
//           },
//         );
//       },
//       child:
//         Container(
//           height: 114, width: double.infinity,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [Color(0XFF1C1C23), Color(0XFF3F3F4B)]),
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
//               boxShadow: [
//                 BoxShadow(
//                     offset: Offset(0, 4),
//                     blurRadius: 4,
//                     color: AppColors.black00.withOpacity(.25)
//                 )
//               ]
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap:(){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 },
//                 child: Container(
//                     height: 48, width: 288,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         color: Color(0XFFFFFFFF).withOpacity(.15),
//                         border: Border.all(color: Color(0XFFFFFFFF).withOpacity(.1))
//                     ),
//                     child: Center(child: TextWidgetInterMedium(title: 'Cancel Subscription', color: Colors.white))),
//               ),
//             ],
//           ),
//         ),
//     );
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class CancelSubsDialogBox extends StatelessWidget {
  String planID;
   CancelSubsDialogBox({required this.planID,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter:
                ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: AlertDialog(
                    // backgroundColor:,
                    backgroundColor: Provider.of<ThemeChanger>(context).themeData ==
                    darkMode ?  Color(0XFF1C1C23) :  Color(0XFFF1F1FF),
                    // surfaceTintColor: Colors.red,
                    titlePadding: EdgeInsets.only(top: 25),
                    title: Column(
                      children: [
                        Text('Cancel Subscription',
                        style: TextStyle(
                          fontSize: 18,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode ? Colors.white : Color(0XFF1c1c23),
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        SizedBox(height: MySize.size8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child:  Text(
                            textAlign: TextAlign.center,
                            'Are you sure you want to delete the\naccount?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF424252),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MySize.size20,
                        ),
                        const Divider(color: AppColors.grey61,),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Decline',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.red : Colors.red,
                              ),
                              )
                            ),
                            SizedBox(
                              width: MySize.size10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Text('Accept',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                        ? Color(0XFF2B83F2) : Color(0XFF2B83F2),
                                  ),
                                )
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              );
            },
          );
        },
        child: Container(
            height: MySize.scaleFactorHeight * 48,
            width: MySize.scaleFactorWidth * 288,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(MySize.size24),
                border: Border.all(
                  color: Colors.white.withOpacity(.15),
                )
            ),
            child: Center(
              child: TextWidgetInterMedium(
                  title: 'Cancel Subscription',
                  // color: AppColors.whiteFF,
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w600),
            ),
            ),
        );
    }
}

