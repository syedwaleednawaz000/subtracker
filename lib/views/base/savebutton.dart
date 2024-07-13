// import 'package:flutter/material.dart';
// import 'package:sub_tracker/views/base/text_widgets.dart';
// import 'package:sub_tracker/views/personaldata/personaldata.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/my_size.dart';
// import '../manageplan/manageplan.dart';
//
//
// class SaveButton extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String text;
//   const SaveButton({super.key, required this.text, this.height, this.width});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const PersonalData(),
//           ),
//         );
//       },
//       child: Container(
//
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: AppColors.whiteFF.withOpacity(.10),
//           borderRadius: BorderRadius.circular(MySize.size24),
//           border: Border.all(
//             width: 1,
//             color: AppColors.whiteFF.withOpacity(0.15),
//           )
//         ),
//         child: Center(
//           child: TextWidgetInterMedium(
//               title: text,
//               // color: AppColors.whiteFF,
//               fontSize: MySize.size14,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }
// }
