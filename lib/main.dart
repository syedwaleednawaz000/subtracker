import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Provider/change_password_provider.dart';
import 'package:sub_tracker/Provider/contact_with_support_provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/email_notification_provider.dart';
import 'package:sub_tracker/Provider/faqs_provider.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/Provider/login_provider.dart';
import 'package:sub_tracker/Provider/plan_provider.dart';
import 'package:sub_tracker/Provider/privacy_provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/Provider/register_provider.dart';
import 'package:sub_tracker/Provider/schedule_provider.dart';
import 'package:sub_tracker/Provider/splash_provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/Provider/term_and_condition_provider.dart';
import 'package:sub_tracker/Provider/ticket_provider.dart';
import 'package:sub_tracker/Provider/two_factor_auth_provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_url.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/local_auth_provider.dart';
import 'package:sub_tracker/views/forgot_password/base/countNotifier.dart';
import 'package:sub_tracker/views/splash_screen/splash_screen.dart';
import 'Provider/bottom_bar_provider.dart';
import 'Provider/spending_budget_provider.dart';
import 'views/subscriptioninfo/Provider/sub_scription_info_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  // await FireBaseApi().initNotification();
  if(Platform.isAndroid){
    Stripe.publishableKey =
        AppUrl.stripePublishableKey;
  }else if(Platform.isIOS){

  }else{

  }
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
        ChangeNotifierProvider(create: (BuildContext context) => BottomBarProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => CounterNotifier()),
        ChangeNotifierProvider(create: (BuildContext context) => ThemeChanger()),
        ChangeNotifierProvider(create: (BuildContext context) => LoginProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => RegisterProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SplashProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ProfileProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => LanguageProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => CurrencyProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => EmailNotificationProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => TwoFactorAuthProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => PlanProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => LocalAuthProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => FaqsProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => TicketProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => TermAndConditionProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => CategoryProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => PrivacyAndPolicyProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ScheduleProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SpendingBudgetProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ContactWithSupportProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SubscriptionInfoProvider()),

      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);

        return Consumer<LanguageProvider>(builder: (context, languageProvider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeChanger.themeData,

            locale: languageProvider.appLocale,
            localizationsDelegates:  const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ur'),
            ],

            home: const SplashScreen(),
            builder: (context, child) {
              // Ensure text direction is applied
              return Directionality(
                textDirection: Directionality.of(context),
                child: child!,
              );
            },

          );
        },);
      }),
    );

  }
}