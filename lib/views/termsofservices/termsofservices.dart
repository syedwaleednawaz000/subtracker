import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/term_and_condition_provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';

class TermsOfServices extends StatefulWidget {
  const   TermsOfServices({super.key});

  @override
  State<TermsOfServices> createState() => _TermsOfServicesState();
}

class _TermsOfServicesState extends State<TermsOfServices> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() =>     Provider.of<TermAndConditionProvider>(context,listen: false).getTermAndCondition());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset(AppImages.backArrow, height: 24,width: 24,)),
                      SizedBox(
                        width: MySize.scaleFactorWidth * 90,
                      ),
                      Text('Terms of Service',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MySize.size16,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? const Color(0XFFA2A2B5)
                                : const Color(0XFFA2A2B5),
                            fontFamily: 'Poppins_Regular'
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Terms of Service',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? const Color(0XFFEEEEEE)
                              : const Color(0XFF1C1C23),
                          fontFamily: 'Poppins_Regular'
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MySize.size32,right: MySize.size14),
                  child: Consumer<TermAndConditionProvider>(builder: (context, termAndConditionProvider, child) {
                   return termAndConditionProvider.isTermAndCondition ?
                       const Center(child: CircularProgressIndicator(color: AppColors.purpleFF),):
                    termAndConditionProvider.termAndConditionData == null ?
                      const Center(child: Text("term and condition not available"),):
                    Text("${termAndConditionProvider.termAndConditionData['value'] ??""}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Colors.white
                            : const Color(0XFF333339),
                        fontFamily: 'Poppins_Regular'
                    ),
                    );
                    }
                    ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
