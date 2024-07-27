// import 'package:flutter/material.dart';
// import '../../utils/app_colors.dart';
// import '../manageplan/manageplan.dart';
//
//
//
// class BNavBar extends StatefulWidget {
//   const BNavBar({super.key});
//
//   @override
//   State<BNavBar> createState() => _BNavBarState();
// }
//
// class _BNavBarState extends State<BNavBar> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _screens = [
//     const ManagePlan(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(left: 25),
//         child: FloatingActionButton(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(45),
//             side: const BorderSide(color:Colors.orangeAccent),
//           ),
//           backgroundColor: Colors.deepPurpleAccent,
//           onPressed: () {},
//           child: const Icon(Icons.add),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//           child: BottomAppBar(
//             height: 60,
//             color: Colors.white.withOpacity(.6),
//             shape: const CircularNotchedRectangle(),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 IconButton(
//                   icon: const Icon(Icons.home, color: Colors.white),
//                   onPressed: () => _onItemTapped(0),
//                   color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.search, color: Colors.white),
//                   onPressed: () => _onItemTapped(1),
//                   color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
//                 ),
//                 const SizedBox(width: 40.0), // This is for the notch
//                 IconButton(
//                   icon: const Icon(Icons.notifications, color: Colors.white),
//                   onPressed: () => _onItemTapped(2),
//                   color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.person, color: Colors.white),
//                   onPressed: () => _onItemTapped(3),
//                   color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: _screens[_selectedIndex],
//     );
//   }
// }








///
//  animated_bottom_navigation_bar: ^1.3.3
//
//
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';

import '../calendar_screen/calendar_screen.dart';
import '../home_screen/home_screen.dart';
import '../settings/settings.dart';
import '../spending_budgets/spending_budgets.dart';


class CustomCurvedNavigationBar extends StatefulWidget {
  int currentIndex = 0;
  CustomCurvedNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _CustomCurvedNavigationBarState createState() =>
      _CustomCurvedNavigationBarState();
}

class _CustomCurvedNavigationBarState extends State<CustomCurvedNavigationBar> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const SpendingBudgets(),
    const CalendarScreen(),
    const Settings(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  List<IconData> iconList = [
    Icons.text_fields_outlined,
    Icons.camera_alt,
    Icons.mic,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: _screens[widget.currentIndex],
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.translate_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            _onItemTapped(_screens.length - 1);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            backgroundColor: Colors.grey,
            leftCornerRadius: 20,
            rightCornerRadius: 20,
            icons: iconList,
            activeIndex: widget.currentIndex,
            gapLocation: GapLocation.center,
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            notchSmoothness: NotchSmoothness.sharpEdge,
            onTap: _onItemTapped
            //other params
            ),
        );
    }
}