import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/faqs_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../addNewSubscription/base/custom_expension_tile.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  String _selectedText = 'Lorem ipsum dolor sit ?';

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(
        () => Provider.of<FaqsProvider>(context, listen: false).getFaqs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
      Colors.black
          : const Color(0XFFF1F1FF),
      appBar:  CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.faqs),
      body: Padding(
        padding: const EdgeInsets.only(left: 37, right: 37,),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 18),
                    child: Text(
                      AppLocalizations.of(context)!.frequently_asked_questions,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Colors.white
                              : const Color(0XFF333339),
                          fontFamily: 'Poppins_Regular'),
                    )),

                Consumer<FaqsProvider>(builder: (context, faqsProvider, child) {
                  return faqsProvider.isFaqs ?
                  const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,),):
                  faqsProvider.faqsData['data'] == null ?
                  const Center(child: Text(""),):
                  ListView.builder(
                    itemCount: faqsProvider.faqsData['data'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var finalData =  faqsProvider.faqsData['data'][index];
                      return Container(
                        margin:  EdgeInsets.symmetric(vertical: MySize.size5),
                        child: CustomExpensionTile(
                          title: finalData['title'],
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: finalData['description'],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                          darkMode
                                          ? const Color(0XFFFFFFFF).withOpacity(.7)
                                          : const Color(0XFF333339).withOpacity(.8),
                                      fontFamily: 'Poppins_Regular'),
                                ),
                              ],
                              ),
                          ),
                        ),
                      );
                    },
                  );

                },)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
