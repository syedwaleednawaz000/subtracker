// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sub_tracker/Provider/term_and_condition_provider.dart';
// import 'package:sub_tracker/Widget/app_bar_widget.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:sub_tracker/utils/app_colors.dart';
// import '../../theme/theme.dart';
// import '../../utils/app_Images.dart';
// import '../../utils/my_size.dart';
//
// class TermsOfServices extends StatefulWidget {
//   const   TermsOfServices({super.key});
//
//   @override
//   State<TermsOfServices> createState() => _TermsOfServicesState();
// }
//
// class _TermsOfServicesState extends State<TermsOfServices> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Future.microtask(() =>     Provider.of<TermAndConditionProvider>(context,listen: false).getTermAndCondition());
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
//       Colors.black
//           : const Color(0XFFFFFFFF),
//       appBar:   CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.terms_of_service),
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           Column(
//             children: [
//
//               Padding(
//                 padding: EdgeInsets.only(left: MySize.size32),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     AppLocalizations.of(context)!.terms_of_service,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                         color: Provider.of<ThemeChanger>(context).themeData ==
//                             darkMode
//                             ? Colors.white
//                             : const Color(0XFF1c1c23),
//                         fontFamily: 'Poppins_Regular'),
//                   ),
//                 ),
//               ),
//               SizedBox(height: MySize.size12,),
//               Padding(
//                 padding: EdgeInsets.only(left: MySize.size32,right: MySize.size14),
//                 child: Consumer<TermAndConditionProvider>(builder: (context, termAndConditionProvider, child) {
//                  return termAndConditionProvider.isTermAndCondition ?
//                      const Center(child: CircularProgressIndicator(color: AppColors.purpleFF),):
//                   termAndConditionProvider.termAndConditionData == null ?
//                      Center(child: Text( AppLocalizations.of(context)!.term_and_condition_not_available),):
//                   Text("${termAndConditionProvider.termAndConditionData['value'] ??""}",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w400,
//                       color: Provider.of<ThemeChanger>(context).themeData == darkMode
//                           ? Colors.white
//                           : const Color(0XFF333339),
//                       fontFamily: 'Poppins_Regular'
//                   ),
//                   );
//                   }
//                   ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsOfServices extends StatefulWidget {
  const TermsOfServices({super.key,});


  @override
  _TermsOfServicesState createState() => _TermsOfServicesState();
}

class _TermsOfServicesState extends State<TermsOfServices> {
  late InAppWebViewController webViewController;
  bool isLoading = true;
  String paymentUrl = "https://www.subtracker.io/nutzungsbedingungen/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //       backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
      // Colors.black
      //     : const Color(0XFFFFFFFF),
      // appBar:   CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.terms_of_service),
      body: WillPopScope(
        onWillPop: () async {
          // Handle Android back button press here
          if (webViewController != null) {
            if (await webViewController.canGoBack()) {
              webViewController.goBack();
              return false;
            }
          }
          return true; // Close the screen when there's no WebView history
        },
        child: _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {


    return Stack(
      children: [
        SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(paymentUrl))),
            onWebViewCreated: (controller) {
              webViewController = controller;
              controller.addJavaScriptHandler(
                handlerName: 'SubTracker',
                callback: (args) {
                  // Handle JavaScript messages from WebView
                },
              );
            },
            onLoadStart: (controller, url) {
              setState(() {
                isLoading = true;
              });
            },
            onLoadError: (controller, url, code, message) {
              setState(() {
                isLoading = false;
              });
            },
            onLoadStop: (controller, url) {
              setState(() {
                isLoading = false;
              });
            },
            // ... other callbacks ...
          ),
        ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(color: Color(0xff758AFF)), // Loading indicator
          ),
      ],
    );
  }
}