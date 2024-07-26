import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import '../settings/settings.dart';
import 'base/subscriptioninforow.dart';

class SubscriptionInfo extends StatefulWidget {
  const SubscriptionInfo({super.key});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {

  ///
  String _selectedOption = 'Never';

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
    Navigator.pop(context);
  }
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF0E0E12)
                : Colors.white,
        body: Stack(clipBehavior: Clip.none, children: [
          Padding(
            padding: EdgeInsets.only(
              top: MySize.size24,
              left: MySize.size24,
              right: MySize.size24,
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(children: [
                  Container(
                    height: MySize.scaleFactorHeight * 384,
                    decoration: BoxDecoration(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ? const Color(0XFF353542)
                          : const Color(0XFFF1F1FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size24),
                        topRight: Radius.circular(MySize.size24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MySize.size28,
                            vertical: MySize.size32,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.downwardArrow,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFF424252),
                              ),
                              const Spacer(),
                              Text(
                                'Subscription info',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: MySize.size16,
                                  fontWeight: FontWeight.w400,
                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0XFFA2A2B5)
                                      : const Color(0XFF424252),
                                ),
                              ),
                              const Spacer(), // Add Spacer here
                              Image.asset(
                                AppImages.trash,
                                scale: 1.2,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFF424252),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size17),
                        Container(
                          height: MySize.scaleFactorHeight * 120,
                          width: MySize.scaleFactorWidth * 120,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            // color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(MySize.size32),
                          ),
                          child: Image.asset(AppImages.tresorlyIcon),
                        ),
                        SizedBox(height: MySize.size6),
                        Text(
                          'Tresorly',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MySize.size32,
                            fontWeight: FontWeight.w700,
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? Colors.white
                                    : const Color(0XFF1C1C23),
                          ),
                        ),
                        SizedBox(height: MySize.size2),
                        Text(
                          "\$5.99",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: MySize.size20,
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                          ),
                        ),
                        SizedBox(height: MySize.scaleFactorHeight * 70),
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              direction: Axis.horizontal,
                              children: List.generate(
                                (constraints.constrainWidth() / 10).floor(),
                                (index) => SizedBox(
                                  width: 5,
                                  height: 1.5,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0XFF131318)
                                          : const Color(0XFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MySize.scaleFactorHeight * 405,
                    child: ListView(
                      children: [
                        Container(
                          height: MySize.scaleFactorHeight * 500,
                          width: MySize.scaleFactorWidth * 120,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFFF1F1FF),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(MySize.size24),
                              bottomLeft: Radius.circular(MySize.size24),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MySize.size25),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: MySize.size20,
                                  vertical: MySize.size16,
                                ),
                                height: MySize.scaleFactorHeight * 370,
                                width: MySize.scaleFactorWidth * 288,
                                decoration: BoxDecoration(
                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0XFF4E4E61).withOpacity(.2)
                                      : const Color(0XFFF7F7FF),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    width: MySize.size2,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFFCFCFFC).withOpacity(.15)
                                        : const Color(0XFFCFCFFC).withOpacity(.15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SubscriptionInfoRow(
                                      text: 'Name',
                                      text2: 'Tresorly',
                                      icon: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          AppImages.arrowLeft,
                                          width: MySize.size14,
                                          height: MySize.size14,
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? const Color(0XFFA2A2B5)
                                                  : const Color(0XFFA2A2B5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: MySize.size16),
                                    SubscriptionInfoRow(
                                      text: 'Description',
                                      text2: 'Password Manager',
                                      icon: Image.asset(
                                        AppImages.arrowLeft,
                                        width: MySize.size14,
                                        height: MySize.size14,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFFA2A2B5),
                                      ),
                                    ),
                                    SizedBox(height: MySize.size16),
                                    SubscriptionInfoRow(
                                      text: 'Category',
                                      text2: 'Security',
                                      icon: Image.asset(
                                        AppImages.arrowLeft,
                                        width: MySize.size14,
                                        height: MySize.size14,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFFA2A2B5),
                                      ),
                                    ),
                                    SizedBox(height: MySize.size16),
                                    SubscriptionInfoRow(
                                      text: 'Start Date',
                                      text2: '08.01.2022',
                                      icon: Image.asset(
                                        AppImages.arrowLeft,
                                        width: MySize.size14,
                                        height: MySize.size14,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFFA2A2B5),
                                      ),
                                    ),
                                    SizedBox(height: MySize.size16),
                                    SubscriptionInfoRow(
                                      text: 'Renewal Date',
                                      text2: '07.01.2023',
                                      icon: Image.asset(
                                        AppImages.arrowLeft,
                                        width: MySize.size14,
                                        height: MySize.size14,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFFA2A2B5),
                                      ),
                                    ),
                                    SizedBox(height: MySize.size16),
                                    Row(
                                      children: [
                                        Text(
                                          'Billing Cycle',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeChanger>(
                                                context)
                                                .themeData ==
                                                darkMode
                                                ? Colors.white
                                                : const Color(0XFF424252),
                                          ),
                                        ),
                                        const Spacer(),
                                        /// Billing cycle
                                        Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              // Container(
                                              //   width: 40,
                                              //   height: 20,
                                              //   child: DropdownButton<String>(
                                              //     value: _selectedText,
                                              //     items: _dropdownMenuItems,
                                              //     onChanged: (String? newValue) {
                                              //       setState(() {
                                              //         _selectedText = newValue!;
                                              //       });
                                              //     },
                                              //     underline: SizedBox(), // Removes the underline
                                              //     icon: SizedBox.shrink(), // Hides the dropdown icon
                                              //     selectedItemBuilder: (BuildContext context) {
                                              //       return _dropdownMenuItems.map<Widget>((DropdownMenuItem<String> item) {
                                              //         return Text(
                                              //           _selectedText,
                                              //           textAlign: TextAlign.center,
                                              //           style: TextStyle(
                                              //             fontSize: 10,
                                              //             color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              //                 ? Color(0XFFA2A2B5)
                                              //                 : Color(0XFFA2A2B5),
                                              //           ),
                                              //         );
                                              //       }).toList();
                                              //     },
                                              //   ),
                                              // ),

                                              ///
                                              GestureDetector(
                                                onTap: (){
                                                  showModalBottomSheet<void>(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                                ? const Color(0XFF353542)
                                                                : const Color(0XFFF1F1FF),
                                                          borderRadius: const BorderRadius.only(
                                                              topRight: Radius.circular(16),
                                                              topLeft: Radius.circular(16),
                                                          )
                                                        ),
                                                        height: 400,
                                                        child: Center(
                                                          child: SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: <Widget>[
                                                                const SizedBox(height: 30,),
                                                                Text('Select Billing Plan',
                                                                style: TextStyle(
                                                                  fontSize: MySize.size14,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Provider.of<ThemeChanger>(
                                                                      context)
                                                                      .themeData ==
                                                                      darkMode
                                                                      ? Colors.white
                                                                      : const Color(0XFF424252),
                                                                ),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Monthly',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Monthly'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Quarterly',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Quarterly'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Semi-Annually',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Semi-Annually'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Annually',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Annually'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Biennially',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Biennially'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Weekly',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Weekly'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Bi-Weekly',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Bi-Weekly'),
                                                                ),
                                                                ListTile(
                                                                  title: Text('Custom',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Regular-Poppins',
                                                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                                                          darkMode
                                                                          ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                          : const Color(0XFF1C1C23),
                                                                    ),
                                                                  ),
                                                                  onTap: () => _selectOption('Custom'),
                                                                ),
                                                            
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 8),
                                                  child: Text(_selectedOption,  style: TextStyle(
                                                    fontSize: MySize.size12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Provider.of<ThemeChanger>(context).themeData ==
                                                        darkMode
                                                        ? const Color(0XFFA2A2B5)
                                                        : const Color(0XFFA2A2B5),
                                                  ),),
                                                ),
                                              ),
                                              ///
                                              // GestureDetector(
                                              //    onTap: (){
                                              //      showModalBottomSheet<void>(
                                              //        context: context,
                                              //        builder: (BuildContext context) {
                                              //          return Container(
                                              //            color: Colors.blue,
                                              //            height: 400,
                                              //            child: Center(
                                              //              child: Column(
                                              //                mainAxisAlignment: MainAxisAlignment.center,
                                              //                mainAxisSize: MainAxisSize.min,
                                              //                children: <Widget>[
                                              //                  const Text('Modal BottomSheet'),
                                              //                  ElevatedButton(
                                              //                    style: ButtonStyle(
                                              //                      backgroundColor: MaterialStateProperty.all(
                                              //                        Provider.of<ThemeChanger>(context).themeData == darkMode
                                              //                            ? Colors.white
                                              //                            : Color(0XFF1C1C23)
                                              //                      ),
                                              //                    ),
                                              //                    child: const Text('Close BottomSheet'),
                                              //                    onPressed: () => Navigator.pop(context),
                                              //                  ),
                                              //                ],
                                              //              ),
                                              //            ),
                                              //          );
                                              //        },
                                              //      );
                                              //    },
                                              //   child: Text('Never'),
                                              // )
                                            ]),
                                        Image.asset(
                                          AppImages.arrowLeft,
                                          width: MySize.size14,
                                          height: MySize.size14,
                                          color:
                                          Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                              darkMode
                                              ? const Color(0XFFA2A2B5)
                                              : const Color(0XFFA2A2B5),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: MySize.size16),
                                    /// reminder
                                    Row(
                                      children: [
                                        Text(
                                          'Reminder',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.white
                                                : const Color(0XFF424252),
                                          ),
                                        ),
                                        const Spacer(),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Container(
                                              //   width: 40,
                                              //   height: 20,
                                              //   child: DropdownButton<String>(
                                              //     value: _selectedText,
                                              //     items: _dropdownMenuItems,
                                              //     onChanged: (String? newValue) {
                                              //       setState(() {
                                              //         _selectedText = newValue!;
                                              //       });
                                              //     },
                                              //     underline: SizedBox(), // Removes the underline
                                              //     icon: SizedBox.shrink(), // Hides the dropdown icon
                                              //     selectedItemBuilder: (BuildContext context) {
                                              //       return _dropdownMenuItems.map<Widget>((DropdownMenuItem<String> item) {
                                              //         return Text(
                                              //           _selectedText,
                                              //           textAlign: TextAlign.center,
                                              //           style: TextStyle(
                                              //             fontSize: 10,
                                              //             color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              //                 ? Color(0XFFA2A2B5)
                                              //                 : Color(0XFFA2A2B5),
                                              //           ),
                                              //         );
                                              //       }).toList();
                                              //     },
                                              //   ),
                                              // ),

                                              ///
                                              GestureDetector(
                                                  onTap: (){
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                              ? const Color(0XFF353542)
                                                              : const Color(0XFFF1F1FF),
                                                              borderRadius: const BorderRadius.only(
                                                                topRight: Radius.circular(16),
                                                                topLeft: Radius.circular(16),
                                                              )
                                                          ),
                                                          height: 400,
                                                          child: Center(
                                                            child: SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: <Widget>[
                                                                  const SizedBox(height: 30,),
                                                                  Text('Select Reminder ',
                                                                    style: TextStyle(
                                                                      fontSize: MySize.size14,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: Provider.of<ThemeChanger>(
                                                                          context)
                                                                          .themeData ==
                                                                          darkMode
                                                                          ? Colors.white
                                                                          : const Color(0XFF424252),
                                                                    ),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Monthly',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Monthly'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Quarterly',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Quarterly'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Semi-Annually',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Semi-Annually'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Annually',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Annually'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Biennially',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Biennially'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Weekly',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Weekly'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Bi-Weekly',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Bi-Weekly'),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text('Custom',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: 'Regular-Poppins',
                                                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                                                            darkMode
                                                                            ? const Color(0XFFFFFFFF).withOpacity(.4)
                                                                            : const Color(0XFF1C1C23),
                                                                      ),
                                                                    ),
                                                                    onTap: () => _selectOption('Custom'),
                                                                  ),


                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                child:  Padding(
                                                  padding: const EdgeInsets.only(right: 8),
                                                  child: Text(_selectedOption,  style: TextStyle(
                                                    fontSize: MySize.size12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Provider.of<ThemeChanger>(context).themeData ==
                                                        darkMode
                                                        ? const Color(0XFFA2A2B5)
                                                        : const Color(0XFFA2A2B5),
                                                  ),),


                                                )),


                                              ///
                                              // GestureDetector(
                                              //    onTap: (){
                                              //      showModalBottomSheet<void>(
                                              //        context: context,
                                              //        builder: (BuildContext context) {
                                              //          return Container(
                                              //            color: Colors.blue,
                                              //            height: 400,
                                              //            child: Center(
                                              //              child: Column(
                                              //                mainAxisAlignment: MainAxisAlignment.center,
                                              //                mainAxisSize: MainAxisSize.min,
                                              //                children: <Widget>[
                                              //                  const Text('Modal BottomSheet'),
                                              //                  ElevatedButton(
                                              //                    style: ButtonStyle(
                                              //                      backgroundColor: MaterialStateProperty.all(
                                              //                        Provider.of<ThemeChanger>(context).themeData == darkMode
                                              //                            ? Colors.white
                                              //                            : Color(0XFF1C1C23)
                                              //                      ),
                                              //                    ),
                                              //                    child: const Text('Close BottomSheet'),
                                              //                    onPressed: () => Navigator.pop(context),
                                              //                  ),
                                              //                ],
                                              //              ),
                                              //            ),
                                              //          );
                                              //        },
                                              //      );
                                              //    },
                                              //   child: Text('Never'),
                                              // )
                                            ]),
                                        Image.asset(
                                          AppImages.arrowLeft,
                                          width: MySize.size14,
                                          height: MySize.size14,
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? const Color(0XFFA2A2B5)
                                                  : const Color(0XFFA2A2B5),
                                        ),
                                      ],
                                    ),


                                    SizedBox(height: MySize.size26),
                                    DottedBorder(
                                      dashPattern: const [6, 6, 6, 6],
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0XFF4E4E61)
                                          : const Color(0XFF4E4E61).withOpacity(.5),
                                      strokeWidth: 1,
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(MySize.size12),
                                      child: SizedBox(
                                        height: MySize.scaleFactorHeight * 61,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Upload documents',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: MySize.size14,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Provider.of<ThemeChanger>(
                                                                    context)
                                                                .themeData ==
                                                            darkMode
                                                        ? const Color(0XFFA2A2B5)
                                                        : const Color(0XFFA2A2B5),
                                              ),
                                            ),
                                            SizedBox(width: MySize.size10),
                                            Container(
                                              height: MySize.size20,
                                              width: MySize.size20,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                border: Border.all(
                                                  color:
                                                      Provider.of<ThemeChanger>(
                                                                      context)
                                                                  .themeData ==
                                                              darkMode
                                                          ? const Color(0XFFA2A2B5)
                                                          : const Color(0XFFA2A2B5),
                                                  width: 2,
                                                ),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color:
                                                      Provider.of<ThemeChanger>(
                                                                      context)
                                                                  .themeData ==
                                                              darkMode
                                                          ? const Color(0XFFA2A2B5)
                                                          : const Color(0XFFA2A2B5),
                                                  size: MySize.size12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MySize.size25),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Settings(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: MySize.scaleFactorHeight * 48,
                                  width: MySize.scaleFactorWidth * 288,
                                  decoration: BoxDecoration(
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? Colors.white.withOpacity(.1)
                                        : const Color(0XFFF7F7FF),
                                    borderRadius:
                                        BorderRadius.circular(MySize.size24),
                                    border: Border.all(
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? Colors.white.withOpacity(.15)
                                          : Colors.white.withOpacity(.15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFFFFFFFF)
                                                : const Color(0XFF424252),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size20),
                      ],
                    ),
                  ),
                ]),
              ),
              //
              // StackedCircle(
              //   top: MySize.scaleFactorHeight * 425,
              //   left: 12,
              // ),
              // StackedCircle(
              //   top: MySize.scaleFactorHeight * 425,
              //   right: 12,
              // ),
            ),
          )
        ]));
  }
}

