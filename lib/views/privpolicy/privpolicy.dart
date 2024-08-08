import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/privacy_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';

class PrivPolicy extends StatefulWidget {
  const PrivPolicy({super.key});

  @override
  State<PrivPolicy> createState() => _PrivPolicyState();
}

class _PrivPolicyState extends State<PrivPolicy> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() =>
        Provider.of<PrivacyAndPolicyProvider>(context, listen: false)
            .privacyAndPolicy());
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
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            AppImages.backArrow,
                            height: 24,
                            width: 24,
                          )),
                      SizedBox(
                        width: MySize.scaleFactorWidth * 90,
                      ),
                      Text(
                        'Privacy Policy',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFF1C1C23),
                            fontFamily: 'Poppins_Regular'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Privacy Policy',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Colors.white
                              : const Color(0XFF1c1c23),
                          fontFamily: 'Poppins_Regular'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size16,
                ),
                Consumer<PrivacyAndPolicyProvider>(
                  builder: (context, privacyAndPolicyProvider, child) {
                    return privacyAndPolicyProvider.isPrivacyAndPolicy ? const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,),): Padding(
                      padding: EdgeInsets.only(left: MySize.size32),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            privacyAndPolicyProvider
                                    .privacyAndPolicyData['value'] ??
                                "",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? Colors.white
                                    : const Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'),
                          )),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
