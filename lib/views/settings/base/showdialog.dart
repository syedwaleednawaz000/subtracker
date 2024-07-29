import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/views/settings/base/settingrowslist.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

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
                                    ?  Color(0XFF4E4E61)
                                    :  Color(0XFFF1F1FF),
                  // surfaceTintColor: Colors.orange,
                  titlePadding: EdgeInsets.only(top: MySize.size30),
                  title: Column(
                    children: [
                      Text('Delete Account',
                        style: TextStyle(
                          fontSize: MySize.size18,
                          fontWeight: FontWeight.w600,
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ?  Colors.white
                              :  Color(0XFF424252),
                        ),
                      ),

                      SizedBox(height: MySize.size8,),
                      Text( 'Are you sure you want to delete the\naccount?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color:  Provider.of<ThemeChanger>(context)
                              .themeData == darkMode
                              ?  Colors.white
                              :  Color(0XFF424252),
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
                                fontSize: MySize.size14,
                                fontWeight: FontWeight.w400,
                                color:  Provider.of<ThemeChanger>(context)
                                    .themeData == darkMode
                                    ?  Color(0XFFC54646) // #2B83F2
                                    :  Color(0XFFC54646),
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
                                child: profileProvider.isDeleteAccount ? Center(child: CircularProgressIndicator(color: Colors.green,),):  Text('Accept',
                                  style: TextStyle(
                                    fontSize: MySize.size14,
                                    fontWeight: FontWeight.w400,
                                    color:  Provider.of<ThemeChanger>(context)
                                        .themeData == darkMode
                                        ?  Color(0XFF2B83F2) // #
                                        :  Color(0XFF2B83F2),
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
        text: 'Delete Account',
        color: Color(0XFFB50000),
        imageIcon: Image.asset(AppImages.delete, color: Color(0XFFB50000),),
      ),
    );
  }
}
