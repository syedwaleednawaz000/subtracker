// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/app_constant.dart';
// import '../../utils/my_size.dart';
// import '../add_card/Add_card.dart';
// import '../base/text_widgets.dart';
// import '../language_selection/base/custom_appBar.dart';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//
//   bool tap = true;
//   bool tap1 = true;
//   bool tap2 = true;
//   int selectedIndex = -1;
//   List<String> titleContainer = ['Credit Card', 'Debit Card', 'Pay Pal'];
//   List<String> containerImages= [
//     AppConstant.credit_cardIcon,
//     AppConstant.debit_cardIcon,
//     AppConstant.paypalIcon
//   ];
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(MySize.size72),
//         child: Padding(
//           padding: EdgeInsets.only(left: MySize.size25, top: MySize.size25),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const CustomAppBar(
//               text: 'Manage Payment',
//               icon: Icons.arrow_back_rounded,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: const Color(0XFF1C1C23),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 37, right: 38, top: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25, bottom: 10),
//                   child: TextWidgetInterBold(
//                     title: 'Payment Method', fontSize: 20,
//                     color: Colors.white,fontWeight: FontWeight.w500,),
//                 ),
//                // SingleChildScrollView(
//                //  scrollDirection: Axis.horizontal,
//                //   child: Row(
//                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                //     children: [
//                //       InkWell(
//                //         onTap: (){
//                //           setState(() {
//                //             tap = ! tap;
//                //           });
//                //         },
//                //         child: Container(
//                //           height: 110, width: 124,
//                //           decoration: BoxDecoration(
//                //               color: tap ? Color(0XFF758AFF) : Colors.white,
//                //               borderRadius: BorderRadius.all(Radius.circular(20)),
//                //           ),
//                //           child: Column(
//                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                //             children: [
//                //               Image.asset(AppConstant.debit_cardIcon, height: 50, width: 75, color: tap ? Colors.white :  Color(0XFF17508F),),
//                //               TextWidgetInterRegular(title: 'Credit Card', fontSize: 12, fontWeight: FontWeight.w500, color: tap ? Colors.white :  Color(0XFF17508F))
//                //             ],
//                //           ),
//                //         ),
//                //       ),
//                //       const SizedBox(width: 15,),
//                //       InkWell(
//                //         onTap: (){
//                //           setState(() {
//                //             tap1 = ! tap1;
//                //           });
//                //         },
//                //         child: Container(
//                //           height: 110, width: 124,
//                //           decoration: BoxDecoration(
//                //             color: tap1 ? Color(0XFF758AFF) : Colors.white,
//                //             borderRadius: const BorderRadius.all(Radius.circular(20)),
//                //           ),
//                //           child: Column(
//                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                //             children: [
//                //               Image.asset(AppConstant.credit_cardIcon, height: 50, width: 75,color: tap1 ? Colors.white :  Color(0XFF17508F),),
//                //               TextWidgetInterRegular(title: 'Debit Card', fontSize: 12, fontWeight: FontWeight.w500,
//                //                   color: tap1 ? Colors.white :  Color(0XFF17508F))
//                //             ],
//                //           ),
//                //         ),
//                //       ),
//                //
//                //       const SizedBox(width: 15,),
//                //       InkWell(
//                //         onTap: (){
//                //           setState(() {
//                //             tap2 = ! tap2;
//                //           });
//                //         },
//                //         child: Container(
//                //           height: 110, width: 124,
//                //           decoration: BoxDecoration(
//                //             color: tap2 ? Color(0XFF758AFF) : Colors.white,
//                //             borderRadius: const BorderRadius.all(Radius.circular(20)),
//                //           ),
//                //           child: Column(
//                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                //             children: [
//                //               Image.asset(AppConstant.paypalIcon, height: 50, width: 75,color: tap2 ? Colors.white :  Color(0XFF17508F),),
//                //               TextWidgetInterRegular(
//                //                   title: 'Pay pal', fontSize: 12, fontWeight: FontWeight.w500, color: tap2 ? Colors.white:  Color(0XFF17508F))
//                //             ],
//                //           ),
//                //         ),
//                //       ),
//                //     ],
//                //   ),
//                // ),
//
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: List.generate(3, (index) {
//                         bool isSelected = index == selectedIndex;
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = index;
//                             });
//                           },
//                           child: Column(
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 37),
//                                 child: Container(
//                                   height: 124,
//                                   width: 110,
//                                   decoration: BoxDecoration(
//                                     color: isSelected ? Color(0XFF17508F) : Colors.white,
//                                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Image.asset(
//                                         containerImages[index],
//                                         height: 50,
//                                         width: 75,
//                                         color: isSelected ? Colors.white : Color(0XFF17508F),
//                                       ),
//                                       TextWidgetInterRegular(
//                                         title: titleContainer[index],
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color: isSelected ? Colors.white : Color(0XFF17508F),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 15),
//                               Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Container(
//                                     height: 28,
//                                     width: 28,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 1)),
//                                       shape: BoxShape.circle,
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 12,
//                                     width: 12,
//                                     decoration: BoxDecoration(
//                                       color: isSelected ? Colors.grey : Colors.transparent,
//                                       shape: BoxShape.circle,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 60,),
//                 Container(
//                   height: 44, width: 320,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(20)),
//                       color: const Color(0XFF168DBC).withOpacity(.10)
//                   ),
//                   child: Row(
//                     children: [
//                       const SizedBox(width: 15,),
//                       const Icon(Icons.add, color: Color(0XFF757784)),
//                       const SizedBox(width: 15,),
//                       InkWell(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const AddCardScreen()),
//                             );
//                           },
//                           child: TextWidgetInterMedium(title: 'Add Card', fontSize: 14,color: Color(0XFF757784), fontWeight: FontWeight.w400, ))
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 17,),
//                 TextWidgetInterMedium(title: 'Cards', fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
//                 const SizedBox(height: 8,),
//                 Container(
//                   height: 54, width: 320,
//                   decoration: BoxDecoration(
//
//                   boxShadow: [BoxShadow(
//                   color: AppColors.black00.withOpacity(.15),
//                     spreadRadius: 0,
//                     blurRadius: 2
//                 )],
//                       borderRadius: const BorderRadius.all(Radius.circular(5)),
//                       color: Color(0XFF272730)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: Row(
//                       children: [
//                         Image.asset('assets/images/mastercard.png', height: 13, width: 22,),
//                         const SizedBox(width: 15,),
//                         TextWidgetInterMedium(title: '*** *** *** 1234', fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400, )
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 18,),
//
//                 TextWidgetInterMedium(title: 'Billing', fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
//                 const SizedBox(height: 8,),
//                 Container(
//                   height: 54, width: 320,
//                   decoration: BoxDecoration(
//
//                       boxShadow: [BoxShadow(
//                           color: AppColors.black00.withOpacity(.15),
//                           spreadRadius: 0,
//                           blurRadius: 2
//                       )],
//                       borderRadius: const BorderRadius.all(Radius.circular(5)),
//                       color: Color(0XFF272730)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child:Row(
//                       children: [
//                         TextWidgetInterMedium(title: 'Yearly Subscription', fontSize: 14, fontWeight: FontWeight.w500, color:Colors.white),
//                         const Spacer(),
//                         TextWidgetInterMedium(title: '24.50 CHF', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 15,),
//                 Align(
//                     alignment: Alignment.centerRight,
//                     child: TextWidgetInterMedium(title: 'Total: 24.50 CHF', fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0XFF505050))),
//
//               ],
//             ),
//           ),
//           // Spacer(),
//           Container(
//             height: 114, width: double.infinity,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Color(0XFF1C1C23), Color(0XFF3F3F4B)]),
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(0, 4),
//                       blurRadius: 4,
//                       color: AppColors.black00.withOpacity(.25)
//                   )
//                 ]
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                     height: 48, width: 288,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         color: Color(0XFFFFFFFF).withOpacity(.15),
//                         border: Border.all(color: Color(0XFFFFFFFF).withOpacity(.1))
//                     ),
//                     child: Center(child: TextWidgetInterMedium(title: 'Save', color: Colors.white))),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
// class CustomListTile extends StatelessWidget {
//   const CustomListTile({
//     super.key,
//     required this.title,
//     required this.imageIcon,
//   });
//
//   final String title;
//   final String imageIcon;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: ListTile(
//         dense: true,
//         // contentPadding: EdgeInsets.zero,
//         visualDensity: const VisualDensity(vertical: -4),
//         title: TextWidgetInterRegular(
//             title: title,
//             fontSize: 12, color: const Color(0XFFF0F4F7),
//             fontWeight: FontWeight.w400),
//         leading: Image.asset(imageIcon, width: 16, height: 16,),
//       ),
//     );
//   }
// }

