import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/views/credit_card/credit_card.dart';
import 'package:sub_tracker/views/settings/settings.dart';
import 'package:sub_tracker/views/spending_budgets/spending_budgets.dart';
import 'package:sub_tracker/views/subscription/subscription.dart';
import '../theme/theme.dart';
import '../views/calendar_screen/calendar_screen.dart';
import '../views/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import 'bottomNotifier.dart';

//
// class BNavBar extends StatefulWidget {
//   const BNavBar({super.key});
//
//   @override
//   State<BNavBar> createState() => _BNavBarState();
// }
//
// class _BNavBarState extends State<BNavBar> {
//
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const SpendingBudgets(),
//     const CalendarScreen(),
//     const Settings(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     print('build tapped');
//     return Scaffold(
//
//       backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
//           ? Color(0XFF1C1C23)
//           : Color(0XFFF7F7FF),
//
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(45),
//           side: const BorderSide(color: Color(0XFF758AFF)),
//         ),
//         backgroundColor: Color(0XFF758AFF).withOpacity(.8),
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const Subscription()));
//         },
//         child: const Icon(Icons.add, color: Colors.white,),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25),
//         child: BottomAppBar(
//           clipBehavior: Clip.antiAlias,
//           // padding: EdgeInsets.symmetric(horizontal: 20),
//           height: 60,
//           notchMargin: 10,
//           padding: EdgeInsets.symmetric(horizontal: 23),
//           color: Color(0xFF4E4E61).withOpacity(.75),
//           shape: CircularNotchedRectangle(),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               SizedBox(width: 20,),
//              Consumer<BottomNotifier>(builder: (context, value, child) {
//                print('consumer tapped');
//                return  IconButton(
//                  icon: Image.asset(AppImages.homeIcon, width: 18, height: 18, color: value.isSelected(0) ? Color(0XFF758AFF) : Color(0XFFC1C1CD)),
//                  onPressed: () => value.selection(0),
//                  // color: value.selectedIndex == 1 ? Colors.blue : Colors.grey,
//
//                );
//              },),
//               SizedBox(width: 20,),
//              Consumer<BottomNotifier>(builder: (context, value, child) {
//               return  IconButton(
//                 icon: Image.asset(AppImages.dashboardIcon, width: 18, height: 18,
//                   // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
//                   color: value.isSelected(1) ?Color(0XFF758AFF) : Color(0XFFC1C1CD)
//                 ),
//                 onPressed: () => value.selection(1),
//                 // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
//               );
//             }),
//              SizedBox(width: 90,),
//              Consumer<BottomNotifier>(builder: (context, value, index) {
//                return  IconButton(
//                  icon: Image.asset(AppImages.calendarIcon, width: 18, height: 18,
//                    // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
//                    color: value.isSelected(2) ? Color(0XFF758AFF) : Color(0XFFC1C1CD)
//                  ),
//                  onPressed: () => value.selection(2),
//                  // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
//                );
//              }),
//               SizedBox(width: 20,),
//              Consumer<BottomNotifier>(builder: (context, value, child) {
//                return  IconButton(
//                  icon: Icon(Icons.settings, size: 22,   color: value.isSelected(3) ? Color(0XFF758AFF) : Color(0XFFC1C1CD)),
//                  // icon: Image.asset(AppImages.setting, width: 18, height: 18, color: AppColors.white100,),
//                  onPressed: () => value.selection(3),
//                  // color: value.selectedIndex == 3 ? Colors.blue : Colors.grey,
//
//                );
//              },),
//
//             ],
//           ),
//         ),
//       ),
//
//       body: Consumer<BottomNotifier>(builder: (context, value, child){
//         return _screens[value.selectedIndex];
//       }),
//     );
//   }
// }

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
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.white,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            shape: CircleBorder(),
            onPressed: () {},
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0XFF4E4E61),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Consumer<BottomNotifier>(
                      builder: (context, value, child) {
                        print('consumer tapped');
                        return IconButton(
                          icon: Image.asset(AppImages.homeIcon,
                              width: 18,
                              height: 18,
                              color: value.isSelected(0)
                                  ? Color(0XFF758AFF)
                                  : Color(0XFFC1C1CD)),
                          onPressed: () => value.selection(0),
                          // color: value.selectedIndex == 1 ? Colors.blue : Colors.grey,
                        );
                      },
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Consumer<BottomNotifier>(
                        builder: (context, value, child) {
                      return IconButton(
                        icon: Image.asset(AppImages.dashboardIcon,
                            width: 18,
                            height: 18,
                            // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                            color: value.isSelected(1)
                                ? Color(0XFF758AFF)
                                : Color(0XFFC1C1CD)),
                        onPressed: () => value.selection(1),
                        // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                      );
                    }),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Consumer<BottomNotifier>(
                        builder: (context, value, index) {
                      return IconButton(
                        icon: Image.asset(AppImages.calendarIcon,
                            width: 18,
                            height: 18,
                            // color: value.selectedColor ? Color(0XFF758AFF) :  Color(0XFFC1C1CD),
                            color: value.isSelected(2)
                                ? Color(0XFF758AFF)
                                : Color(0XFFC1C1CD)),
                        onPressed: () => value.selection(2),
                        // color: value.selectedIndex == 2 ? Colors.blue : Colors.grey,
                      );
                    }),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Consumer<BottomNotifier>(
                      builder: (context, value, child) {
                        return IconButton(
                          icon: Icon(Icons.settings,
                              size: 22,
                              color: value.isSelected(3)
                                  ? Color(0XFF758AFF)
                                  : Color(0XFFC1C1CD)),
                          // icon: Image.asset(AppImages.setting, width: 18, height: 18, color: AppColors.white100,),
                          onPressed: () => value.selection(3),
                          // color: value.selectedIndex == 3 ? Colors.blue : Colors.grey,
                        );
                      },
                    ),
                    label: ''),
              ]),
        ),
        body: Consumer<BottomNotifier>(builder: (context, value, child) {
          return _screens[value.selectedIndex];
        }));
  }
}
