import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';


class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<LanguageProvider>(context,listen: false).getLanguages());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
      Colors.black
          : const Color(0XFFF1F1FF),
      appBar:  CustomAppBarInAll(leading: false,title: AppLocalizations.of(context)!.language),
      body:  Column(
        children: [
          const SizedBox(height: 20,),
          LanguageTiles(),
          const SizedBox(height: 45,),
          Consumer<LanguageProvider>(builder: (context, languageProvider, child) {
            return CustomSaveButton(titleText:  AppLocalizations.of(context)!.save,onTap: (){
              FlutterToast.toastMessage(message:  AppLocalizations.of(context)!.yet_not_implemented_we_will_add_it_later,isError: true);
              // Get.back();
            }
            );
          },)
        ],
      ),
    );
  }
}

class LanguageTiles extends StatelessWidget {
   LanguageTiles({super.key,});



  List<LanguageModelClass> languageData = [
    LanguageModelClass(languagesCode: "en",countryCode: "US",countryFlag: AppImages.psFlag,countryName: "English (UK)",countryLanguageName: "English"),
    LanguageModelClass(languagesCode: "ur",countryCode: "PK",countryFlag: AppImages.pkFlag,countryName: "Pakistan",countryLanguageName: "Urdu")
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return ListView.builder(
            itemCount: languageData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, top: 10),
                child: GestureDetector(
                  onTap: () {
                      languageProvider.changeLanguage( Locale(languageData[index].languagesCode, languageData[index].countryCode),);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MySize.size15),
                      color:languageData[index].languagesCode == languageProvider.languageCode
                          ? (Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0xff758AFF) : Color(0xff758AFF))
                          : (Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF272730) : const Color(0XFFF7F7FF)),
                    ),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        languageData[index].countryName,
                        style: TextStyle(
                          fontFamily: 'Poppins_Regular',
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : const Color(0XFF1C1C23),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: Image(image: AssetImage(languageData[index].countryFlag), height: 24, width: 24,),
                      trailing: Text(
                        '(${languageData[index].countryLanguageName})',
                        style: TextStyle(
                          fontFamily: 'Poppins_Regular',
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white.withOpacity(.5) : const Color(0XFF1C1C23),
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


class LanguageModelClass {
  String countryName ;
  String countryLanguageName ;
  String countryFlag;
  String countryCode;
  String languagesCode;
  LanguageModelClass({required this.languagesCode,required this.countryLanguageName,required this.countryCode, required this.countryFlag, required this.countryName});
}
