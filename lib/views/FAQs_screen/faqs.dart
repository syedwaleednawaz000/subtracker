import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/faqs_provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../language_selection/base/custom_appBar.dart';
import '../subscription/base/custom_expension_tile.dart';

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
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(top: MySize.size25),
          child: CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'FAQs',
            // the back icon is inside the Custom App Bar
            icon: Icons.abc,
            //icon: Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 37, right: 37, top: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 18),
                    child: Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Colors.white
                              : Color(0XFF333339),
                          fontFamily: 'Poppins_Regular'),
                    )),

                // SizedBox(
                //   height: MySize.size15,
                // ),

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
                        margin: const EdgeInsets.symmetric(vertical: 5),
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
                                          ? Color(0XFFFFFFFF).withOpacity(.7)
                                          : Color(0XFF333339).withOpacity(.8),
                                      fontFamily: 'Poppins_Regular'),
                                ),
                              ])),
                        ),
                      );
                    },);

                },)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
