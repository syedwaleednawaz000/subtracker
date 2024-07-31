import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../utils/my_size.dart';


class CalendarContainer extends StatefulWidget {
  final int selectedMonth;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarContainer({
    super.key,
    required this.selectedMonth,
    required this.onDateSelected,
  });

  @override
  _CalendarContainerState createState() => _CalendarContainerState();
}

class _CalendarContainerState extends State<CalendarContainer> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Set the current date as selected by default if it's in the current month
    DateTime now = DateTime.now();
    if (now.month == widget.selectedMonth) {
      _selectedDate = now; // Set the current date as selected if it's in the selected month
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int year = now.year;
    DateTime firstDayOfMonth = DateTime(year, widget.selectedMonth, 1);
    int lastDayOfMonth = DateTime(year, widget.selectedMonth + 1, 0).day;

    List<String> titleText = List.generate(lastDayOfMonth, (index) => (index + 1).toString().padLeft(2, '0'));
    List<String> subtitleText = List.generate(lastDayOfMonth, (index) => DateFormat('E').format(DateTime(year, widget.selectedMonth, index + 1)).substring(0, 2).toUpperCase());

    List<Color> colors = List.generate(lastDayOfMonth, (index) {
      DateTime date = DateTime(year, widget.selectedMonth, index + 1);
      if (_selectedDate != null && date.year == _selectedDate!.year && date.month == _selectedDate!.month && date.day == _selectedDate!.day) {
        return Colors.blueAccent; // Selected color
      } else {
        return index % 2 == 0 ? const Color(0XFFF1F1FF) : const Color(0XFFF1F1FF); // Default color
      }
    });

    return SizedBox(
      height: 100, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lastDayOfMonth,
        itemBuilder: (context, index) {
          DateTime date = DateTime(year, widget.selectedMonth, index + 1);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (_selectedDate != null && _selectedDate!.isAtSameMomentAs(date)) {
                  _selectedDate = null; // Deselect if already selected
                } else {
                  _selectedDate = date; // Select the new date
                }
                widget.onDateSelected(_selectedDate ?? DateTime(0)); // Pass the selected date or default
              });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _selectedDate != null && _selectedDate!.isAtSameMomentAs(date)
                    ?Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF4E4E61) : const Color(0XFF4E4E6133).withOpacity(.20)// Selected color
                    : Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFFD3DAFF) : const Color(0XFFF1F1FF).withOpacity(.15)// Selected color
                , // Default color
                borderRadius: BorderRadius.circular(MySize.size16),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleText[index],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitleText[index],
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10,),
                  // Show the icon if this date is selected
                  if (_selectedDate != null && _selectedDate!.isAtSameMomentAs(date))
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      decoration: const BoxDecoration(
                        color:Colors.red,
                        shape: BoxShape.circle,

                      ),
                    ) ,// // Adjust icon color as needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


// class CalendarContainer extends StatefulWidget {
//   final int selectedMonth; // Add this line to accept the selected month
//   final ValueChanged<DateTime> onDateSelected; // Callback to handle date selection
//
//   const CalendarContainer({
//     super.key,
//     required this.selectedMonth,
//     required this.onDateSelected,
//   });
//
//   @override
//   State<CalendarContainer> createState() => _CalendarContainerState();
// }
//
// class _CalendarContainerState extends State<CalendarContainer> {
//
//   DateTime? _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     // Set the current date as selected by default if it's in the current month
//     DateTime now = DateTime.now();
//     if (now.month == widget.selectedMonth) {
//       _selectedDate = now;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     int year = now.year;
//     DateTime firstDayOfMonth = DateTime(year, widget.selectedMonth, 1);
//     int lastDayOfMonth = DateTime(year, widget.selectedMonth + 1, 0).day;
//
//     List<String> titleText = List.generate(lastDayOfMonth, (index) => (index + 1).toString().padLeft(2, '0'));
//     List<String> subtitleText = List.generate(lastDayOfMonth, (index) => DateFormat('E').format(DateTime(year, widget.selectedMonth, index + 1)).substring(0, 2).toUpperCase());
//
//     List<Color> colors = List.generate(lastDayOfMonth, (index) {
//       DateTime date = DateTime(year, widget.selectedMonth, index + 1);
//       if (_selectedDate == date) {
//         return Colors.blueAccent; // Selected color
//       } else {
//         return index % 2 == 0 ? Color(0XFFD3DAFF) : Color(0XFFF1F1FF); // Default color
//       }
//     });
//     return SizedBox(
//       height: 100, // Adjust height as needed
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: lastDayOfMonth,
//         itemBuilder: (context, index) {
//           DateTime date = DateTime(year, widget.selectedMonth, index + 1);
//
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 if (_selectedDate == date) {
//                   _selectedDate = null; // Deselect if already selected
//                 } else {
//                   _selectedDate = date; // Select the new date
//                 }
//                 widget.onDateSelected(_selectedDate ?? DateTime(0)); // Pass the selected date or default
//               });
//             },
//             child: Container(
//               width: 60, // Adjust width as needed
//               margin: EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: colors[index],
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.grey.withOpacity(0.3)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     titleText[index],
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     subtitleText[index],
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
