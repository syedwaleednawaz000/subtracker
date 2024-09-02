import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';

import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
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


  List<String> containerImages= [
    AppImages.credit_cardIcon,
    AppImages.debit_cardIcon,
    AppImages.paypalIcon
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titleContainer = [
    AppLocalizations.of(context)!.credit_card,
    AppLocalizations.of(context)!.debit_card,
    AppLocalizations.of(context)!.pay_pal
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
         Colors.black
        : const Color(0XFFF1F1FF),
      appBar:   CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.manage_payment),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 10, bottom: 10, top: 40),
            child:  Text( AppLocalizations.of(context)!.payment_method,
              style: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? const Color(0XFFFFFFFF)
                      : const Color(0XFF424252),
                  fontSize: 20,
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
                                  offset: const Offset(0, 13,),
                                  blurRadius: 4,
                                  spreadRadius: -5,
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF4F63BE).withOpacity(.6)
                                    : const Color(0XFF4F63BE).withOpacity(.6),
                                )
                                  :     const BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    spreadRadius: -10,
                                  ),
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
                                      fontWeight: FontWeight.w400,
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
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  color: isSelected? Colors.white : Colors.transparent,
                                  border: const Border.fromBorderSide(BorderSide(color: Color(0XFFD0D5DD), width: .5)),
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
                      title:  AppLocalizations.of(context)!.name_on_card,
                      fontSize: MySize.size15,
                      fontWeight: FontWeight.w500,
                      color:Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF)
                          : Colors.black,
                    ),
                    const SizedBox(height: 5,),
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
                          child:  TextFormField(
                            cursorColor: Colors.blueGrey,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: MySize.size20),
                              hintText:  AppLocalizations.of(context)!.olivia_rhye,
                              hintStyle: TextStyle(
                                fontSize: MySize.size14,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : const Color(0XFF424252),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
                const SizedBox(width: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetInterMedium(
                      title:  AppLocalizations.of(context)!.expiry,
                      fontSize: MySize.size15,
                      fontWeight: FontWeight.w500,
                      color:Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF)
                          : Colors.black,
                    ),
                    const SizedBox(height: 5,),
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
                        child: TextFormField(
                          cursorColor: Colors.blueGrey,
                          decoration: InputDecoration(
                            hintText: '  06 2024',
                            hintStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : const Color(0XFF424252),
                            ),
                            border: InputBorder.none,
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
                      title: AppLocalizations.of(context)!.card_number,
                      fontSize: MySize.size15,
                      fontWeight: FontWeight.w500,
                      color:Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF)
                          : Colors.black,
                    ),
                     SizedBox(height: MySize.size5,),
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
                        padding:  EdgeInsets.only(left: MySize.size2),
                        child:TextFormField(
                          cursorColor: Colors.blueGrey,
                          decoration: InputDecoration(
                            contentPadding:  EdgeInsets.symmetric(vertical: MySize.size3,),
                            prefixIcon: Image.asset(AppImages.payment2,scale: 5,width: MySize.size20,),
                            hintText: '1234 1234 1234 1234',
                            hintStyle: TextStyle(
                              fontSize: 10,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : const Color(0XFF424252),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetInterMedium(title:  AppLocalizations.of(context)!.cvv, fontSize: MySize.size15, fontWeight: FontWeight.w500,
                      color:Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF)
                          : Colors.black,
                    ),
                    const SizedBox(height: 5,),
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
                        child: TextFormField(
                          cursorColor: Colors.blueGrey,
                          decoration: InputDecoration(
                            hintText: '...',
                            hintStyle: TextStyle(
                              fontSize: 30,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : const Color(0XFF424252),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
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
                 height: MySize.size48, width:  MySize.scaleFactorWidth*154,
                 decoration: BoxDecoration(
                     color: const Color(0XFF3D3D47),
                     border: Border.all(color: const Color(0XFF3D3D47)),
                     borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                     BoxShadow(
                       color: const Color(0XFF101828).withOpacity(.5),
                       blurRadius: 2,
                       spreadRadius: 0,
                       offset: const Offset(0, 1)
                     )
                   ]
                 ),
                 child:  Center(
                 child:   Text( AppLocalizations.of(context)!.cancel,
                     style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       fontFamily: 'Poppins_Regular',
                       color:  Colors.white,
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
                 height:  MySize.size48,
                 width:  MySize.scaleFactorWidth*154,
                 decoration: BoxDecoration(
                     color: const Color(0XFF758AFF),
                   borderRadius: BorderRadius.circular(8),
                     border: Border.all(color: Colors.transparent),
                     boxShadow: [
                       BoxShadow(
                           color: const Color(0XFF101828).withOpacity(.5),
                           blurRadius: 2,
                           spreadRadius: 0,
                           offset: const Offset(0, 1)

                       )
                     ]
                 ),
                 child:  Center(
                     child: Text( AppLocalizations.of(context)!.confirm,
                  style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins_Regular',
                    color:  Colors.white,
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
