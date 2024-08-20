import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/my_size.dart';
import '../theme/theme.dart';
import '../utils/app_Images.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: MySize.size18,top: MySize.size28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Transform.scale(
                    scale: 0.2,
                    child: Image.asset(AppImages.backArrow),
                  ),
                ),
                SizedBox(width: MySize.size28),
                Text(
                  'Notifications',
                  style: TextStyle(
                    color: const Color(0XFFA2A2B5),
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: MySize.size25),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MySize.size48),
              child: Text(
                'Notifications(4)',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MySize.size14,
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? Colors.white
                      : const Color(0XFF424252),
                  fontFamily: 'Poppins_Regular',
                ),
              ),
            ),
            SizedBox(height: MySize.size18),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MySize.size40),                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero, // Removes default padding
                          title: Text(
                            'Payment Alert',
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w500,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Colors.white
                                  : const Color(0XFF424252),
                              fontFamily: 'Poppins',
                            ),
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet consectetur. Turpis diam quis odio ipsum in.',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: MySize.size10,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Colors.white
                                  : const Color(0xFF424252),
                              fontFamily: 'Poppins_Regular',
                            ),
                          ),
                          leading: Container(
                            height: MySize.size48,
                            width: MySize.size48,
                            decoration: BoxDecoration(
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Colors.white.withOpacity(.1)
                                  : const Color(0xFFC1C1FF).withOpacity(.20),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/icons/notif.png',
                              height: MySize.size19,
                              width: MySize.size19,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Colors.white
                                  : const Color(0xFF424252),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: MySize.size12),
                          child: Divider(
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? const Color(0xFFD0D3FF).withOpacity(.2)
                                : const Color(0xFFD0D3FF).withOpacity(.2),
                            thickness: 1.3,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
