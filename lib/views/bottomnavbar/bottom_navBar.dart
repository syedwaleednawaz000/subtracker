import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/settings/settings.dart';
import 'package:sub_tracker/views/spending_budgets/spending_budgets.dart';
import 'package:sub_tracker/views/addNewSubscription/add_new_subscription.dart';
import '../../theme/theme.dart';
import '../calendar_screen/calendar_screen.dart';
import '../home_screen/home_screen.dart';
import '../../Provider/bottom_bar_provider.dart';

class BnavBar extends StatefulWidget {
  const BnavBar({super.key});

  @override
  State<BnavBar> createState() => _BnavBarState();
}

class _BnavBarState extends State<BnavBar> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const SpendingBudgets(),
    const CalendarScreen(),
    const Settings(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() =>
        Provider.of<BottomBarProvider>(context, listen: false).selection(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool isDarkMode = Provider.of<ThemeChanger>(context).themeData == darkMode;
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Colors.black
          : const Color(0XFFF1F1FF),
      bottomNavigationBar: Container(
        width: size.width,
        height: 80,
        decoration: BoxDecoration(
          color: Provider.of<ThemeChanger>(context).themeData == darkMode
              ? Colors.black
              : const Color(0XFFF1F1FF),),
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
        child: Stack(
          children: [
            PhysicalModel(
              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? Colors.black
                  : const Color(0xfff7f7ff).withOpacity(.6),
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(18),
              child: CustomPaint(
                size: Size(size.width, 55),
                painter: BNBCustomPainter(isDarkMode),
              ),
            ),
            Center(
              heightFactor: 0.59,
              child: ClipOval(
                child: FloatingActionButton(
                  backgroundColor: const Color(0XFF758AFF),
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Subscription()));
                  },
                  child: const Icon(Icons.add,color: Colors.white,),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<BottomBarProvider>(
                    builder: (context, value, child) {
                      return IconButton(
                        icon: Image.asset(
                          AppImages.homeIcon,
                          width: 18,
                          height: 18,
                          color: value.isSelected(0)
                              ? Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff758AFF)
                              : Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                  ? const Color(0xffA2A2B5)
                                  : const Color(0xffA2A2B5),
                        ),
                        onPressed: () => value.selection(0),
                      );
                    },
                  ),
                  Consumer<BottomBarProvider>(builder: (context, value, child) {
                    return IconButton(
                      icon: Image.asset(
                        AppImages.dashboardIcon,
                        width: MySize.size18,
                        height: MySize.size18,
                        // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                        color: value.isSelected(1)
                            ? Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff758AFF)
                            : Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                ? const Color(0xffA2A2B5)
                                : const Color(0xffA2A2B5),
                      ),
                      onPressed: () => value.selection(1),
                      // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                    );
                  }),
                  Container(
                    width: size.width * 0.20,
                  ),
                  Consumer<BottomBarProvider>(builder: (context, value, index) {
                    return IconButton(
                      icon: Image.asset(
                        AppImages.calendarIcon,
                        width: MySize.size18,
                        height: MySize.size18,
                        // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                        color: value.isSelected(2)
                            ? Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff758AFF)
                            : Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                ? const Color(0xffA2A2B5)
                                : const Color(0xffA2A2B5),
                      ),
                      onPressed: () => value.selection(2),
                      // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                    );
                  }),
                  Consumer<BottomBarProvider>(
                    builder: (context, value, child) {
                      return Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                         return                         IconButton(
                           icon: Image.asset(
                             AppImages.settingIcon,
                             width: MySize.size18,
                             height: MySize.size18,
                             // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                             color: value.isSelected(3)
                                 ? Provider.of<ThemeChanger>(context).themeData ==
                                 darkMode
                                 ? const Color(0xffFFFFFF)
                                 : const Color(0xff758AFF)
                                 : Provider.of<ThemeChanger>(context).themeData ==
                                 darkMode
                                 ? const Color(0xffA2A2B5)
                                 : const Color(0xffA2A2B5),
                           ),
                           onPressed: () {
                             if(profileProvider.userData.isNotEmpty){
                               value.selection(3);
                             }else{
                               profileProvider.getProfile(context: context, userID: "");
                               FlutterToast.toastMessage(message: "Please wait, user data is loading.",isError: true);
                             }
                           },
                           // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                         );
                      },);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Consumer<BottomBarProvider>(builder: (context, value, child) {
        return _screens[value.selectedIndex];
      }),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  final bool isDarkMode;

  BNBCustomPainter(this.isDarkMode);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = isDarkMode ? Color(0xff4E4E61) : Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Starting point at the bottom left
    path.moveTo(0, 20);

    // Draw the left side curve
    path.quadraticBezierTo(size.width * 0.0, -40, size.width * 0.35, 0);

    // Draw the left side notch
    path.quadraticBezierTo(size.width * 0.40, 2, size.width * 0.40, 20);

    // Create the arc for the notch
    path.arcToPoint(
      Offset(size.width * 0.60, 14),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    // Draw the right side of the notch
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);

    // Draw the top-right curve
    path.quadraticBezierTo(size.width * 0.99, -3, size.width, 0);

    // Draw the bottom-right side
    path.lineTo(size.width, size.height);

    // Draw the bottom-left side
    path.lineTo(0, size.height);

    // Close the path to the starting point
    path.lineTo(0, 20);

    // Draw shadow and path with indigo color shadow
    canvas.drawShadow(path, Colors.indigo, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
