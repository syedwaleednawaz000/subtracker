// import 'package:flutter/material.dart';
// import 'package:sub_tracker/utils/app_constant.dart';
//
// import '../../utils/app_colors.dart';
// import '../../utils/my_size.dart';
// import '../base/text_widgets.dart';
//
// class ManagePayment extends StatelessWidget {
//   const ManagePayment({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.black00,
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: MySize.size23,
//                 vertical: MySize.size32,
//               ),
//               child: Row(
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_back_ios_sharp,
//                       color: AppColors.greyB5,
//                     ),
//                   ),
//                   SizedBox(
//                     width: MySize.scaleFactorWidth * 95,
//                   ),
//                   TextWidgetInterBold(
//                     title: 'Manage Payment',
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.greyB5,
//                     fontSize: MySize.size16,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MySize.scaleFactorHeight*550,
//               child: ListView.builder(
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: MySize.size20,
//                       vertical: MySize.size16,
//                     ),
//                     margin: EdgeInsets.symmetric(
//                       vertical: MySize.size8,
//                       horizontal: MySize.size16,
//                     ),
//                     height: MySize.scaleFactorHeight * 56,
//                     width: MySize.scaleFactorWidth*328,
//                     decoration: BoxDecoration(
//                       color: AppColors.black61.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(
//                         width: MySize.size2,
//                         color: AppColors.whiteFc.withOpacity(0.15),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: MySize.scaleFactorHeight*27,
//                           width: MySize.scaleFactorWidth*27,
//                           child:AppConstant.googleImage
//                         ),
//                         SizedBox(
//                           width: MySize.scaleFactorWidth * 4,
//                         ),
//                         TextWidgetInterBold(
//                           title: 'Google play',
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.whiteFF,
//                           fontSize: MySize.size14,
//                         ),
//                         SizedBox(
//                           width: MySize.scaleFactorWidth * 90,
//                         ),
//                         TextWidgetInterBold(
//                           title: 'Connected',
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.whiteFF,
//                           fontSize: MySize.size14,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: MySize.size30,
//             ),
//             Container(
//               height: MySize.scaleFactorHeight * 48,
//               width: MySize.scaleFactorWidth * 288,
//               decoration: BoxDecoration(
//                 color: AppColors.whiteFF.withOpacity(.1),
//                 borderRadius: BorderRadius.circular(MySize.size24),
//               ),
//               child: Center(
//                 child: TextWidgetInterMedium(
//                     title: 'Save',
//                     color: AppColors.whiteFF,
//                     fontSize: MySize.size14,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
