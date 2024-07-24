import 'package:flutter/material.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/currency_screen/currency_provider/currency_provider.dart';
import 'package:sub_tracker/views/forgot_password/base/countNotifier.dart';
import 'package:sub_tracker/views/language_selection/providers/language_provider.dart';
import 'package:sub_tracker/views/splash_screen/splash_screen.dart';
import 'package:sub_tracker/Provider/login_provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/Provider/register_provider.dart';
import 'package:sub_tracker/Provider/splash_provider.dart';
import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
import 'package:sub_tracker/test.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/FAQs_screen/faqs.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:sub_tracker/views/bottomnavbar/bottomnavbar.dart';
import 'package:sub_tracker/views/cancelsubscription/cancelsubscription.dart';
import 'package:sub_tracker/views/contactsupport/contactsupport.dart';
import 'package:sub_tracker/views/currency_screen/currency_screen.dart';
import 'package:sub_tracker/views/forgot_password/base/countNotifier.dart';
import 'package:sub_tracker/views/forgot_password/forget_password.dart';
import 'package:sub_tracker/views/home_screen/home_screen.dart';
import 'package:sub_tracker/views/language_selection/language_selection.dart';
import 'package:sub_tracker/views/manageplan/manageplan.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/privpolicy/privpolicy.dart';
import 'package:sub_tracker/views/settings/settings.dart';
import 'package:sub_tracker/views/spending_budgets/spending_budgets.dart';
import 'package:sub_tracker/views/splash_screen/splash_screen.dart';
import 'package:sub_tracker/views/subscription/subscription.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';
import 'package:sub_tracker/views/termsofservices/termsofservices.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';
import 'bottom_nav/bottomNotifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => BottomNotifier()),
        ChangeNotifierProvider(create: (BuildContext context) => CounterNotifier()),
        ChangeNotifierProvider(create: (BuildContext context) => ThemeChanger()),
        ChangeNotifierProvider(create: (BuildContext context) => LoginProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => RegisterProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SplashProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ProfileProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => LanguageProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => CurrencyProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeChanger.themeData,
          home: const SplashScreen(),
        );
      }),
    );

  }
}
