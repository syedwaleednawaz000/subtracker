import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';

class CustomSaveButton extends StatelessWidget {
  CustomSaveButton({
    super.key,
    required this.titleText,
    this.onTap,
    this.loading,
  });

  final String titleText ;
  void Function()? onTap;
  bool? loading ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? const Color(0XFF353542).withOpacity(0.50)
            :  Colors.white.withOpacity(0.350),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                height: 48,
                width: 288,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border(
                    top: BorderSide( color: AppColors.whiteFc.withOpacity(0.10)),
                    left: BorderSide( color: AppColors.whiteFc.withOpacity(0.10)),
                  ),
                  color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode
                      ? const Color(0XFFFFFFFF).withOpacity(.15)
                      : const Color(0XFFF1F1FF),
                ),
                child: Center(
                  child: loading == true ? const CircularProgressIndicator(color: AppColors.purpleFF,): Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color:
                      Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? Colors.white
                          : const Color(0XFF1c1c23),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
