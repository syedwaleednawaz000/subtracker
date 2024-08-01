import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sub_tracker/Provider/change_password_provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/views/change_password/change_password.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/savebutton.dart';
import '../base/text_widgets.dart';
import '../settings/settings.dart';

class PersonalData extends StatefulWidget {

   const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<ProfileProvider>(context, listen: false).updateTextFieldData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF1C1C23) : const Color(0XFFF7F7FF),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MySize.size23,
                vertical: MySize.size32,
              ),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset(AppImages.backArrow, height: 20,)),
                  SizedBox(
                    width: MySize.scaleFactorWidth * 110,
                  ),
                  Text('Personal Data',
                    style: TextStyle(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFFA2A2B5) : const Color(0XFFA2A2B5),
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
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
                            borderRadius: BorderRadius.circular(90),),
                    child: Image.asset(AppImages.person)) :
                Container(
                    height: MySize.size72,
                    width: MySize.size72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),),
                    child: Image.file(File(profileProvider.updatePic!.path.toString()))),
              );
            },),
            SizedBox(
              height: MySize.size8,
            ),
            TextWidgetInterBold(
              align: TextAlign.center,
              title: 'John Doe',
              fontSize: MySize.size20,
              fontWeight: FontWeight.w700,
              // color: AppColors.whiteFF,
            ),
            SizedBox(
              height: MySize.size8,
            ),

            Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
              return GestureDetector(
                onTap: (){
                  profileProvider.picPicture();
                },
                child: Container(
                  height: 36, width: 70,

                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(16),
                    color:   Provider.of<ThemeChanger>(context).themeData ==
                        darkMode ? Colors.white.withOpacity(.1) : const Color(0XFFF1F1FF),
                    border: Border(
                      top: BorderSide( color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0xFFCFCFFC).withOpacity(.15)
                          : const Color(0xFFCFCFFC).withOpacity(.15)),

                      left: BorderSide( color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0xFFCFCFFC).withOpacity(.15)
                          : const Color(0xFFCFCFFC).withOpacity(.15)),
                    ),
                  ),
                  child: Center(
                    child: Text('Change',
                      style: TextStyle(
                          color:   Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : const Color(0XFF424252),
                          fontSize: 12, fontWeight: FontWeight.w600),),
                  ),
                ),
              );
            },),

            SizedBox(
              height: MySize.size19,
            ),
        Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
          return      Padding(
            padding: const EdgeInsets.only(left: 37, right: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('E-mail address',
                  style: TextStyle(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MySize.size4,
                ),
                TextFormField(
                  controller: profileProvider.emailEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(
                      left: MySize.size20,
                      right: MySize.size20,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680).withOpacity(.4),
                        fontSize: MySize.size12,
                        fontFamily: 'Poppins_Regular'
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680).withOpacity(.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                        )
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
            const SizedBox(
              height: 24,
            ),
            Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
              return             Padding(
                padding: const EdgeInsets.only(left: 37, right: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',
                      style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: profileProvider.nameEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680).withOpacity(.4),
                            fontSize: MySize.size12,
                            fontFamily: 'Poppins_Regular'
                        ),
                        suffixIcon: Icon(
                          Icons.person_rounded,
                          // color: Color(0XFF666680),
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680).withOpacity(.4),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
              return             Padding(
                padding: const EdgeInsets.only(left: 37, right: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone No.',
                      style: TextStyle(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'Poppins_Regular'
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: profileProvider.phoneNumberEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Phone No.',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins_Regular',
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680).withOpacity(.4),
                          fontSize: MySize.size12,
                        ),
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680).withOpacity(.4),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF353542) : const Color(0XFF353542).withOpacity(.1),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const Spacer(),
            Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
              return             CustomSaveButton(
                loading: profileProvider.isUpdated,
                onTap: (){
                  profileProvider.updateProfile(email: profileProvider.emailEditingController.text.trim(),
                      name: profileProvider.nameEditingController.text.trim(), phone: profileProvider.phoneNumberEditingController.text.trim());
                },
                titleText: 'Update',);
            },)
          ],
        ),
      ),
    );
  }
}

class CustomSaveButton extends StatelessWidget {
   CustomSaveButton({
    super.key,
   required this.titleText,
    this.onTap,
     this.loading,
  });

   final String titleText ;
  void Function()? onTap;
  bool? loading ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          color: Provider.of<ThemeChanger>(context).themeData == darkMode
              ? const Color(0XFF353542).withOpacity(.7)
              : const Color(0XFFF1F1FF).withOpacity(.86),

          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: AppColors.black00.withOpacity(.25)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                height: 48,
                width: 288,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  border: Border(
                    top: BorderSide( color: AppColors.whiteFc.withOpacity(0.10)),
                    // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                    left: BorderSide( color: AppColors.whiteFc.withOpacity(0.10)),
                  ),
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? const Color(0XFFFFFFFF).withOpacity(.1)
                        : const Color(0XFFF1F1FF),
                    ),
                child: Center(
                  child: loading == true ? const CircularProgressIndicator(color: Colors.green,): Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color:
                      Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? Colors.white
                          : const Color(0XFF1c1c23),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
