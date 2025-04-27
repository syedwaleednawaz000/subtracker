// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:sub_tracker/Provider/privacy_provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:sub_tracker/Utils/app_colors.dart';
// import 'package:sub_tracker/Widget/app_bar_widget.dart';
// import '../../theme/theme.dart';
// import '../../utils/app_Images.dart';
// import '../../utils/my_size.dart';
//
// class PrivacyPolicy extends StatefulWidget {
//   const PrivacyPolicy({super.key});
//
//   @override
//   State<PrivacyPolicy> createState() => _PrivacyPolicyState();
// }
//
// class _PrivacyPolicyState extends State<PrivacyPolicy> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Future.microtask(() =>
//         Provider.of<PrivacyAndPolicyProvider>(context, listen: false)
//             .privacyAndPolicy());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
//       Colors.black
//           : const Color(0XFFFFFFFF),
//       appBar:   CustomAppBarInAll(leading: false,title: AppLocalizations.of(context)!.privacy_policy),
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           Column(
//             children: [
//
//               SizedBox(height: MySize.size12,),
//
//               Padding(
//                 padding: EdgeInsets.only(left: MySize.size32),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     AppLocalizations.of(context)!.privacy_policy,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                         color: Provider.of<ThemeChanger>(context).themeData ==
//                                 darkMode
//                             ? Colors.white
//                             : const Color(0XFF1c1c23),
//                         fontFamily: 'Poppins_Regular'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: MySize.size16,
//               ),
//               Consumer<PrivacyAndPolicyProvider>(
//                 builder: (context, privacyAndPolicyProvider, child) {
//                   return privacyAndPolicyProvider.isPrivacyAndPolicy ? const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,),): Padding(
//                     padding: EdgeInsets.only(left: MySize.size32),
//                     child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           privacyAndPolicyProvider.privacyAndPolicyData['value'] ?? "",
//                           style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Provider.of<ThemeChanger>(context)
//                                           .themeData ==
//                                       darkMode
//                                   ? Colors.white
//                                   : const Color(0XFF333339),
//                               fontFamily: 'Poppins_Regular'),
//                         )),
//                   );
//                 },
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

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key,});


  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late InAppWebViewController webViewController;
  bool isLoading = true;
  String paymentUrl = "https://www.subtracker.io/datenschutzerklarung-fur-innopulse-consulting-gmbh-subtracker-applikation/";

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