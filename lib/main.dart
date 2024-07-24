import 'package:flutter/material.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/forgot_password/base/countNotifier.dart';
import 'package:sub_tracker/views/splash_screen/splash_screen.dart';
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
