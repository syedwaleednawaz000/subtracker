import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/my_size.dart';

import '../views/notification_screen/notification_screen.dart';

class CustomAppBarInAll extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? type;
  final String? id;
  final bool leading;
  final bool? actions;

  const CustomAppBarInAll({this.id,super.key,this.type, this.title,  this.leading = false, this.actions = false});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: themeProvider.themeData == darkMode ?
          Colors.black
          : type != null?type == "delete" ? Color(0XFFFFFFFF): Colors.black:const Color(0XFFFFFFFF),
      elevation: 0,
      centerTitle: true,
      title: title != null
          ? Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
                    title!,
                    style: const TextStyle(
            color: Color(0xFFA2A2B5),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
                    ),
                  ),
          )
          : const SizedBox(),
      leading: leading == false ? GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 32,left: 24),
            child:SvgPicture.asset(
              height: 24,
              width: 24,
                "assets/icons/backArrowSVG.svg",
                color: themeProvider.themeData == darkMode ?Colors.white: Color(0XFFA2A2B5),
            ),
          ),): const SizedBox(), // Show SizedBox if leading is null
      actions:  [actions == false ?const SizedBox() : type == "delete"? deleteWidget():notificationIcon()], // Show SizedBox if actions are null
    );
  }

  Widget notificationIcon(){
    return  Padding(
      padding: EdgeInsets.only(right: MySize.size25,top: 32),
      child: InkWell(
        onTap: () {
          Get.to(()=> const NotificationsScreen());
        },
        child: SvgPicture.asset(
          AppImages.notificationIconSvg,
          height: MySize.size24,
          width: MySize.size24,
          color: const Color(0xFFA2A2B5),
        ),
      ),
    );
  }
  Widget deleteWidget(){
    return  Consumer<SubscriptionProvider>(
      builder:
          (context, subscriptionProvider, child) {
        return Padding(
          padding: EdgeInsets.only(right: MySize.size25,top: 32),
          child: GestureDetector(
            onTap: () {
              subscriptionProvider.deleteSubscription(
                  context: context,
                  subscriptionID: id.toString());
            },
            child: subscriptionProvider
                .isDeleteSubscription
                ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.purpleFF,
              ),
            )
                : Image.asset(
              AppImages.trash,
              scale: 1.1,
              color: Provider.of<ThemeChanger>(
                  context)
                  .themeData ==
                  darkMode
                  ? const Color(0xFFA2A2B5)
                  : const Color(0xFF424252),
            ),
          ),
        );
      },
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(72); // Adjust height as needed
}