import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import 'package:sub_tracker/views/settings/settings.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../add_card/Add_card.dart';
import '../base/text_widgets.dart';
import '../language_selection/base/custom_appBar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  List<String> titleContainer = ['Credit Card', 'Debit Card', 'Pay Pal'];
  List<String> containerImages= [
    AppConstant.credit_cardIcon,
    AppConstant.debit_cardIcon,
    AppConstant.paypalIcon
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF1C1C23) : Color(0XFFF7F7FF),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(MySize.size72),
      //   child: Padding(
      //     padding: EdgeInsets.only(left: MySize.size3, top: MySize.size25),
      //     child: GestureDetector(
      //       onTap: () {
      //         Navigator.pop(context);
      //       },
      //       child: const CustomAppBar(
      //         text: 'Manage Payment',
      //         icon: Icons.arrow_back_rounded,
      //       ),
      //     ),
      //   ),
      // ),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: MySize.size25),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading:Image.asset('assets/icons/back_arrow.png', scale: 4.9,color: Color(0XFFA2A2B5),),
                title:  Text('Manage Payment',style: TextStyle(color: Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
              )
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only( top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 37,
                top: 25,
                bottom: 10,
              ),
              child: Text('Payment Method',
                style: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? Color(0XFFFFFFFF)
                      : Color(0XFF424252),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins_Regular'
                ),
              ),
            ),
            // SingleChildScrollView(
            //  scrollDirection: Axis.horizontal,
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       InkWell(
            //         onTap: (){
            //           setState(() {
            //             tap = ! tap;
            //           });
            //         },
            //         child: Container(
            //           height: 110, width: 124,
            //           decoration: BoxDecoration(
            //               color: tap ? Color(0XFF17508F) : AppColors.whiteColor,
            //               borderRadius: BorderRadius.all(Radius.circular(20)),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Image.asset(AppConstants.debit_cardIcon, height: 50, width: 75, color: tap ? AppColors.whiteColor :  Color(0XFF17508F),),
            //               TextWidgetInterRegular(title: 'Credit Card', fontSize: 12, fontWeight: FontWeight.w500, color: tap ? AppColors.whiteColor :  Color(0XFF17508F))
            //             ],
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 15,),
            //       InkWell(
            //         onTap: (){
            //           setState(() {
            //             tap1 = ! tap1;
            //           });
            //         },
            //         child: Container(
            //           height: 110, width: 124,
            //           decoration: BoxDecoration(
            //             color: tap1 ? Color(0XFF17508F) : AppColors.whiteColor,
            //             borderRadius: const BorderRadius.all(Radius.circular(20)),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Image.asset(AppConstants.credit_cardIcon, height: 50, width: 75,color: tap1 ? AppColors.whiteColor :  Color(0XFF17508F),),
            //               TextWidgetInterRegular(title: 'Debit Card', fontSize: 12, fontWeight: FontWeight.w500,
            //                   color: tap1 ? AppColors.whiteColor :  Color(0XFF17508F))
            //             ],
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 15,),
            //       InkWell(
            //         onTap: (){
            //           setState(() {
            //             tap2 = ! tap2;
            //           });
            //         },
            //         child: Container(
            //           height: 110, width: 124,
            //           decoration: BoxDecoration(
            //             color: tap2 ? Color(0XFF17508F) : AppColors.whiteColor,
            //             borderRadius: const BorderRadius.all(Radius.circular(20)),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Image.asset(AppConstants.paypalIcon, height: 50, width: 75,color: tap2 ? AppColors.whiteColor :  Color(0XFF17508F),),
            //               TextWidgetInterRegular(
            //                   title: 'Pay pal', fontSize: 12, fontWeight: FontWeight.w500, color: tap2 ? AppColors.whiteColor :  Color(0XFF17508F))
            //             ],
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 15,),
            //     ],
            //   ),
            // ),


            SizedBox(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: List.generate(3, (index) {
                      bool isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Container(
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                height: 124,
                                width: 117,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ?  Provider.of<ThemeChanger>(context)
                                           .themeData == darkMode
                                              ?  Color(0XFF758AFF)
                                              :  Color(0XFF758AFF)
                                      : Provider.of<ThemeChanger>(context)
                                           .themeData == darkMode
                                              ?  Color(0XFF272730)
                                              :  Color(0XFFF1F1FF),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      containerImages[index],
                                      height: 50,
                                      width: 75,
                                      color:  isSelected
                                          ? Provider.of<ThemeChanger>(context)
                                          .themeData == darkMode
                                          ?  Colors.white
                                          :  Colors.white
                                          : Provider.of<ThemeChanger>(context)
                                          .themeData == darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),

                                    Text(
                                      titleContainer[index],
                                      style: TextStyle(
                                        color:  isSelected
                                            ? Provider.of<ThemeChanger>(context)
                                            .themeData == darkMode
                                            ? Colors.white
                                            : Colors.white
                                            : Provider.of<ThemeChanger>(context)
                                            .themeData == darkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 19,
                                  width: 19,
                                  decoration: BoxDecoration(
                                    color: isSelected? Colors.white : Colors.transparent,
                                    border: Border.fromBorderSide(BorderSide(color: Color(0XFFD0D5DD), width: 1)),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: isSelected ? Color(0XFF1C1C23) : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 37,),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCardScreen()),
                  );
                },
                child: Container(
                  height: 44,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color:  Provider.of<ThemeChanger>(context)
                          .themeData == darkMode
                          ? Color(0XFF272730)
                          :  Color(0XFFF1F1FF),
                  // border: Border.all(
                  //   width: 1,
                  //   color: Provider.of<ThemeChanger>(context)
                  //       .themeData == darkMode
                  //       ? Color(0XFF757784).withOpacity(.2)
                  //       :  Color(0XFF757784).withOpacity(.2),
                  // )
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.add,
                        color: Color(0xFF757784),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add Card',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          color: Color(0XFF757784)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: TextWidgetInterMedium(
                  title: 'Cards',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white
    ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Container(
                height: 50,
                width: 332,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          spreadRadius: 0,
                          blurRadius: 2)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color:  Provider.of<ThemeChanger>(context)
                        .themeData == darkMode
                        ?  Color(0XFF272730)
                        :  Color(0XFFF1F1FF)
                ),
                    // color: const Color(0XFF272730)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Payment_icon.png',
                        height: 24,
                        width: 34,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextWidgetInterMedium(
                        title: '**** **** **** 1234',
                        fontSize: 16,
                        // color: Colors.white,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: TextWidgetInterMedium(
                  title: 'Billing',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Container(
                height: 50,
                width: 332,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          spreadRadius: 0,
                          blurRadius: 2)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color:  Provider.of<ThemeChanger>(context)
                        .themeData == darkMode
                        ?  Color(0XFF272730)
                        :  Color(0XFFF1F1FF)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Yearly Subscription',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                            color:  Provider.of<ThemeChanger>(context)
                                .themeData == darkMode
                                ?  Colors.white
                                :  Color(0XFF424252)
                        ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child:  Text('39.95 CHF',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ?  Color(0XFFD2D2D2).withOpacity(.9)
                              :  Color(0XFF424252)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 37),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Total: 24.50CHF',

                  style: TextStyle(
                    color:  Provider.of<ThemeChanger>(context)
                        .themeData == darkMode
                        ?  Colors.white.withOpacity(.6)
                        :  Color(0XFF000000).withOpacity(.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)),),

            Spacer(),
            CustomSaveButton(
               titleText: 'Save',
            ),
            // Container(
            //   height: 114, width: double.infinity,
            //   decoration: BoxDecoration(
            //       // gradient: LinearGradient(colors: [Color(0XFF1C1C23), Color(0XFF3F3F4B)]),
            //       color: Color(0XFF272730),
            //       borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            //       boxShadow: [
            //         BoxShadow(
            //             offset: Offset(0, 4),
            //             blurRadius: 4,
            //             color: AppColors.black00.withOpacity(.25)
            //         )
            //       ]
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       GestureDetector(
            //         onTap:(){
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            //         },
            //         child: Container(
            //             height: 48, width: 288,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(40),
            //                 // color: Color(0XFFFFFFFF).withOpacity(.15),
            //                 color: Colors.white.withOpacity(.10),
            //                 border: Border.all(color: Color(0XFFFFFFFF).withOpacity(.1))
            //             ),
            //             child: Center(child: TextWidgetInterMedium(title: 'Save',
            //                 // color: Colors.white
            //             ))),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.imageIcon,
  });

  final String title;
  final String imageIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ListTile(
        dense: true,
        // contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(vertical: -4),
        title: TextWidgetInterRegular(
            title: title,
            fontSize: 12,
            // color: const Color(0XFFF0F4F7),
            fontWeight: FontWeight.w400),
        leading: Image.asset(
          imageIcon,
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
