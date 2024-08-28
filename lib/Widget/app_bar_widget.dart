import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/notification_screen/notification_screen.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/my_size.dart';

class CustomAppBarInAll extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? type;
  final bool leading;
  final bool? actions;

  const CustomAppBarInAll({super.key,this.type, this.title,  this.leading = false, this.actions = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Colors.black
          : type != null? Colors.black:Color(0XFFF1F1FF),
      elevation: 0,
      centerTitle: true,
      title: title != null
          ? Padding(
            padding: const EdgeInsets.only(top: 14),
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
          : const SizedBox(), // Show SizedBox if title is null
      leading: leading == false ? GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 17,left: 24),
            child: Image.asset(
              AppImages.backArrow,
              color: const Color(0XFFFFFFFF),
              height: 24,
              width: 24,
              // fit: BoxFit.cover, // Ensure the image fits well within the SizedBox
            ),
          ),): const SizedBox(), // Show SizedBox if leading is null
      actions:  [actions == false ?const SizedBox() :notificationIcon()], // Show SizedBox if actions are null
    );
  }

  Widget notificationIcon(){
    return  Padding(
      padding: EdgeInsets.only(right: MySize.size25),
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
  @override
  Size get preferredSize => Size.fromHeight(72); // Adjust height as needed
}


