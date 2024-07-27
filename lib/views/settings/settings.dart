import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
import 'package:sub_tracker/notification_screen/notification_screen.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/FAQs_screen/faqs.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import 'package:sub_tracker/views/cancelsubscription/cancelsubscription.dart';
import 'package:sub_tracker/views/change_password/change_password.dart';
import 'package:sub_tracker/views/contactsupport/contactsupport.dart';
import 'package:sub_tracker/views/currency_screen/currency_screen.dart';
import 'package:sub_tracker/views/language_selection/language_selection.dart';
import 'package:sub_tracker/views/language_selection/providers/language_provider.dart';
import 'package:sub_tracker/views/manageplan/manageplan.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import 'package:sub_tracker/views/privpolicy/privpolicy.dart';
import 'package:sub_tracker/views/settings/base/settingrowslist.dart';
import 'package:sub_tracker/views/settings/base/showdialog.dart';
import 'package:sub_tracker/views/termsofservices/termsofservices.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<bool> _switchValues = List.generate(3, (index) => false);
  List<String> titleText = [
    'Personal Data',
    'Language',
    'Currency',
    'Change Password'
  ];
  List<String> titleText2 = [
    'Biometric Auth.',
    'Two Factor Auth.',
    'Email Notification'
  ];

  List<String> trailText2 = ['Plan', 'Cards', 'Cancel'];
  List<AssetImage> leadingAccImage = [
    AssetImage(AppImages.manIcon),
    AssetImage(AppImages.language),
    AssetImage(AppImages.currency),
    AssetImage(AppImages.password)
  ];
  List<AssetImage> leadingImage = [
    AssetImage(AppImages.faceID),
    AssetImage(AppImages.factor),
    AssetImage(AppImages.email)
  ];
  List<AssetImage> plansImage = [
    AssetImage(AppImages.plan),
    AssetImage(AppImages.payment),
    AssetImage(AppImages.payment)
  ];
  List<String> subsTitle = [
    'Manage Plan',
    'Manage Payment',
    'Cancel Subscription'
  ];

  final List<Widget> screens = const [
    PersonalData(),
    LanguageSelection(),
    CurrencySelection(),
    ChangePassword(),
  ];

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    CurrencyProvider currencyProvider = Provider.of<CurrencyProvider>(context);
    List<String> trailText = [
      'Data',
      "${languageProvider.selectedLanguage.toString()} ${languageProvider.selectedTranslation.toString()}",
      '${currencyProvider.selectedCountry.toString()} ${currencyProvider.selectedCurrency.toString()}',
      'Password',
    ];

    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Provider.of<ThemeChanger>(context).themeData == darkMode
                ? Color(0XFF1C1C23)
                : Color(0XFFF7F7FF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor:
                  Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? Colors.transparent
                      : Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Settings',
                style: TextStyle(
                    color: Color(0XFFA2A2B5),
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationsScreen()));
                      },
                      child: Image.asset(
                        AppImages.notificationIcon,
                        height: 25,
                        width: 25,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFFA2A2B5)
                            : Color(0XFF424252),
                      )),
                )
              ],
            ),
          ),
        ),
        body: Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            return ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: MySize.size40),
                    Container(
                      height: MySize.size72,
                      width: MySize.size72,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(90),
                          image: DecorationImage(
                              image: AssetImage(AppImages.person))),
                      // child: Text(AppImages.person),
                    ),
                    SizedBox(height: MySize.size8),
                    Text(
                      'John Doe',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: isDarkMode ? AppColors.whiteFF : Color(0XFF424252),
                          // color: Theme.of(context).colorScheme.primary,
                          fontSize: MySize.size20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: MySize.size8),

                    Container(
                      height: 36,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Colors.white.withOpacity(.1)
                            : Color(0XFFF1F1FF),
                        border: Border(
                          top: BorderSide(
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Color(0xFFCFCFFC).withOpacity(.15)
                                  : Color(0xFFCFCFFC).withOpacity(.15)),

                          left: BorderSide(
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Color(0xFFCFCFFC).withOpacity(.15)
                                  : Color(0xFFCFCFFC).withOpacity(.15)),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Change',
                          style: TextStyle(
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Colors.white
                                  : Color(0XFF424252),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    SizedBox(height: MySize.size30),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Account',
                          style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.size8),

                    /// Account Container
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: MySize.size20, vertical: MySize.size16),
                      width: MySize.scaleFactorWidth * 338,
                      height: 390,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
                        // border: Border.all(width: MySize.size2, color: AppColors.whiteFc.withOpacity(0.10)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            // height: 185,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: titleText.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => screens[index]));
                                  },
                                  child: ListTile(
                                    dense: true,
                                    leading: Image(image: leadingAccImage[index]),
                                    title: Text(
                                      titleText[index],
                                      style: TextStyle(
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    trailing: SizedBox(
                                      width: 132,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                trailText[index],
                                                style: const TextStyle(
                                                  color: Color(0XFFA2A2B5),
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(AppImages.arrowLeft),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: ListView.builder(
                                  // itemCount: titleText2.length,
                                  itemCount: _switchValues.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      dense: true,
                                      leading: Image(
                                        image: leadingImage[index],
                                      ),
                                      title: Text(
                                        titleText2[index],
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      trailing: SizedBox(
                                          width: 60,
                                          child: Switch(
                                            value: _switchValues[index],
                                            onChanged: (bool newvalue) {
                                              setState(() {
                                                _switchValues[index] = newvalue;
                                              });
                                            },
                                            activeTrackColor: const Color(0XFF758AFF),
                                            autofocus: true,
                                            thumbColor:
                                                MaterialStateProperty.all(
                                                    Provider.of<ThemeChanger>(context).themeData == darkMode
                                                        ? Colors.white
                                                        : Colors.white),
                                            inactiveTrackColor:
                                                const Color(0XFF4E4E61),
                                            trackOutlineColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0x00000000)),
                                          )),
                                    );
                                  },
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 18, bottom: 10),
                                child: ShowDialogBox(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.size28),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Appearance',
                          style: TextStyle(
                              // color: AppColors.whiteFF,
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.size8),

                    /// Appearance Container
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: MySize.size20, vertical: MySize.size16),
                      height: MySize.scaleFactorHeight * 64,
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        // color: AppColors.grey61.withOpacity(.20),
                        // color: Theme.of(context).colorScheme.secondary,
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
                        // border: Border.all(width: MySize.size2, color: AppColors.whiteFc.withOpacity(0.10)),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Image.asset(AppImages.darkmode),
                          const SizedBox(
                            width: 18,
                          ),
                          const Text(
                            'Light/Dark Mode',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              // color:  Theme.of(context).colorScheme.primary
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            // value: isDarkMode,
                            value: themeChanger.themeData == darkMode,
                            onChanged: (bool newValue) {
                              // themeChanger.toggleTheme();
                              Provider.of<ThemeChanger>(context, listen: false)
                                  .toggleTheme();
                            },
                            activeTrackColor: Color(0XFF758AFF),
                            // focusColor: Colors.pink,
                            autofocus: true,
                            // inactiveThumbColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.blue : Colors.green,
                            thumbColor: MaterialStateProperty.all(
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? Colors.white
                                    : Colors.white),
                            inactiveTrackColor: Color(0XFF4E4E61),
                            trackOutlineColor: const MaterialStatePropertyAll(
                                Color(0x00000000)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.size36),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'My Subscription Plan',
                          style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.size8,
                    ),

                    /// Subscription plans
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 14, vertical: MySize.size20),
                      // height: MySize.scaleFactorHeight * 170,
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        // color: AppColors.grey61.withOpacity(.20),
                        // color: Theme.of(context).colorScheme.secondary,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10),
                              width: 2),
                          // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10),
                              width: 2),
                        ),
                        // border: Border.all(
                        //   width: MySize.size2,
                        //   color: AppColors.whiteFc.withOpacity(0.10),
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ManagePlan()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(AppImages.plan),
                                  text: 'Manage Plan',
                                  text2: 'Plan',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MySize.size16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(AppImages.payment),
                                  text: 'Manage Payment',
                                  text2: 'Cards',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MySize.size16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CancelSubscription()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Stack(
                                    children: [
                                      Positioned(
                                        child: Image.asset(
                                          AppImages.crossIcon,
                                          scale: 3,
                                          color: Colors.red,
                                        ),
                                        left: 8,
                                      ),
                                      Image.asset(AppImages.payment),
                                    ],
                                  ),
                                  text: 'Cancel Subscription',
                                  text2: 'Cancel',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.size36,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size32),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Help & Support',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: MySize.size8,
                    ),

                    /// Help and support container
                    Container(
                      // padding: EdgeInsets.symmetric( horizontal: MySize.size20, vertical: MySize.size24),
                      height: MySize.scaleFactorHeight * 190,
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        // color: AppColors.grey61.withOpacity(.20),
                        // color: Theme.of(context).colorScheme.secondary,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
                        // border: Border.all(
                        //   width: MySize.size2,
                        //   color: AppColors.whiteFc.withOpacity(0.10),
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FaqsScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(AppImages.faqs),
                                  text: 'FAQs',
                                  text2: 'FAQ',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MySize.size16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ContactSupport()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(AppImages.contsupport),
                                  text: 'Contact Support',
                                  text2: 'Support',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MySize.size16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TermsOfServices()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(AppImages.terms),
                                  text: 'Terms & Services',
                                  text2: 'Legal',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MySize.size16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrivPolicy()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(AppImages.privpolicy),
                                  text: 'Privacy Policy',
                                  text2: 'Legal',
                                  text2Color: Color(0XFFA2A2B5),
                                  icon: Image.asset(AppImages.arrowLeft),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.size30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<ProfileProvider>(context, listen: false)
                            .cleanLocalData(context: context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MySize.size20, vertical: MySize.size16),
                        height: MySize.scaleFactorHeight * 64,
                        width: MySize.scaleFactorWidth * 328,
                        decoration: BoxDecoration(
                          // color: AppColors.grey61.withOpacity(.20),
                          // color: Theme.of(context).colorScheme.secondary,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Color(0XFF4E4E61).withOpacity(.2)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border(
                            top: BorderSide(
                                color: AppColors.whiteFc.withOpacity(0.10)),
                            // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                            left: BorderSide(
                                color: AppColors.whiteFc.withOpacity(0.10)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: MySize.size14,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? Colors.white
                                    : Colors.red,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              AppImages.logout,
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Colors.white
                                  : Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.size20, vertical: MySize.size16),
                      height: MySize.scaleFactorHeight * 64,
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        // color: AppColors.grey61.withOpacity(.20),
                        // color: Theme.of(context).colorScheme.secondary,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified_sharp,
                            color: Color(0XFFA2A2B5),
                            size: 22,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          TextWidgetInterRegular(
                            title: 'Current Version ',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          Spacer(),
                          Text(
                            '2.0.24 ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFFA2A2B5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                    // BNavBar()
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
