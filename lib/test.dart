// // import 'dart:ui';
// //
// // import 'package:flutter/material.dart';
// // import 'dart:math';
// //
// //
// // class MainScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFF1F1F28),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             SizedBox(height: 50),
// //             Center(
// //               child: Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   CustomPaint(
// //                     size: Size(300, 300), // Adjust size as needed
// //                     painter: DottedArcPainter(strokeWidth: 4, color: Colors.white.withOpacity(0.3)),
// //                   ),
// //                   CustomPaint(
// //                     size: Size(250, 250),
// //                     painter: CircularProgressBarPainter(
// //                         progress: 0.5, strokeWidth: 4, color: Colors.blueAccent),
// //                   ),
// //                   Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //
// //                       SizedBox(height: 20),
// //                       Text(
// //                         '\$1,235',
// //                         style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
// //                       ),
// //                       SizedBox(height: 10),
// //                       Text(
// //                         'This month bills',
// //                         style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.7)),
// //                       ),
// //                       SizedBox(height: 20),
// //                       ElevatedButton(
// //                         onPressed: () {},
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Color(0xFF383846), // Background color
// //                           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(30),
// //                           ),
// //                         ),
// //                         child: Text(
// //                           'See your budget',
// //                           style: TextStyle(fontSize: 16, color: Colors.white),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   StatCard(title: 'Active subs', value: '12', color: Colors.blueAccent),
// //                   StatCard(title: 'Highest subs', value: '\$19.99', color: Colors.purpleAccent),
// //                   StatCard(title: 'Lowest subs', value: '\$5.99', color: Colors.cyanAccent),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //
// //           ],
// //         ),
// //       ),
// //
// //     );
// //   }
// // }
// //
// // class StatCard extends StatelessWidget {
// //   final String title;
// //   final String value;
// //   final Color color;
// //
// //   StatCard({required this.title, required this.value, required this.color});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 110,
// //       padding: EdgeInsets.all(15),
// //       decoration: BoxDecoration(
// //         color: Color(0xFF2C2C37),
// //         borderRadius: BorderRadius.circular(15.0),
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Text(
// //             title,
// //             style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
// //           ),
// //           SizedBox(height: 10),
// //           Text(
// //             value,
// //             style: TextStyle(fontSize: 22, color: color, fontWeight: FontWeight.bold),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class SubscriptionsList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         SubscriptionItem(
// //           icon: 'assets/icons/signntrack.png',
// //           name: 'SignNTrack',
// //           price: '\$5.99',
// //         ),
// //         SubscriptionItem(
// //           icon: 'assets/icons/profilio.png',
// //           name: 'Profilio',
// //           price: '\$18.99',
// //         ),
// //         SubscriptionItem(
// //           icon: 'assets/icons/tresorly.png',
// //           name: 'Tresorly',
// //           price: '\$29.99',
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
// // class SubscriptionItem extends StatelessWidget {
// //   final String icon;
// //   final String name;
// //   final String price;
// //
// //   SubscriptionItem({required this.icon, required this.name, required this.price});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Row(
// //         children: [
// //           Image.asset(icon, width: 40, height: 40),
// //           SizedBox(width: 20),
// //           Expanded(
// //             child: Text(
// //               name,
// //               style: TextStyle(fontSize: 18, color: Colors.white),
// //             ),
// //           ),
// //           Text(
// //             price,
// //             style: TextStyle(fontSize: 18, color: Colors.white),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// // class CircularProgressBarPainter extends CustomPainter {
// //   final double progress;
// //   final double strokeWidth;
// //   final Color color;
// //
// //   CircularProgressBarPainter({
// //     required this.progress,
// //     required this.strokeWidth,
// //     required this.color,
// //   });
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final Paint paint = Paint()
// //       ..color = color
// //       ..strokeWidth = strokeWidth
// //       ..style = PaintingStyle.stroke
// //       ..strokeCap = StrokeCap.round;
// //
// //     final double radius = size.width / 3.2;
// //     final Offset center = Offset(size.width / 2, size.height / 2);
// //     final Rect rect = Rect.fromCircle(center: center, radius: radius);
// //
// //     canvas.drawArc(rect, pi / 1.7, 3.3 * pi * progress, false, paint);
// //   }
// //
// //   @override
// //   bool shouldRepaint(CircularProgressBarPainter oldDelegate) {
// //     return oldDelegate.progress != progress || oldDelegate.color != color;
// //   }
// // }
// //
// // class DottedArcPainter extends CustomPainter {
// //   final double strokeWidth;
// //   final Color color;
// //
// //   DottedArcPainter({
// //     required this.strokeWidth,
// //     required this.color,
// //   });
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final Paint paint = Paint()
// //       ..color = color
// //       ..strokeWidth = strokeWidth
// //       ..style = PaintingStyle.stroke;
// //
// //     final double radius = size.width / 2;
// //     final Offset center = Offset(size.width / 2, size.height / 2);
// //
// //     final Path path = Path()
// //       ..addArc(Rect.fromCircle(center: center, radius: radius), pi / 1.2, 3.2 * pi);
// //
// //     final PathMetrics pathMetrics = path.computeMetrics();
// //     for (PathMetric pathMetric in pathMetrics) {
// //       for (double i = 1; i <= pathMetric.length; i += 20) {
// //         final Tangent? tangent = pathMetric.getTangentForOffset(i);
// //         if (tangent != null) {
// //           canvas.drawCircle(tangent.position, strokeWidth / 12, paint);
// //         }
// //       }
// //     }
// //   }
// //
// //   @override
// //   bool shouldRepaint(DottedArcPainter oldDelegate) {
// //     return oldDelegate.strokeWidth != strokeWidth || oldDelegate.color != color;
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sub_tracker/theme/theme.dart';
//
// class SwitchExample extends StatefulWidget {
//   @override
//   _SwitchExampleState createState() => _SwitchExampleState();
// }
//
// class _SwitchExampleState extends State<SwitchExample> {
//   @override
//   Widget build(BuildContext context) {
//     final themeChanger = Provider.of<ThemeChanger>(context);
//     bool isDarkMode = themeChanger.isDarkMode;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Switch Example 2'),
//       ),
//       body: Center(
//         child: Switch(
//           value: isDarkMode,
//           onChanged: (bool newValue) {
//             themeChanger.toggleTheme();
//           },
//         ),
//       ),
//     );
//   }
// }
