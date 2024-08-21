import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import 'base/custom_appBar.dart';


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
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF1C1C23) : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: MySize.size25),
          child:  CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: AppLocalizations.of(context)!.language,
            icon: Icons.arrow_back_rounded,
          ),
        ),
      ),

      body:  Column(
        children: [
          const SizedBox(height: 20,),
          LanguageTiles(),
          const SizedBox(height: 45,),
          Consumer<LanguageProvider>(builder: (context, languageProvider, child) {
            return           CustomSaveButton(text: "Save",onTap: (){
              FlutterToast.toastMessage(message: "Yet not implemented, we will add it later",isError: true);
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
                          ? (Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0xff758AFF) : Color(0xff758AFF)) // Highlight selected
                          : (Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Color(0xffF1F1FF)),
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



class CustomSaveButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  bool? loading ;

   CustomSaveButton({
    Key? key,
    this.loading,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? const Color(0XFF353542).withOpacity(0.50)
            : const Color(0XFFF1F1FF).withOpacity(.50),
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
                borderRadius: BorderRadius.circular(24),
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFFFFFFFF).withOpacity(.15)
                    : const Color(0XFFF1F1FF),
              ),
              child: Center(
                child: loading == true ? const CircularProgressIndicator(color: AppColors.purpleFF,): Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Colors.white
                        : const Color(0XFF1C1C23),
                  ),
                ),
              ),
            ),
          ),
        ],
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
