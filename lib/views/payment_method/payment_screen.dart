import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import '../add_card/Add_card.dart';
import '../base/text_widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {


  List<String> containerImages= [
    AppImages.credit_cardIcon,
    AppImages.debit_cardIcon,
    AppImages.paypalIcon
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> titleContainer = [
    AppLocalizations.of(context)!.credit_card,
    AppLocalizations.of(context)!.debit_card,
    AppLocalizations.of(context)!.pay_pal
    ];
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
      Colors.black
          : const Color(0XFFFFFFFF),
      appBar:   CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.manage_payment),
      body: Container(
        // color: ,
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
              child: Text( AppLocalizations.of(context)!.payment_method,
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
                                              ?  const Color(0XFF758AFF)
                                              :  const Color(0XFF758AFF)
                                      : Provider.of<ThemeChanger>(context)
                                           .themeData == darkMode
                                              ?  const Color(0XFF272730)
                                              :  const Color(0XFFF1F1FF),
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
                                            : Color(0xff757784),
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

            Padding(
              padding: const EdgeInsets.only(left: 37,right: 37),
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
                          ? const Color(0XFF272730)
                          :  const Color(0XFFF1F1FF),

                  ),
                  child:  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.add,
                        color: const Color(0xFF757784),
                        size: MySize.size18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                        AppLocalizations.of(context)!.add_card,
                        style: const TextStyle(
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
                  title:  AppLocalizations.of(context)!.cards,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                color:Provider.of<ThemeChanger>(context).themeData ==
                    darkMode
                    ? const Color(0XFFFFFFFF)
                    : Colors.black,
    ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding:  EdgeInsets.only(left: MySize.size36,right: MySize.size36),
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
                        ?  const Color(0XFF272730)
                        :  const Color(0XFFF1F1FF)
                ),
                    // color: const Color(0XFF272730)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.payment2,
                        height: 24,
                        width: 34,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextWidgetInterMedium(
                        title: '**** **** **** 1234',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? const Color(0XFFFFFFFF)
                            : Colors.black,
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
              padding: const EdgeInsets.only(left: 47),
              child: TextWidgetInterMedium(
                  title:  AppLocalizations.of(context)!.billing,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                color:Provider.of<ThemeChanger>(context).themeData ==
                    darkMode
                    ? const Color(0XFFFFFFFF)
                    : Colors.black,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding:  EdgeInsets.only(left: MySize.size34,right: MySize.size34),
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
                        ?  const Color(0XFF272730)
                        :  const Color(0XFFF1F1FF)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text( AppLocalizations.of(context)!.yearly_subscription,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                            color:  Provider.of<ThemeChanger>(context)
                                .themeData == darkMode
                                ?  Colors.white
                                :  const Color(0XFF424252)
                        ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(right: MySize.size16),
                        child:  Consumer<CurrencyProvider>(builder: (context, currencyProvider, child) {
                          return Text(AppConstant.validatePrice(context: context,price: double.parse("39.0"),currencyCode: currencyProvider.selectedCurrencySymbol),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:  Provider.of<ThemeChanger>(context)
                                    .themeData == darkMode
                                    ?  const Color(0XFFD2D2D2).withOpacity(.9)
                                    :  const Color(0XFF424252)
                            ),
                          );
                        },),
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
              padding:  EdgeInsets.only(right: MySize.size36),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Consumer<CurrencyProvider>(builder: (context, currencyProvider, child) {
                    return Text("Total: ${AppConstant.validatePrice(context: context,price: double.parse("39.0"),currencyCode: currencyProvider.selectedCurrencySymbol)}",
                      style: TextStyle(
                        color:  Provider.of<ThemeChanger>(context)
                            .themeData == darkMode
                            ?  Colors.white.withOpacity(.6)
                            :  const Color(0XFF000000).withOpacity(.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),);
                  },)),),

            const Spacer(),
            CustomSaveButton(
               titleText:  AppLocalizations.of(context)!.save,
            ),
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
