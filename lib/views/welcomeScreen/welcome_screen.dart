import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/utils/my_size.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
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
        image: DecorationImage(
            image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: MySize.scaleFactorHeight * 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage("assets/images/bg_get_started.png")
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: AppColors.black00.withOpacity(.25))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size44,
                        right: MySize.size48,
                        bottom: MySize.scaleFactorHeight * 11),
                    child: Text(
                      AppLocalizations.of(context)!.manage_all_your_subscriptions_in_one_place_effortlessly,
                      style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Colors.white
                              : Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )),
                SizedBox(height: MySize.size10,),
                Padding(
                  padding: EdgeInsets.only(left: MySize.size40),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterWithM()));
                    },
                    child: Row(
                      children: [
                        Container(
                          height: MySize.size52,
                          padding:
                              EdgeInsets.symmetric(horizontal: MySize.size30),
                          decoration: BoxDecoration(
                              color: const Color(0XFF424252),
                              // color: Colors.blue,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(-4, 8),
                                    blurRadius: 25,
                                    color: Colors.white.withOpacity(.2))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.get_started,
                                style: TextStyle(
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? Colors.white
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: MySize.size2,
                              ),
                              Image.asset(
                                'assets/icons/right_arrow.png',
                                scale: 3.5,
                              ),
                            ],
                          ),
                        ),

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
