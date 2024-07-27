import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/views/settings/settings.dart';
import 'package:sub_tracker/views/spending_budgets/spending_budgets.dart';
import 'package:sub_tracker/views/subscription/subscription.dart';
import '../theme/theme.dart';
import '../views/calendar_screen/calendar_screen.dart';
import '../views/home_screen/home_screen.dart';
import 'bottomNotifier.dart';

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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print('build tapped');
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : const Color(0XFFF7F7FF),
      bottomNavigationBar: Container(
        width: size.width,
        height: 80,
        decoration:  BoxDecoration(
            boxShadow: [
          BoxShadow(
              color: Colors.indigoAccent.withOpacity(0.2),
              offset: Offset(0, -4),spreadRadius: 1,blurRadius: 19)
        ]),
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
        child: Stack(
          // overflow: Overflow.visible,
          children: [
            PhysicalModel(
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(18),
              child: CustomPaint(
                size: Size(size.width, 55),
                painter: BNBCustomPainter(),
              ),
            ),
            Center(
              heightFactor: 0.59,
              child: ClipOval(
                child: FloatingActionButton(
                  backgroundColor: const Color(0XFF758AFF),
                  child: const Icon(Icons.add),
                  elevation: 1,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Subscription()));
                  },
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<BottomNotifier>(
                    builder: (context, value, child) {
                      print('consumer tapped');
                      return IconButton(
                        icon: Image.asset(AppImages.homeIcon,
                            width: 18,
                            height: 18,
                            color: value.isSelected(0)
                                ? const Color(0XFF758AFF)
                                : const Color(0XFFC1C1CD)),
                        onPressed: () => value.selection(0),
                        // color: value.selectedIndex == 1 ? Colors.blue : Colors.grey,
                      );
                    },
                  ),
                  Consumer<BottomNotifier>(builder: (context, value, child) {
                    return IconButton(
                      icon: Image.asset(AppImages.dashboardIcon,
                          width: 18,
                          height: 18,
                          // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                          color: value.isSelected(1)
                              ? const Color(0XFF758AFF)
                              : const Color(0XFFC1C1CD)),
                      onPressed: () => value.selection(1),
                      // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                    );
                  }),
                  Container(
                    width: size.width * 0.20,
                  ),
                  Consumer<BottomNotifier>(builder: (context, value, index) {
                    return IconButton(
                      icon: Image.asset(AppImages.calendarIcon,
                          width: 18,
                          height: 18,
                          // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                          color: value.isSelected(2)
                              ? const Color(0XFF758AFF)
                              : const Color(0XFFC1C1CD)),
                      onPressed: () => value.selection(2),
                      // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                    );
                  }),
                  Consumer<BottomNotifier>(
                    builder: (context, value, child) {
                      return IconButton(
                        icon: Icon(Icons.settings,
                            size: 22,
                            color: value.isSelected(3)
                                ? const Color(0XFF758AFF)
                                : const Color(0XFFC1C1CD)),
                        // icon: Image.asset(AppImages.setting, width: 18, height: 18, color: AppColors.white100,),
                        onPressed: () => value.selection(3),
                        // color: value.selectedIndex == 3 ? Colors.blue : Colors.grey,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Consumer<BottomNotifier>(builder: (context, value, child) {
        return _screens[value.selectedIndex];
      }),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
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

// class BnavBar extends StatefulWidget {
//   const BnavBar({super.key});
//
//   @override
//   State<BnavBar> createState() => _BnavBarState();
// }
//
// class _BnavBarState extends State<BnavBar> {
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const SpendingBudgets(),
//     const CalendarScreen(),
//     const Settings(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     Future.microtask(() => Provider.of<LanguageProvider>(context,listen: false).getLanguages());
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: CircleAvatar(
//           radius: 26,
//           backgroundColor: Colors.white,
//           child: FloatingActionButton(
//             backgroundColor: Colors.blue,
//               shape: const CircleBorder(),
//               onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Subscription()));
//               },
//             child: const Icon(Icons.add, ),
//           ),
//         ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               backgroundColor: Color(0XFF4E4E61),
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               items: [
//                 BottomNavigationBarItem(
//                     icon:   Consumer<BottomNotifier>(builder: (context, value, child) {
//                       print('consumer tapped');
//                       return  IconButton(
//                         icon: Image.asset(AppImages.homeIcon, width: 18, height: 18, color: value.isSelected(0) ? Color(0XFF758AFF) : Color(0XFFC1C1CD)),
//                         onPressed: () => value.selection(0),
//                         // color: value.selectedIndex == 1 ? Colors.blue : Colors.grey,
//
//                       );
//                     },), label: ''),
//                 BottomNavigationBarItem(
//                     icon:  Consumer<BottomNotifier>(builder: (context, value, child) {
//                       return  IconButton(
//                         icon: Image.asset(AppImages.dashboardIcon, width: 18, height: 18,
//                             // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
//                             color: value.isSelected(1) ?Color(0XFF758AFF) : Color(0XFFC1C1CD)
//                         ),
//                         onPressed: () => value.selection(1),
//                         // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
//                       );
//                     }),label: ''),
//                 BottomNavigationBarItem(
//                     icon:   Consumer<BottomNotifier>(builder: (context, value, index) {
//                       return  IconButton(
//                         icon: Image.asset(AppImages.calendarIcon, width: 18, height: 18,
//                             // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
//                             color: value.isSelected(2) ? Color(0XFF758AFF) : Color(0XFFC1C1CD)
//                         ),
//                         onPressed: () => value.selection(2),
//                         // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
//                       );
//                     }), label: ''),
//                 BottomNavigationBarItem(
//               icon:   Consumer<BottomNotifier>(builder: (context, value, child) {
//                    return  IconButton(
//                      icon: Icon(Icons.settings, size: 22,   color: value.isSelected(3) ? Color(0XFF758AFF) : Color(0XFFC1C1CD)),
//                      // icon: Image.asset(AppImages.setting, width: 18, height: 18, color: AppColors.white100,),
//                      onPressed: () => value.selection(3),
//                      // color: value.selectedIndex == 3 ? Colors.blue : Colors.grey,
//
//                    );
//                  },), label: ''),
//           ]),
//         ),
//       ),
//         body: Consumer<BottomNotifier>(builder: (context, value, child){
//     return _screens[value.selectedIndex];
//     }));
//   }
// }
