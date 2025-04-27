import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/views/settings/base/settingrowslist.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';

class ShowDialogBox extends StatelessWidget {
  const ShowDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return BackdropFilter(
              filter:
              ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: AlertDialog(
                  backgroundColor:  Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ?  const Color(0XFF4E4E61)
                      :  const Color(0XFFF1F1FF),
                  // surfaceTintColor: Colors.orange,
                  titlePadding: EdgeInsets.only(top: MySize.size30),
                  title: Column(
                    children: [
                      Text( AppLocalizations.of(context)!.delete_account,
                        style: TextStyle(
                          fontSize: MySize.size18,
                          fontWeight: FontWeight.w600,
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ?  Colors.white
                              :  const Color(0XFF424252),
                        ),
                      ),

                      SizedBox(height: MySize.size8,),
                      Text(  AppLocalizations.of(context)!.are_you_sure_you_want_to_delete_the_account,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ?  Colors.white
                              :  const Color(0XFF424252),
                        ),
                      ),

                      SizedBox(
                        height: MySize.size20,
                      ),
                      Divider(color: Colors.grey.withOpacity(0.30),height: 1),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text( AppLocalizations.of(context)!.decline,
                              style: TextStyle(
                                fontSize: MySize.size16,
                                fontWeight: FontWeight.w600,
                                color:  Provider.of<ThemeChanger>(context)
                                    .themeData == darkMode
                                    ?  const Color(0XFFC54646) // #2B83F2
                                    :  const Color(0XFFC54646),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MySize.size10,
                          ),
                          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                            return TextButton(
                              onPressed: () {
                                profileProvider.deleteAccount(context: context);
                                // Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: profileProvider.isDeleteAccount ? const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,),):
                                Text( AppLocalizations.of(context)!.accept,
                                  style: TextStyle(
                                    fontSize: MySize.size16,
                                    fontWeight: FontWeight.w600,
                                    color:  Provider.of<ThemeChanger>(context)
                                        .themeData == darkMode
                                        ?  const Color(0XFF2B83F2) // #
                                        :  const Color(0XFF2B83F2),
                                  ),
                                ),
                              ),
                            );
                          },)
                        ],
                      )
                    ],
                  )),
            );
          },
        );
      },
      child: SettingRowList(
        text:  AppLocalizations.of(context)!.delete_account,
        color: const Color(0XFFB50000),
        imageIcon: Image.asset(AppImages.delete,height: 20, color: const Color(0XFFB50000),),
      ),
    );
  }
}