import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../language_selection/base/custom_appBar.dart';
import '../settings/settings.dart';


class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool tap = true;
  bool tap1 = true;
  bool tap2 = true;
  int selectedIndex = -1;

  List<String> titleContainer = ['Credit Card', 'Debit Card', 'Pay Pal'];
  List<String> containerImages= [
    AppImages.credit_cardIcon,
    AppImages.debit_cardIcon,
    AppImages.paypalIcon
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF1C1C23) : const Color(0XFFF7F7FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only( top: MySize.size25),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomAppBar(
              text: 'Manage Payment',
              icon: Icons.arrow_back_rounded,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 10, bottom: 10, top: 18),
            child:  Text('Payment Method',
              style: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? const Color(0XFFFFFFFF)
                      : const Color(0XFF424252),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins_Regular'
              ),
            ),
          ),
          const SizedBox(height: 10,),
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Container(
                              height: 124,
                              width: 117,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ?  Provider.of<ThemeChanger>(context)
                                    .themeData == darkMode
                                    ?  const Color(0XFF758AFF)
                                    :  const Color(0XFF758AFF)
                                    : Provider.of<ThemeChanger>(context)
                                    .themeData == darkMode
                                    ?  const Color(0XFF272730)
                                    :  const Color(0XFFF1F1FF),
                                boxShadow: [
                                  isSelected
                                  ? BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF4F63BE).withOpacity(.6)
                                    : const Color(0XFF4F63BE).withOpacity(.6),
                                )
                                  :     const BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                  )
                                ],
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                          const SizedBox(height: 15),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 19,
                                width: 19,
                                decoration: BoxDecoration(
                                  color: isSelected? Colors.white : Colors.transparent,
                                  border: const Border.fromBorderSide(BorderSide(color: Color(0XFFD0D5DD), width: 1)),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0XFF1C1C23) : Colors.transparent,
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
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetInterMedium(
                      title: 'Name on card',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                        // color: Colors.white
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      height: MySize.size44, width: MySize.size180,
                      decoration: BoxDecoration(
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ? const Color(0XFF272730)
                              :  const Color(0XFFF1F1FF),
                        border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Olivia Rhye', style: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode ? Colors.white : const Color(0XFF424252),
                              fontSize: 14, fontWeight: FontWeight.w400,
                            ),
                            ),),
                      )),
                    ),
                  ],
                ),
                const SizedBox(width: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetInterMedium(title: 'Expiry', fontSize: 14, fontWeight: FontWeight.w500,
                        // color: Colors.white
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      height: 44, width: 120,
                      decoration: BoxDecoration(
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ? const Color(0XFF272730)
                              :  const Color(0XFFF1F1FF),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child:  Text(
                          textAlign: TextAlign.start,
                          '06   2024', style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode ? Colors.white : const Color(0XFF424252),
                          fontSize: 14, fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetInterMedium(
                      title: 'Card number',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                        // color: Colors.white
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      height: MySize.size44, width: MySize.size180,
                      decoration: BoxDecoration(
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ? const Color(0XFF272730)
                              :  const Color(0XFFF1F1FF),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(AppImages.payment2,height: MySize.size50,width: MySize.size30,),
                            Center(
                                child: Text(
                                  '  1234 1234 1234 1234', style: TextStyle(
                                  color:Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : const Color(0XFF424252),
                                  fontSize: 11, fontWeight: FontWeight.w400,
                                // color: Colors.white
                            ))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetInterMedium(title: 'CVV', fontSize: 14, fontWeight: FontWeight.w500,
                        // color: Colors.white
                    ),
                    const SizedBox(height: 16,),
                   Container(
                      height: 44, width: 120,
                      decoration: BoxDecoration(
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ? const Color(0XFF272730)
                              :  const Color(0XFFF1F1FF),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(AppImages.three_dotsIcon, scale: 3.4,
                                color: Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode ? Colors.white : const Color(0XFF424252),)),
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding:  EdgeInsets.only( right: MySize.size24, top: MySize.size30,left: MySize.size24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
             GestureDetector(
               onTap:(){
               Navigator.push(context, MaterialPageRoute(builder:  (context) => const PaymentScreen()));
             },
               child: Container(
                 height: MySize.size44, width:  MySize.scaleFactorWidth*154,
                 decoration: BoxDecoration(
                     color: const Color(0XFF3D3D47),
                     border: Border.all(color: const Color(0XFF3D3D47)),
                     borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                     BoxShadow(
                       color: const Color(0XFF101828).withOpacity(.5),
                       blurRadius: 2,
                       offset: const Offset(0, 1)
                     )
                   ]
                 ),
                 child: Center(
                 child:   Text('Cancel',
                     style: TextStyle(
                       fontSize: 14, fontWeight: FontWeight.w400,
                       fontFamily: 'Poppins_Regular',
                       color:  Provider.of<ThemeChanger>(context)
                           .themeData == darkMode
                           ? Colors.white
                           :  Colors.white,
                     ),
                   ),

                 ),
               ),
             ),
             const SizedBox(width: 7,),
             GestureDetector(
               onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder:  (context) => const PaymentScreen()));
               },
               child: Container(
                 height:  MySize.size44, width:  MySize.scaleFactorWidth*154,
                 decoration: BoxDecoration(
                     color: const Color(0XFF758AFF),
                   borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.transparent),
                     boxShadow: [
                       BoxShadow(
                           color: const Color(0XFF101828).withOpacity(.5),
                           blurRadius: 2,
                           offset: const Offset(0, 1)
                       )
                     ]
                 ),
                 child: Center(
                     child: Text('Confirm',
                  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins_Regular',
                    color:  Provider.of<ThemeChanger>(context)
                        .themeData == darkMode
                        ? Colors.white
                        :  Colors.white,
                  ),
                 ),
                 ),
               ),
             )
                     ],
                   ),
          ),
        ],
      ),
    );
  }
}
