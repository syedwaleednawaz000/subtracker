
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

class SubsContainer extends StatefulWidget {
  const SubsContainer({
    super.key,
    required this.imageIcon,
    required this.title,
    required this.subtitle,

  });
  final Widget imageIcon;
  final String title;
  final String subtitle;

  @override
  State<SubsContainer> createState() => _SubsContainerState();
}

class _SubsContainerState extends State<SubsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MySize.scaleFactorHeight * 160, width: MySize.scaleFactorWidth * 168,
        decoration: BoxDecoration(
          color: Provider.of<ThemeChanger>(context).themeData ==
              darkMode
              ? Color(0xFF4E4E61).withOpacity(.2)
              : Color(0xFFF1F1FF),
            borderRadius: BorderRadius.circular(MySize.size16),
          border: Border(
            top: BorderSide( color: Provider.of<ThemeChanger>(context).themeData ==
                darkMode
                ? Color(0xFFCFCFFC).withOpacity(.15)
                : Color(0xFFCFCFFC).withOpacity(.15)),
            // bottom: BorderSide( color: Provider.of<ThemeChanger>(context).themeData ==
            //     darkMode
            //     ? Color(0xFFCFCFFC).withOpacity(.15)
            //     : Color(0xFFCFCFFC).withOpacity(.15)),
            left: BorderSide( color: Provider.of<ThemeChanger>(context).themeData ==
                darkMode
                ? Color(0xFFCFCFFC).withOpacity(.15)
                : Color(0xFFCFCFFC).withOpacity(.15)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(MySize.size12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.imageIcon,
              SizedBox(height: MySize.size18,),
              // color: Provider.of<ThemeChanger>(context).themeData ==
              //     darkMode
              //     ? Color(0xFFCFCFFC).withOpacity(.15)
              //     : Color(0xFFCFCFFC).withOpacity(.15)
              Text(widget.title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF424252),
                    fontFamily: 'Poppins_Regular'
                ),),
              Text(widget.subtitle,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF424252),
                    fontFamily: 'Poppins_Regular'
                ),),

                  // color: AppColors.white100, fontSize: 20


            ],
          ),
        ),
      ),
    );
  }
}




