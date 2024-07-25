import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscription/base/hbocontainer.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';


class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
   TextEditingController? _controller;
   Map<String, dynamic> _selectedOption = {'Select Subscription Provider': "Select Subscription Provider"};

   ///
   final Map<String, List<String>> categories = {
     'Streaming Services': [
       'Netflix',
       'Hulu',
       'Disney+',
       'Amazon Prime Video',
       'HBO Max',
       'Apple TV+',
       'YouTube Premium',
       'Spotify',
       'Pandora',
       'Tidal',
     ],
     'Productivity Tools': [
       'Microsoft 365',
       'Google Workspace (formerly G Suite)',
       'Adobe Creative Cloud',
       'Evernote',
       'Trello',
       'Slack',
       'Zoom',
       'Dropbox',
       'Notion',
       'Todoist',
     ],
     'Cloud Storage': [
       'Google Drive',
       'Dropbox',
       'iCloud',
       'OneDrive',
       'Box',
     ],
     'Fitness and Wellness': [
       'Peloton',
       'Fitbit Premium',
       'Apple Fitness+',
       'Headspace',
       'Calm',
       'MyFitnessPal Premium',
       'Strava Summit',
     ],
     'News and Magazines': [
       'The New York Times',
       'The Washington Post',
       'The Wall Street Journal',
       'The Guardian',
       'Bloomberg',
       'Financial Times',
       'The Economist',
       'Wired',
       'National Geographic',
     ],
     'Gaming': [
       'Xbox Game Pass',
       'PlayStation Plus',
       'Nintendo Switch Online',
       'EA Play',
       'Apple Arcade',
     ],
     'Other Services': [
       'Amazon Prime',
       'Audible',
       'Scribd',
       'Patreon',
       'Skillshare',
       'MasterClass',
       'Canva',
       'LinkedIn Premium',
       'Tinder Plus/Gold',
       'Bumble Boost/Premium',
     ],
   };
   void _selectOption(String category, String subcategory) {
     setState(() {
       _selectedOption = {category: subcategory};
     });
     Navigator.pop(context);
   }

   void showSubcategories(BuildContext context, String category) {
     final subcategories = categories[category] ?? [];

     showModalBottomSheet(
       context: context,
       builder: (BuildContext context) {
         return Container(
           padding: const EdgeInsets.all(16.0),
           child: ListView(
             children: [
               Text(
                 'Subcategories of $category',
                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
               ),
               const Divider(),
               ...subcategories.map((subcat) {
                 return ListTile(
                   title: Text(subcat),
                   onTap: () => _selectOption(category, subcat),
                 );
               }).toList(),
             ],
           ),
         );
       },
     );
   }

   void showCategories(BuildContext context) {
     showModalBottomSheet(
       context: context,
       builder: (BuildContext context) {
         return Container(
           padding: const EdgeInsets.all(16.0),
           child: ListView(
             children: categories.keys.map((category) {
               return ListTile(
                 title: Text(category),
                 onTap: () {
                   Navigator.pop(context);
                   showSubcategories(context, category);
                 },
               );
             }).toList(),
           ),
         );
       },
     );
   }


   ///
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "\$5.99");
    _controller!.addListener(_formatInput);
  }

  void _formatInput() {
    String currentValue = _controller!.text;
    if (currentValue.isNotEmpty && !currentValue.startsWith("\$")) {
      _controller!.value = TextEditingValue(
        text: "\$" + currentValue.replaceAll("\$", ""),
        selection: TextSelection.collapsed(offset: currentValue.length + 1),
      );
    }
  }

  @override
  void dispose() {
    _controller!.removeListener(_formatInput);
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Above container
              Container(
                height: MySize.scaleFactorHeight * 515,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFF353542)
                        : const Color(0XFFF1F1FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MySize.size24),
                        bottomRight: Radius.circular(MySize.size24))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,  vertical: 22),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Image.asset(AppImages.backArrow)),
                          SizedBox(
                            width: MySize.scaleFactorWidth * 145,
                          ),
                          Text(
                            'New',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: MySize.size16,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFF424252),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: MySize.size20,
                    ),
                    Text('Add new\nsubscription',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? Colors.white
                            : const Color(0XFF1C1C23),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(AppImages.halfOneDriveLogo1,),
                        SizedBox(width: MySize.scaleFactorWidth * 86,),
                        const TresorlyContainer(),
                        SizedBox(width: MySize.scaleFactorWidth * 91.2,),
                        Image.asset(AppImages.halfSpotifyLogo1)
                      ],
                    ),
                    SizedBox(height: MySize.size16,),
                    Text('Tresorly',
                      style: TextStyle(
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? Colors.white
                            : const Color(0XFF333339),
                      ),
                    ),

                    SizedBox(height: MySize.size15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Tooltip(
                        message: "If the provider is already listed, you can select it from here instead of adding a new one.",
                        decoration: BoxDecoration(
                          color: Colors.blue, // Set the background color of the tooltip
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: GestureDetector(
                             onTap: (){
                               // AlertDialog(
                               //   backgroundColor: Color(0XFF101828).withOpacity(.3),
                               //   title: Text("If the provider is already listed, you can select it from here instead of adding a new one",
                               //   style: TextStyle(
                               //     fontSize: 10,
                               //
                               //   ),
                               //   ),
                               // );
                             },
                            child: Image.asset(AppImages.exclMark)),
                      ),
                          SizedBox(width: MySize.size4,),
                         Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Text('Select Provider',
                           style: TextStyle(
                             fontSize: MySize.size12,
                             fontWeight: FontWeight.w500,
                             color: Provider.of<ThemeChanger>(context).themeData ==
                                 darkMode
                                 ? const Color(0XFF666680)
                                 : const Color(0XFF666680),
                           ),
                         )
                          : Text('Select Subscription Provider',
                            style: TextStyle(
                              fontSize: MySize.size12,
                              fontWeight: FontWeight.w500,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: MySize.size10,),
                    GestureDetector(
                      // onTap: (){
                      //   showModalBottomSheet<void>(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //             color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      //                 ? Color(0XFF353542)
                      //                 : Color(0XFFF1F1FF),
                      //             borderRadius: BorderRadius.only(
                      //               topRight: Radius.circular(16),
                      //               topLeft: Radius.circular(16),
                      //             )
                      //         ),
                      //         height: 400,
                      //         child: Center(
                      //           child: SingleChildScrollView(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: <Widget>[
                      //                 const SizedBox(height: 30,),
                      //                 Text('Select Billing Plan',
                      //                   style: TextStyle(
                      //                     fontSize: MySize.size14,
                      //                     fontWeight: FontWeight.w600,
                      //                     color: Provider.of<ThemeChanger>(
                      //                         context)
                      //                         .themeData ==
                      //                         darkMode
                      //                         ? Colors.white
                      //                         : Color(0XFF424252),
                      //                   ),
                      //                 ),
                      //                 ListTile(
                      //                   title: Text('Monthly',
                      //                     style: TextStyle(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'Regular-Poppins',
                      //                       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                           darkMode
                      //                           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                           : Color(0XFF1C1C23),
                      //                     ),
                      //                   ),
                      //                   onTap: () => categories,
                      //                 ),
                      //                 // ListTile(
                      //                 //   title: Text('Quarterly',
                      //                 //     style: TextStyle(
                      //                 //       fontSize: 14,
                      //                 //       fontWeight: FontWeight.w400,
                      //                 //       fontFamily: 'Regular-Poppins',
                      //                 //       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                 //           darkMode
                      //                 //           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                 //           : Color(0XFF1C1C23),
                      //                 //     ),
                      //                 //   ),
                      //                 //   onTap: () => _selectOption('Quarterly'),
                      //                 // ),
                      //                 // ListTile(
                      //                 //   title: Text('Semi-Annually',
                      //                 //     style: TextStyle(
                      //                 //       fontSize: 14,
                      //                 //       fontWeight: FontWeight.w400,
                      //                 //       fontFamily: 'Regular-Poppins',
                      //                 //       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                 //           darkMode
                      //                 //           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                 //           : Color(0XFF1C1C23),
                      //                 //     ),
                      //                 //   ),
                      //                 //   onTap: () => _selectOption('Semi-Annually'),
                      //                 // ),
                      //                 // ListTile(
                      //                 //   title: Text('Annually',
                      //                 //     style: TextStyle(
                      //                 //       fontSize: 14,
                      //                 //       fontWeight: FontWeight.w400,
                      //                 //       fontFamily: 'Regular-Poppins',
                      //                 //       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                 //           darkMode
                      //                 //           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                 //           : Color(0XFF1C1C23),
                      //                 //     ),
                      //                 //   ),
                      //                 //   onTap: () => _selectOption('Annually'),
                      //                 // ),
                      //                 // ListTile(
                      //                 //   title: Text('Biennially',
                      //                 //     style: TextStyle(
                      //                 //       fontSize: 14,
                      //                 //       fontWeight: FontWeight.w400,
                      //                 //       fontFamily: 'Regular-Poppins',
                      //                 //       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                 //           darkMode
                      //                 //           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                 //           : Color(0XFF1C1C23),
                      //                 //     ),
                      //                 //   ),
                      //                 //   onTap: () => _selectOption('Biennially'),
                      //                 // ),
                      //                 // ListTile(
                      //                 //   title: Text('Weekly',
                      //                 //     style: TextStyle(
                      //                 //       fontSize: 14,
                      //                 //       fontWeight: FontWeight.w400,
                      //                 //       fontFamily: 'Regular-Poppins',
                      //                 //       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                 //           darkMode
                      //                 //           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                 //           : Color(0XFF1C1C23),
                      //                 //     ),
                      //                 //   ),
                      //                 //   onTap: () => _selectOption('Weekly'),
                      //                 // ),
                      //                 ListTile(
                      //                   title: Text('Bi-Weekly',
                      //                     style: TextStyle(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'Regular-Poppins',
                      //                       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                           darkMode
                      //                           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                           : Color(0XFF1C1C23),
                      //                     ),
                      //                   ),
                      //                   onTap: () => categories
                      //                 ),
                      //                 ListTile(
                      //                   title: Text('Custom',
                      //                     style: TextStyle(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'Regular-Poppins',
                      //                       color: Provider.of<ThemeChanger>(context).themeData ==
                      //                           darkMode
                      //                           ? Color(0XFFFFFFFF).withOpacity(.4)
                      //                           : Color(0XFF1C1C23),
                      //                     ),
                      //                   ),
                      //                   onTap: () => categories,
                      //                 ),
                      //
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   );
                      // },
                      onTap: (){
                        showCategories(context);
                      },
                      child: Container(
                       // padding: EdgeInsets.symmetric(horizontal: MySize.size2,),
                        height: MySize.size40,
                        width: MySize.scaleFactorWidth*340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                              color:  Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? const Color(0XFFFFFFFF).withOpacity(.1)
                                  : const Color(0XFF353542).withOpacity(.4),
                          )
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.search, color: Color(0xff666680)),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _selectedOption.values.first ?? "Select subscription Provider",
                              style: TextStyle(
                                fontSize: MySize.size12,
                                fontWeight: FontWeight.w500,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25,),
                    //   child: GestureDetector(
                    //     onTap: (){
                    //       showModalBottomSheet<void>(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return Container(
                    //             decoration: BoxDecoration(
                    //                 color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    //                     ? Color(0XFF353542)
                    //                     : Color(0XFFF1F1FF),
                    //                 borderRadius: BorderRadius.only(
                    //                   topRight: Radius.circular(16),
                    //                   topLeft: Radius.circular(16),
                    //                 )
                    //             ),
                    //             height: 400,
                    //             child: Center(
                    //               child: SingleChildScrollView(
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: <Widget>[
                    //                     const SizedBox(height: 30,),
                    //                     Text('Select Billing Plan',
                    //                       style: TextStyle(
                    //                         fontSize: MySize.size14,
                    //                         fontWeight: FontWeight.w600,
                    //                         color: Provider.of<ThemeChanger>(
                    //                             context)
                    //                             .themeData ==
                    //                             darkMode
                    //                             ? Colors.white
                    //                             : Color(0XFF424252),
                    //                       ),
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Monthly',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () => categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Quarterly',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () => categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Semi-Annually',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () =>categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Annually',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () => categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Biennially',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () =>categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Weekly',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () => categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Bi-Weekly',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () => categories,
                    //                     ),
                    //                     ListTile(
                    //                       title: Text('Custom',
                    //                         style: TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w400,
                    //                           fontFamily: 'Regular-Poppins',
                    //                           color: Provider.of<ThemeChanger>(context).themeData ==
                    //                               darkMode
                    //                               ? Color(0XFFFFFFFF).withOpacity(.4)
                    //                               : Color(0XFF1C1C23),
                    //                         ),
                    //                       ),
                    //                       onTap: () =>categories,
                    //                     ),
                    //
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //       );
                    //     },
                    //     child: TextFormField(
                    //       cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                    //           ? Color(0XFFFFFFFF)
                    //           : Color(0XFF1C1C23),
                    //       decoration: InputDecoration(
                    //         isDense: true,
                    //         contentPadding: EdgeInsets.zero,
                    //         prefixIcon: Icon(Icons.search,color: Color(0xff666680),),
                    //         hintText: 'Select Subscription Provider',
                    //         hintStyle: TextStyle(
                    //           fontSize: MySize.size12,
                    //           fontWeight: FontWeight.w500,
                    //           color: Provider.of<ThemeChanger>(context).themeData ==
                    //               darkMode
                    //               ? Color(0XFF666680)
                    //               : Color(0XFF666680),
                    //         ),
                    //               // border: OutlineInputBorder(
                    //               //   borderRadius: BorderRadius.circular(16),
                    //               //   borderSide:  BorderSide(
                    //               //             color:  Provider.of<ThemeChanger>(context).themeData ==
                    //               //                   darkMode
                    //               //                   ? Color(0XFFFFFFFF).withOpacity(.1)
                    //               //                   : Color(0XFF353542).withOpacity(.1),
                    //               //             width: 1.5,
                    //               //           ),
                    //               //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(16),
                    //           borderSide: BorderSide(
                    //             color:  Provider.of<ThemeChanger>(context).themeData ==
                    //                   darkMode
                    //                   ? Color(0XFFFFFFFF).withOpacity(.1)
                    //                   : Color(0XFF353542).withOpacity(.4),
                    //             width: 1.5,
                    //           ),
                    //         ),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(16),
                    //       borderSide: BorderSide(
                    //       color:  Provider.of<ThemeChanger>(context).themeData ==
                    //           darkMode
                    //           ? Color(0XFFFFFFFF).withOpacity(.1)
                    //           : Color(0XFF353542).withOpacity(.4),
                    //       width: 1.5,
                    //     ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 14,),
              SizedBox(
                height: 4,
                child: ListView(
                  children: [
                    SizedBox(height: MySize.size34,),
                  ],
                ),
              ),
              /// below container
              Text('Description',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MySize.size12,
                  fontWeight: FontWeight.w500,
                  color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode
                      ? const Color(0XFF666680)
                      : const Color(0XFF666680),
                ),
              ),
              SizedBox(
                height: MySize.size4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:  Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF).withOpacity(.1)
                          : const Color(0XFF353542).withOpacity(.4),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFFFFFFFF)
                        : const Color(0XFF1C1C23),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        isDense: true,
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size30,
              ),
              /// row of price customizing

              Padding(
                padding:
                EdgeInsets.only(left: MySize.size24, right: MySize.size24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                              backgroundColor: Color(0XFF1C1C23),
                              content: Center(child: Text('Price is deducted ', style: TextStyle(
                                color: Colors.white
                              ),)))
                        );
                      },
                      child: Container(
                        height: MySize.scaleFactorHeight * 48,
                        width: MySize.scaleFactorWidth * 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? const Color(0XFFCFCFFC).withOpacity(.15)
                                : const Color(0XFFCFCFFC).withOpacity(.15),
                          ),
                            color:Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? const Color(0XFF4E4E61).withOpacity(.1)
                                : const Color(0XFF4E4E61).withOpacity(.2),
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Icon(
                          Icons.remove,
                          size: MySize.size30,
                          color:Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                              ? const Color(0XFF4E4E61)
                              : const Color(0XFF353542)
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text('Mothly price',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MySize.size12,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? const Color(0XFF83839C)
                                : const Color(0XFF83839C) //: Color(0XFF333339),
                          ),
                        ),
                        SizedBox(
                          height: MySize.size4,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            controller: _controller,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true,),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\$?\d*\.?\d{0,2}')), // Allow only digits and up to 2 decimal places
                            ],
                             style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: MySize.size24,
                               color: Provider.of<ThemeChanger>(context).themeData ==
                                   darkMode
                                   ? Colors.white
                                   : const Color(0XFF333339),
                             ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText:"\$5.99",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: MySize.size24,
                                color: Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                    ? Colors.white
                                    : const Color(0XFF333339),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                      ? const Color(0XFF353542)
                                      : const Color(0XFF353542)
                                )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF353542)
                                  : const Color(0XFF353542)
                                )
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(
                              // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                              // showCloseIcon: true,
                              //   closeIconColor: Colors.redAccent,
                              backgroundColor: Color(0XFF1C1C23),
                                content: Center(
                                child: Text('Price is added', style: TextStyle(
                                   color: Colors.white
                                ),))));
                      },
                      child: Container(
                        height: MySize.scaleFactorHeight * 48,
                        width: MySize.scaleFactorWidth * 48,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? const Color(0XFFCFCFFC).withOpacity(.15)
                                  : const Color(0XFFCFCFFC).withOpacity(.15),
                            ),
                            color:Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? const Color(0XFF4E4E61).withOpacity(.1)
                                : const Color(0XFF4E4E61).withOpacity(.2),
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Icon(
                          Icons.add,
                          size: MySize.size30,
                            color:Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? const Color(0XFF4E4E61)
                                : const Color(0XFF353542)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size38,
              ),
              /// Add this subscription button
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubscriptionInfo(),
                    ),
                  );

                },
                child: Container(
                  height: MySize.scaleFactorHeight * 48,
                  width: MySize.scaleFactorWidth * 324,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MySize.size24),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.purpleBE,
                          spreadRadius: 2,
                          blurRadius: 25,
                          offset: Offset(0, 9),
                        ),
                        BoxShadow(
                          color: AppColors.purpleFF,
                          offset: Offset(-5, 0),
                        ),
                        BoxShadow(
                          color: AppColors.purpleFF,
                          offset: Offset(5, 0),
                        )
                      ]
                  ),
                  child: Center(
                      child: Text('Add this subscription',
                      style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Regular-Poppins',
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Colors.white
                            : Colors.white,
                      ),
                      ),
                ),
                )),
                const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}




