//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
// import 'package:sub_tracker/utils/app_Images.dart';
// import 'package:sub_tracker/utils/app_colors.dart';
// import 'package:sub_tracker/views/language_selection/language_selection.dart';
// import 'package:sub_tracker/views/spending_budgets/spending_budgets.dart';
// import '../../notification_screen/notification_screen.dart';
// import '../../theme/theme.dart';
// import '../../utils/my_size.dart';
// import '../base/custom_dottContainer.dart';
// import '../base/linear_colorBar.dart';
// import '../base/round_progressBar.dart';
// import '../base/settingIcon_screen.dart';
// import '../base/text_widgets.dart';
//
//
// class AddNewCategory extends StatefulWidget {
//   const AddNewCategory({super.key});
//
//   @override
//   State<AddNewCategory> createState() => _AddNewCategoryState();
// }
//
// class _AddNewCategoryState extends State<AddNewCategory> {
//
//   List<String> titleText      =  ['Auto & Transport', 'Entertainment', 'Security'];
//   List<String> subtitleText   =  ['\$375 left to spend','\$375 left to spend', '\$375 left to spend' ];
//
//   List<String> trailTitle      =  ['\$25.99', '\$50.99', '\$5.99'];
//   List<String> trailSubtitle   =  ['of \$400','of \$600', 'of \$600' ];
//
//   List<Color> gradientColors = [AppColors.accent100, Color(0XFF758AFF), AppColors.purpleLine];
//
//   List<int> lineMaxSteps = [30, 30, 30];
//   List<int> lineCurrentSteps = [10, 18, 24];
//
//   List<Widget> myIcon = [
//     Image.asset(AppImages.carIcon,scale: 4,),
//     Image.asset(AppImages.starsIcon, scale: 4,),
//     Image.asset(AppImages.fingerIcon, scale: 4,),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);
//     return SafeArea(
//       child: Scaffold(
//          resizeToAvoidBottomInset: false,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(MySize.size72),
//           child: Padding(
//             padding: EdgeInsets.only(left: 8, top: MySize.size25),
//             child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: AppBar(
//                   scrolledUnderElevation: 0,
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   centerTitle: true,
//                   title:  Text('Spending & Budgets Category',style: TextStyle(color: Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
//                   actions: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 25),
//                       child: InkWell(
//                           onTap: (){
//
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
//                           },
//                           child: Image.asset('assets/icons/alert.png', height: 25, width: 25,
//                             color: Provider.of<ThemeChanger>(context).themeData ==
//                                 darkMode
//                                 ? Color(0XFFC1C1CD)
//                                 : Color(0XFF424252),
//                           )),
//                     )
//                   ],
//                 )
//             ),
//           ),
//         ),
//         backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
//             ? Color(0XFF1C1C23)
//             : Color(0XFFF7F7FF),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // SizedBox(height: MySize.size20,),
//             //
//             //
//             // Container(
//             //   height: MySize.size60,
//             //   width: MySize.scaleFactorWidth *  326,
//             //   decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.circular(16),
//             //     color: Colors.transparent,
//             //     border: Border.all(
//             //         color:   Provider.of<ThemeChanger>(context).themeData == darkMode
//             //             ? Color(0XFF4E4E61)
//             //             : Color(0XFF4E4E61).withOpacity(.2),
//             //         width: 1),
//             //   ),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.center,
//             //     children: [
//             //       TextWidgetInterMedium(title: 'Your budgets are on track',
//             //           // color: AppColors.white100,
//             //           fontSize: MySize.size14),
//             //       SizedBox(width: MySize.size25,),
//             //       Image.asset('assets/icons/hand.png', width: 14, height: 16)
//             //     ],
//             //   ),),
//             // SizedBox(height: MySize.size16,),
//             // ListView.builder(
//             //   physics: NeverScrollableScrollPhysics(),
//             //
//             //   itemCount: titleText.length,
//             //   shrinkWrap: true,
//             //   itemBuilder: (context, index) {
//             //     return Padding(
//             //       padding: EdgeInsets.only(bottom: MySize.size8),
//             //       child: Column(
//             //         children: [
//             //           Container(
//             //             height: MySize.scaleFactorHeight * 96,
//             //             width: MySize.scaleFactorWidth * 326,
//             //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(MySize.size16),
//             //                 color:   Provider.of<ThemeChanger>(context).themeData == darkMode
//             //                     ? Color(0XFF4E4E61).withOpacity(.2)
//             //                     : Color(0XFFF1F1FF),
//             //                 border: Border.all(color:   Provider.of<ThemeChanger>(context).themeData == darkMode
//             //                     ? Color(0XFFCFCFFC).withOpacity(.15)
//             //                     : Color(0XFFCFCFFC).withOpacity(.15),)
//             //             ),
//             //             child: Column(
//             //               mainAxisAlignment: MainAxisAlignment.center,
//             //               children: [
//             //                 ListTile(
//             //                   title:  Text( titleText[index],
//             //                     textAlign: TextAlign.start,
//             //                     style: TextStyle(
//             //                       fontSize: MySize.size16,
//             //                       fontWeight: FontWeight.w600,
//             //                       color: Provider.of<ThemeChanger>(context).themeData ==
//             //                           darkMode
//             //                           ? Color(0XFFFFFFFF)
//             //                           : Color(0XFF424252),
//             //                     ),
//             //                   ),
//             //
//             //                   subtitle:  Text( subtitleText[index],
//             //                     textAlign: TextAlign.start,
//             //                     style: TextStyle(
//             //                       fontSize: MySize.size12,
//             //                       fontWeight: FontWeight.w500,
//             //                       color: Provider.of<ThemeChanger>(context).themeData ==
//             //                           darkMode
//             //                           ? Color(0XFFA2A2B5 )
//             //                           : Color(0XFF424252),
//             //                     ),
//             //                   ),
//             //
//             //                   leading: myIcon[index],
//             //                   trailing: Column(
//             //                     mainAxisAlignment: MainAxisAlignment.center,
//             //                     children: [
//             //                       Text( trailTitle[index],
//             //                         textAlign: TextAlign.start,
//             //                         style: TextStyle(
//             //                           fontSize: MySize.size16,
//             //                           fontWeight: FontWeight.w600,
//             //                           color: Provider.of<ThemeChanger>(context).themeData ==
//             //                               darkMode
//             //                               ? Color(0XFFFFFFFF)
//             //                               : Color(0XFF424252),
//             //                         ),
//             //                       ),
//             //                       Text( trailSubtitle[index],
//             //                         textAlign: TextAlign.start,
//             //                         style: TextStyle(
//             //                           fontSize: MySize.size12,
//             //                           fontWeight: FontWeight.w500,
//             //                           color: Provider.of<ThemeChanger>(context).themeData ==
//             //                               darkMode
//             //                               ? Color(0XFFA2A2B5)
//             //                               : Color(0XFF424252),
//             //                         ),
//             //                       ),
//             //
//             //
//             //                     ],
//             //                   ),
//             //                 ),
//             //                 Padding(
//             //                   padding: EdgeInsets.only(bottom: 5, left: MySize.size20, right: MySize.size25),
//             //                   child: LinearColorBar( index: index, lineMaxSteps: lineMaxSteps, lineCurrentSteps: lineCurrentSteps, gradientColors: gradientColors),
//             //                 )
//             //
//             //               ],
//             //             ),
//             //           ),
//             //
//             //         ],
//             //       ),
//             //     );
//             //   },),
//             Container(
//               height: MySize.scaleFactorHeight * 96,
//               width: MySize.scaleFactorWidth * 326,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(MySize.size16),
//                   color:   Provider.of<ThemeChanger>(context).themeData == darkMode
//                       ? Color(0XFF4E4E61).withOpacity(.2)
//                       : Color(0XFFF1F1FF),
//                   border: Border.all(color:   Provider.of<ThemeChanger>(context).themeData == darkMode
//                       ? Color(0XFFCFCFFC).withOpacity(.15)
//                       : Color(0XFFCFCFFC).withOpacity(.15),)
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ListTile(
//                     title:  Text( 'titleText',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: MySize.size16,
//                         fontWeight: FontWeight.w600,
//                         color: Provider.of<ThemeChanger>(context).themeData ==
//                             darkMode
//                             ? Color(0XFFFFFFFF)
//                             : Color(0XFF424252),
//                       ),
//                     ),
//
//                     subtitle:  Text( 'subtitleText',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: MySize.size12,
//                         fontWeight: FontWeight.w500,
//                         color: Provider.of<ThemeChanger>(context).themeData ==
//                             darkMode
//                             ? Color(0XFFA2A2B5 )
//                             : Color(0XFF424252),
//                       ),
//                     ),
//
//                     leading: Text('myIcon'),
//                     trailing: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text( 'trailTitle',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: MySize.size16,
//                             fontWeight: FontWeight.w600,
//                             color: Provider.of<ThemeChanger>(context).themeData ==
//                                 darkMode
//                                 ? Color(0XFFFFFFFF)
//                                 : Color(0XFF424252),
//                           ),
//                         ),
//                         Text( 'trailSubtitle',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: MySize.size12,
//                             fontWeight: FontWeight.w500,
//                             color: Provider.of<ThemeChanger>(context).themeData ==
//                                 darkMode
//                                 ? Color(0XFFA2A2B5)
//                                 : Color(0XFF424252),
//                           ),
//                         ),
//
//
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 5, left: MySize.size20, right: MySize.size25),
//                     child: LinearColorBar( index: 0, lineMaxSteps: lineMaxSteps, lineCurrentSteps: lineCurrentSteps, gradientColors: gradientColors),
//                   )
//
//                 ],
//               ),
//             ),
//             SizedBox(height: 45,),
//             Container(
//               height: 400, width: 300,
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(
//                      Radius.circular(16),),
//                   color: Provider.of<ThemeChanger>(context).themeData == darkMode
//                       ? Color(0XFF353542)
//                       : Color(0XFFF1F1FF).withOpacity(.86),
//                   boxShadow: [
//                     BoxShadow(
//                         offset: Offset(0, 4),
//                         blurRadius: 4,
//                         color: AppColors.black00.withOpacity(.25)
//                     )
//                   ]
//               ),
//               child: Column(
//                 children: [
//                  const Text('Enter title: ' , style:  TextStyle(
//                            color: Colors.white
//                            ),),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//                    child: TextFormField(
//                      style: const TextStyle(
//                        color: Colors.white
//                      ),
//                      decoration: InputDecoration(
//                        isDense: true,
//                        hintText: 'Enter title here',
//                        enabledBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(16),
//                            borderSide: BorderSide(
//                              color: Colors.white,
//                            )
//
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(16),
//                            borderSide: BorderSide(
//                            color: Colors.white,
//                        )
//                        ),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(16),
//                          borderSide: BorderSide(color: Colors.white)
//                        )
//                      ),
//                    ),
//                  ),
//                   SizedBox(height: 30,),
//                   const Text('Enter subTitle: ' , style:  TextStyle(
//                       color: Colors.white
//                   ),),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//                     child: TextFormField(
//                       style: const TextStyle(
//                           color: Colors.white
//                       ),
//                       decoration: InputDecoration(
//                           isDense: true,
//                           hintText: 'Enter title here',
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                               )
//
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                               )
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               borderSide: BorderSide(color: Colors.white)
//                           )
//                       ),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             Spacer(),
//             Container(
//           height: 114,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(40), topRight: Radius.circular(40)),
//               color: Provider.of<ThemeChanger>(context).themeData == darkMode
//                   ? Color(0XFF353542)
//                   : Color(0XFFF1F1FF).withOpacity(.86),
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
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SpendingBudgets()));
//                 },
//                 child: Container(
//                     height: 48,
//                     width: 288,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       color: Provider.of<ThemeChanger>(context).themeData ==
//                           darkMode
//                           ? Color(0XFFFFFFFF).withOpacity(.1)
//                           : Color(0XFFF1F1FF),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Save',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color:
//                           Provider.of<ThemeChanger>(context).themeData ==
//                               darkMode
//                               ? Colors.white
//                               : Color(0XFF1c1c23),
//                         ),
//                       ),
//                     )),
//               ),
//             ],
//           ),
//         ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
