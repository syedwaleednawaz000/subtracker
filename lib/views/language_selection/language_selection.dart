import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/views/language_selection/providers/language_provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../personaldata/personaldata.dart';
import '../settings/settings.dart';
import 'base/custom_appBar.dart';


class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF1C1C23) : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: MySize.size25),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomAppBar(
              text: 'Language',
              icon: Icons.arrow_back_rounded,
            ),
          ),
        ),
      ),

      body: const Column(
        children: [

          SizedBox(height: 20,),
        LanguageTiles(
          title: 'Pakistan',
          leadingIcon: AssetImage(AppImages.psFlag,),
          trailingText: '()',
        ),
          SizedBox(height: 45,),


          CustomSaveButton(Text: 'Save',),
        ],
      ),
    );
  }
}

class LanguageTiles extends StatelessWidget {
  const LanguageTiles({
    super.key, required this.title, required this.leadingIcon, required this.trailingText,
  });

  final String title;
  final ImageProvider leadingIcon;
  final String trailingText;


  @override
  Widget build(BuildContext context) {

    List<String> namingLists = [ 'English (UK)', 'Pakistan', 'Iran', 'English (UK)', 'Pakistan', 'English (UK)', 'Iran', 'English (UK)', 'English (UK)', ];
    List<String> namingLists_urdu = ['(English)', '(اردو)', '(فارسی)', 'English ', '(اردو)', 'English', '(فارسی)', 'English', 'English', ];
    List<AssetImage>  iconsList = [AssetImage(AppImages.psFlag),AssetImage(AppImages.pkFlag), AssetImage(AppImages.gbFlag), AssetImage(AppImages.gbFlag), AssetImage(AppImages.gbFlag), AssetImage(AppImages.gbFlag), AssetImage(AppImages.gbFlag), AssetImage(AppImages.gbFlag), AssetImage(AppImages.gbFlag),];
    List<Color> listColors = [
      Color(0XFF758AFF), Color(0XFFF1F1FF), Color(0XFFF1F1FF),
      Color(0XFFF1F1FF), Color(0XFFF1F1FF), Color(0XFFF1F1FF),
      Color(0XFFF1F1FF), Color(0XFFF1F1FF), Color(0XFFF1F1FF)
    ];
    List<Color> containerColors = [
      Color(0XFF758AFF), Color(0XFF272730), Color(0XFF272730),
      Color(0XFF272730), Color(0XFF272730), Color(0XFF272730),
      Color(0XFF272730), Color(0XFF272730), Color(0XFF272730),
    ];
    List<Color> titleColors = [
      Color(0XFFFFFFFF), Color(0XFF1C1C23), Color(0XFF1C1C23),

      Color(0XFF1C1C23),Color(0XFF1C1C23),Color(0XFF1C1C23),
      Color(0XFF1C1C23),Color(0XFF1C1C23),Color(0XFF1C1C23),
    ];
    List<Color> trailColors = [
      Color(0XFFFFFFFF), Color(0XFF1C1C23), Color(0XFF1C1C23),
      Color(0XFF1C1C23),Color(0XFF1C1C23),Color(0XFF1C1C23),
      Color(0XFF1C1C23),Color(0XFF1C1C23),Color(0XFF1C1C23),
    ];

    return Expanded(
      child: Consumer<LanguageProvider>(
        builder: (context, selectionProvider, child) {
          return ListView.builder(
            itemCount: namingLists.length,
            itemBuilder: (context, index) {
              bool isSelected = selectionProvider.selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, top: 10),
                child: GestureDetector(
                  onTap: () {
                    selectionProvider.selectIndex(index, namingLists[index], namingLists_urdu[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected
                          ? (Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.blue : Colors.blue.withOpacity(0.5)) // Highlight selected
                          : (Provider.of<ThemeChanger>(context).themeData == darkMode ? containerColors[index] : listColors[index]),
                    ),
                    child: ListTile(
                      tileColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF272730) : listColors[index],
                      dense: true,
                      title: Text(
                        '${namingLists[index]}',
                        style: TextStyle(
                          fontFamily: 'Poppins_Regular',
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : Color(0XFF1C1C23),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: Image(image: iconsList[index], height: 24, width: 24,),
                      trailing: Text(
                        '${namingLists_urdu[index]}',
                        style: TextStyle(
                          fontFamily: 'Poppins_Regular',
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white.withOpacity(.5) : Color(0XFF1C1C23),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );

  }
}








//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../theme/theme.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/my_size.dart';
// import '../base/text_widgets.dart';
// import '../personaldata/personaldata.dart';
// import '../settings/settings.dart';
// import 'base/custom_appBar.dart';

// class LanguageSelection extends StatefulWidget {
//   const LanguageSelection({super.key});
//
//   @override
//   State<LanguageSelection> createState() => _LanguageSelectionState();
// }

// class _LanguageSelectionState extends State<LanguageSelection> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF1C1C23) : Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(MySize.size72),
//         child: Padding(
//           padding: EdgeInsets.only(left: 8, top: MySize.size25),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const CustomAppBar(
//               text: 'Language',
//               icon: Icons.arrow_back_rounded,
//             ),
//           ),
//         ),
//       ),
//
//       body: Column(
//         children: [
//         const LanguageTiles(
//           title: 'Pakistan',
//           leadingIcon: AssetImage('assets/icons/lang/PS.png',),
//           trailingText: '()',
//         ),
//           SizedBox(height: 45,),
//           CustomSaveButton(),
//         ],
//       ),
//     );
//   }
// }

// class LanguageTiles extends StatelessWidget {
//   const LanguageTiles({
//     super.key, required this.title, required this.leadingIcon, required this.trailingText,
//   });
//
//   final String title;
//   final ImageProvider leadingIcon;
//   final String trailingText;
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> namingLists = ['English', 'Pakisntan', 'Iran', 'English (UK)', 'Pakistan', 'English (UK)', 'Iran', 'English (UK)', 'English (UK)', ];
//     List<String> namingLists_urdu = ['(English)', '(اردو)', '(فارسی)', 'English ', '(اردو)', 'English', '(فارسی)', 'English', 'English', ];
//     List<AssetImage> iconsList = [
//       AssetImage('assets/icons/lang/GB.png'),
//       AssetImage('assets/icons/lang/PK.png'),
//       AssetImage('assets/icons/lang/IR.png'),
//       AssetImage('assets/icons/lang/GB.png'),
//       AssetImage('assets/icons/lang/PK.png'),
//       AssetImage('assets/icons/lang/GB.png'),
//       AssetImage('assets/icons/lang/IR.png'),
//       AssetImage('assets/icons/lang/PS.png'),
//       AssetImage('assets/icons/lang/GB.png'),
//     ];
//     List<Color> listColors = [
//       Color(0XFF758AFF), Color(0XFFF1F1FF).withOpacity(.1),Color(0XFFF1F1FF).withOpacity(.1),
//       Color(0XFFF1F1FF).withOpacity(.1), Color(0XFFF1F1FF).withOpacity(.1), Color(0XFFF1F1FF).withOpacity(.1),
//       Color(0XFFF1F1FF).withOpacity(.1), Color(0XFFF1F1FF).withOpacity(.1) ,Color(0XFFF1F1FF).withOpacity(.1)
//     ];
//     return Expanded(
//       child: ListView.builder(
//         itemCount: namingLists.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF272730) : listColors[index],
//               ),
//               child: ListTile(
//                 dense: true,
//                 tileColor: Color(0XFFF1F1FF),
//                 title: Text('${namingLists[index]}', style: TextStyle(fontFamily: 'Poppins_Regular'),),
//                 leading: Image(image: iconsList[index], height: 24, width: 24,),
//                 trailing: Text('${namingLists_urdu[index]}'),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key, required String Text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Provider.of<ThemeChanger>(context).themeData == darkMode
              ? Color(0XFF353542)
              : Color(0XFFF1F1FF).withOpacity(.86),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: AppColors.black00.withOpacity(.25)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                height: 48,
                width: 288,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode
                      ? Color(0XFFFFFFFF).withOpacity(.1)
                      : Color(0XFFF1F1FF),
                ),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color:
                      Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? Colors.white
                          : Color(0XFF1c1c23),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}