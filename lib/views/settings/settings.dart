import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/notification_screen/notification_screen.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/FAQs_screen/faqs.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import 'package:sub_tracker/views/cancelsubscription/cancelsubscription.dart';
import 'package:sub_tracker/views/contactsupport/contactsupport.dart';
import 'package:sub_tracker/views/manageplan/manageplan.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
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
    AssetImage(
      AppImages.manIcon,
    ),
    AssetImage(AppImages.language),
    AssetImage(AppImages.currency),
    AssetImage(AppImages.password)
  ];
  List<AssetImage> leadingImage = [
    AssetImage(AppImages.faceID),
    AssetImage(AppImages.factor),
    AssetImage(AppImages.email)
  ];
  // List<AssetImage> plansImage = [
  //   AssetImage(AppImages.plan),
  //   AssetImage(AppImages.cancelSub),
  //   AssetImage(AppImages.calendarIcon)
  // ];
  List<String> subsTitle = [
    'Manage Plan',
    'Manage Payment',
    'Cancel Subscription'
  ];
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(
        () => Provider.of<ProfileProvider>(context, listen: false).getScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    CurrencyProvider currencyProvider = Provider.of<CurrencyProvider>(context);
    List<String> trailText = [
      'Data',
      "${languageProvider.selectedTranslation.toString()}",
      '${currencyProvider.selectedCurrency.toString()}',
      'Password',
    ];

    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Provider.of<ThemeChanger>(context).themeData == darkMode
                ?  Colors.black
                : const Color(0XFFF7F7FF),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
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
                    color: const Color(0XFFA2A2B5),
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
                           builder: (context) =>
                           const NotificationsScreen()));
                      },
                      child: Image.asset(
                        AppImages.notificationIcon,
                        height: 25,
                        width: 25,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFFA2A2B5)
                            : const Color(0XFF424252),
                    ),
                  ),
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
                    Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                      final profileImageUrl = profileProvider.userData['data']['profile_image'];
                      return  Container(
                        height: MySize.size72,
                        width: MySize.size72,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child:profileProvider.updatePic == null ?
                        profileImageUrl != null && profileImageUrl.isNotEmpty
                            ?CachedNetworkImage(
                          imageUrl: profileImageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            height: MySize.size72,
                            width: MySize.size72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MySize.size72,
                              width: MySize.size72,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: MySize.size72,
                            width: MySize.size72,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(90),
                              image: DecorationImage(
                                image: AssetImage(AppImages.person),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ):
                        Container(
                            height: MySize.size72,
                            width: MySize.size72,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(90),),
                            child: Icon(Icons.person)) :
                        Container(
                            height: MySize.size72,
                            width: MySize.size72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),),
                            child: Image.file(File(profileProvider.updatePic!.path.toString()))),
                      );
                    },),
                    SizedBox(height: MySize.size8),
                    Consumer<ProfileProvider>(
                      builder: (context, profileProvider, child) {
                        return Text(
                          '${profileProvider.userData['data'] != null ? profileProvider.userData['data']['name'] : ""}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: MySize.size20,
                              fontWeight: FontWeight.w700),
                        );
                      },
                    ),
                    SizedBox(height: MySize.size8),
                    GestureDetector(
                      onTap: (){
                        Provider.of<ProfileProvider>(context,listen: false).picPicture();
                      },
                      child: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Colors.white.withOpacity(.1)
                              : const Color(0XFFF1F1FF),
                          border: Border(
                            top: BorderSide(
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0xFFCFCFFC).withOpacity(.15)
                                    : const Color(0xFFCFCFFC).withOpacity(.15)),
                            left: BorderSide(
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0xFFCFCFFC).withOpacity(.15)
                                    : const Color(0xFFCFCFFC).withOpacity(.15)),
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
                                    : const Color(0XFF424252),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
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
                      width: MySize.scaleFactorWidth * 338,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
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
                                return Consumer<ProfileProvider>(
                                  builder: (context, profileProvider, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (index == 0) {
                                          if (profileProvider
                                                  .userData['data'] !=
                                              null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>profileProvider.screens[index]));
                                          } else {
                                            FlutterToast.toastMessage(
                                                message:
                                                    "User data not found please try again",
                                                isError: true);
                                          }
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      profileProvider
                                                          .screens[index]));
                                        }
                                      },
                                      child: ListTile(
                                        dense: true,
                                        leading: Image(
                                          image: leadingAccImage[index],
                                          height: MySize.size22,
                                        ),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  trailText[index],
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    color: Color(0XFFA2A2B5),
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                    AppImages.arrowLeft),
                                              ],
                                            )),
                                      ),
                                    );
                                  },
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
                                        height: MySize.size20,
                                      ),
                                      title: Text(
                                        titleText2[index],
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8, // Adjust this value to scale the switch size
                                        child: Switch(
                                          value: _switchValues[index],
                                          onChanged: (bool newValue) {
                                            setState(() {
                                              _switchValues[index] = newValue;
                                            });
                                          },
                                          activeTrackColor: const Color(0XFF758AFF),
                                          autofocus: true,
                                          thumbColor: MaterialStateProperty.all(
                                            Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? Colors.white
                                                : Colors.white,
                                          ),
                                          inactiveTrackColor: const Color(0XFF4E4E61),
                                          trackOutlineColor: const MaterialStatePropertyAll(
                                            Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 18, bottom: 10),
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
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            AppImages.darkmode,
                            height: 20,
                          ),
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
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: themeChanger.themeData == darkMode,
                              onChanged: (bool newValue) {
                                // themeChanger.toggleTheme();
                                Provider.of<ThemeChanger>(context, listen: false)
                                    .toggleTheme();
                              },
                              activeTrackColor: const Color(0XFF758AFF),
                              // focusColor: Colors.pink,
                              autofocus: true,
                              // inactiveThumbColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.blue : AppColors.purpleFF,
                              thumbColor: MaterialStateProperty.all(
                                  Provider.of<ThemeChanger>(context).themeData ==
                                          darkMode
                                      ? Colors.white
                                      : Colors.white),
                              inactiveTrackColor: const Color(0XFF4E4E61),
                              trackOutlineColor: const MaterialStatePropertyAll(
                                  Color(0x00000000)),
                            ),
                          ),
                          const SizedBox(
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
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                            color: AppColors.whiteFc.withOpacity(0.10),
                            width: 2,
                          ),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10),
                              width: 2),
                        ),
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
                                        builder: (context) =>
                                            const ManagePlan()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(
                                    AppImages.plan,
                                    height: 20,
                                  ),
                                  text: 'Manage Plan',
                                  text2: 'Plan',
                                  text2Color: const Color(0XFFA2A2B5),
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
                                            const PaymentScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(
                                    AppImages.payment,
                                    height: 20,
                                  ),
                                  text: 'Manage Payment',
                                  text2: 'Cards',
                                  text2Color: const Color(0XFFA2A2B5),
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
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  type: "cancel",
                                  imageIcon: Image.asset(
                                    AppImages.cancelSub,
                                    height: 20,
                                  ),
                                  text: 'Cancel Subscription',
                                  text2: 'Cancel',
                                  text2Color: const Color(0XFFA2A2B5),
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
                      child: const Align(
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
                      height: MySize.scaleFactorHeight * 190,
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
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
                                        builder: (context) =>
                                            const FaqsScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(
                                    AppImages.faqs,
                                    height: 20,
                                  ),
                                  text: 'FAQs',
                                  text2: 'FAQ',
                                  text2Color: const Color(0XFFA2A2B5),
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
                                            const ContactSupport()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(
                                    AppImages.contsupport,
                                    height: 20,
                                  ),
                                  text: 'Contact Support',
                                  text2: 'Support',
                                  text2Color: const Color(0XFFA2A2B5),
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
                                            const TermsOfServices()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(
                                    AppImages.terms,
                                    height: 20,
                                  ),
                                  text: 'Terms & Services',
                                  text2: 'Legal',
                                  text2Color: const Color(0XFFA2A2B5),
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
                                            const PrivPolicy()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SettingRowList(
                                  imageIcon: Image.asset(
                                    AppImages.privpolicy,
                                    height: 20,
                                  ),
                                  text: 'Privacy Policy',
                                  text2: 'Legal',
                                  text2Color: const Color(0XFFA2A2B5),
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
                        margin: EdgeInsets.symmetric(
                            horizontal: MySize.size24, ),
                        padding: EdgeInsets.symmetric(
                          horizontal: MySize.size20, ),
                        height: MySize.scaleFactorHeight * 64,
                        // width: MySize.scaleFactorWidth * 328,
                        decoration: BoxDecoration(
                          // color: AppColors.grey61.withOpacity(.20),
                          // color: Theme.of(context).colorScheme.secondary,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? const Color(0XFF4E4E61).withOpacity(.2)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border(
                            top: BorderSide(
                                color: AppColors.whiteFc.withOpacity(0.10)),
                            left: BorderSide(
                                color: AppColors.whiteFc.withOpacity(0.10)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Image.asset(AppImages.arrowLeft),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.size20, vertical: MySize.size16),
                      height: MySize.scaleFactorHeight * 64,
                      width: MySize.scaleFactorWidth * 328,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFF4E4E61).withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                          left: BorderSide(
                              color: AppColors.whiteFc.withOpacity(0.10)),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.verified_sharp,
                            color: Color(0XFFA2A2B5),
                            size: 22,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          TextWidgetInterRegular(
                            title: 'Current Version ',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          const Spacer(),
                          const Text(
                            '2.0.24 ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFFA2A2B5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
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
