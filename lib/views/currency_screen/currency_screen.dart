import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/settings/settings.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../language_selection/base/custom_appBar.dart';
import '../personaldata/personaldata.dart';



class CurrencySelection extends StatefulWidget {
  const CurrencySelection({super.key});

  @override
  State<CurrencySelection> createState() => _CurrencySelectionState();
}

class _CurrencySelectionState extends State<CurrencySelection> {

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
              text: 'Currency',
              icon: Icons.arrow_back_rounded,
            ),
          ),
        ),
      ),
      // backgroundColor: const Color(0XFF1C1C23),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF758AFF),
              ),
              child: Center(
                child: ListTile(
                  isThreeLine: false,
                  title: Text('Switzerland', style: TextStyle(color: Colors.white),),
                  leading: Image.asset('assets/icons/lang/switz.png', scale: 3.5,),
                  trailing: Text('CHF', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
          const CurrencyTiles(
            title: 'Pakistan2',
            leadingIcon: AssetImage('assets/icons/lang/switz.png',),
            trailingText: '()',
          ),
          SizedBox(height: 30),
          Spacer(),
          CustomSaveButton(
            titleText: 'Save',
          ),
          // Container(
          //   height: 114, width: double.infinity,
          //   decoration: BoxDecoration(
          //       // gradient: LinearGradient(colors: [Color(0XFF1C1C23), Color(0XFF3F3F4B)]),
          //     // color: Color(0XFF272730),
          //       borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          //       boxShadow: [
          //         BoxShadow(
          //             offset: Offset(0, 4),
          //             blurRadius: 4,
          //             // color: AppColors.black00.withOpacity(.25)
          //           color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.blue : Colors.green,
          //         )
          //       ]
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       GestureDetector(
          //         onTap: (){
          //           Navigator.push(context, MaterialPageRoute(builder:  (context) => Settings()));
          //         },
          //         child: Container(
          //             height: 48, width: 288,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(40),
          //                 color: Color(0XFFFFFFFF).withOpacity(.15),
          //                 // color: Colors.white.withOpacity(.10),
          //                 border: Border.all(color: Color(0XFFFFFFFF).withOpacity(.1))
          //             ),
          //             child: Center(child: TextWidgetInterMedium(title: 'Save',
          //                 // color: Colors.white
          //             ))),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class CurrencyTiles extends StatelessWidget {
  const CurrencyTiles({
    super.key, required this.title, required this.leadingIcon, required this.trailingText,
  });

  final String title;
  final ImageProvider leadingIcon;
  final String trailingText;


  @override
  Widget build(BuildContext context) {
    List<String> namingLists = ['Pakistan', 'Iran', 'English (UK)', 'Pakistan', 'English (UK)', 'Iran', 'Palestine', 'English (UK)'];
    List<String> namingLists_urdu = ['PKR', 'Rial', 'GBP', 'PKR', 'GBP', 'Rial', 'JOD', 'English'];
    List<AssetImage>  iconsList = [AssetImage('assets/icons/lang/PK.png'), AssetImage('assets/icons/lang/IR.png'), AssetImage('assets/icons/lang/GB.png'),AssetImage('assets/icons/lang/PK.png'), AssetImage('assets/icons/lang/GB.png'), AssetImage('assets/icons/lang/IR.png'), AssetImage('assets/icons/lang/PS.png'), AssetImage('assets/icons/lang/GB.png'), ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: namingLists.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 8),

          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Color(0XFF272730),
            ),
            child: Center(
              child: ListTile(
                dense: true,
                tileColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF272730) : Color(0XFFF7F7FF),
                // tileColor: Theme.of(context).colorScheme.primary,
                    title: Text('${namingLists[index]}', style: TextStyle(
                      // color: Colors.white.withOpacity(.5)
                    ),),
                    leading:  Image(image: iconsList[index], height: 24, width: 24,),
                    trailing: Text('${namingLists_urdu[index]}',
                    style: TextStyle(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white.withOpacity(.5): Color(0XFF1C1C23),
                    ),
                    ),
              ),
            ),
          ),
        );
      },);
  }
}
