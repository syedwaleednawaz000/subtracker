import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sub_tracker/Provider/change_password_provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/validation.dart';
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    var height = MediaQuery.of(context).size.height -56;
    return SafeArea(

      child: Scaffold(
        appBar:  const CustomAppBarInAll(leading: false,title: "Personal Data"),
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
        Colors.black
            : const Color(0XFFFFFFFF),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
               SizedBox(
                height:  MySize.size40,
              ),
              Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                final profileImageUrl = profileProvider.userData['data']['profile_image'];
                return  SizedBox(
                  width: 72,
                  child: ClipOval(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: MySize.scaleFactorWidth*155),
                      height: MySize.size72,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                       shape: BoxShape.circle,
                      ),
                      child: profileProvider.updatePic == null
                          ? profileImageUrl != null && profileImageUrl.isNotEmpty
                          ? CachedNetworkImage(
                        imageUrl: profileImageUrl,
                        imageBuilder: (context, imageProvider) =>
                          Container(
                          height: MySize.size72,
                          width: MySize.size72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
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
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppImages.person),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                          : Container(
                        height: MySize.size72,
                        width: MySize.size72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          AppImages.person,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Container(
                        height: MySize.size72,
                        width: MySize.size72,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        child: Image.file(
                          File(profileProvider.updatePic!.path.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );

              },),
              SizedBox(
                height: MySize.size8,
              ),
              Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                return  TextWidgetInterBold(
                  align: TextAlign.center,
                  title: profileProvider.userData['data']['name'],
                  fontSize: MySize.size20,
                  fontWeight: FontWeight.w700,
                  // color: AppColors.whiteFF,
                );
              },),
              SizedBox(
                height: MySize.size8,
              ),
              Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                return GestureDetector(
                  onTap: (){
                    profileProvider.picPicture();
                  },
                  child: Container(
                    height:  MySize.size36,
                    margin: EdgeInsets.symmetric(horizontal: MySize.scaleFactorWidth*155),
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
                      child: Text( AppLocalizations.of(context)!.change,
                        style: TextStyle(
                            color:Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Colors.white
                                : const Color(0XFF424252),
                            fontSize: 12, fontWeight: FontWeight.w600),),
                    ),
                  ),
                );
              },),
              SizedBox(height: MySize.size20,),
              Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                return      Padding(
                  padding: const EdgeInsets.only(left: 37, right: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( AppLocalizations.of(context)!.email_address,
                        style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MySize.size4,
                      ),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? Colors.white
                              : Colors.black,
                          validator: Validation.validateEmail,
                          controller: profileProvider.emailEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.only(
                              left: MySize.size20,
                              right: MySize.size20,
                            ),
                            labelText:  AppLocalizations.of(context)!.email, // Use labelText for consistency
                            labelStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                              fontSize: MySize.size12,
                              fontFamily: 'Poppins_Regular',
                            ),
                            hintText:  AppLocalizations.of(context)!.email,
                            hintStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                              fontSize: MySize.size12,
                              fontFamily: 'Poppins_Regular',
                            ),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? const Color(0XFF353542)
                                : const Color(0XFF353542).withOpacity(.1),
                          ),
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? const Color(0XFF353542)
                                : const Color(0XFF353542).withOpacity(.1),
                          ),
                        ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: MySize.size20,),
              Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                return             Padding(
                  padding: const EdgeInsets.only(left: 37, right: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( AppLocalizations.of(context)!.name,
                        style: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: MySize.size4,),
                      SizedBox(
                        height: MySize.size48,
                        child: TextFormField(
                          cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode


                              ? Colors.white
                              : Colors.black,
                          validator: Validation.validateName,
                          controller: profileProvider.nameEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(left: 20, right: 20),
                            labelText:  AppLocalizations.of(context)!.name, // Use labelText for consistency
                            labelStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                              fontSize: MySize.size12,
                              fontFamily: 'Poppins_Regular',
                            ),
                            hintText:  AppLocalizations.of(context)!.name,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintStyle: TextStyle(
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                              fontSize: MySize.size12,
                              fontFamily: 'Poppins_Regular',
                            ),
                            suffixIcon: Icon(
                              Icons.person_rounded,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
               SizedBox(height: MySize.size20,),
              Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 37, right: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( AppLocalizations.of(context)!.phone_no,
                        style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF666680) : const Color(0XFF666680),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: 'Poppins_Regular'
                        ),
                      ),
                      SizedBox(height: MySize.size4,),
                      SizedBox(
                        height: MySize.size48,
                        child: TextFormField(
                          cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? Colors.white
                              : Colors.black,
                          validator: Validation.validatePhoneNumber,
                          controller: profileProvider.phoneNumberEditingController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            isDense: false, // Avoid density adjustments
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Adjust padding
                            labelText:  AppLocalizations.of(context)!.phone_no,
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins_Regular',
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                              fontSize: MySize.size12,
                            ),
                            hintText:  AppLocalizations.of(context)!.phone_no,
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins_Regular',
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                              fontSize: MySize.size12,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: Icon(
                              Icons.phone,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFF666680)
                                  : const Color(0XFF666680).withOpacity(.4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              gapPadding:MySize.size40,
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              gapPadding: MySize.size40,
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFF353542)
                                    : const Color(0XFF353542).withOpacity(.1),
                              ),
                            ),
                          ),
                        ),
                      )
,
                    ],
                  ),
                );
              }),
              SizedBox(height: MySize.size100,),
            ],
          ),
        ),
        bottomNavigationBar: Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
          return  CustomSaveButton(
            loading: profileProvider.isUpdated,
            onTap: (){
              if(_formKey.currentState!.validate()){
                profileProvider.updateProfile(context:  context,email: profileProvider.emailEditingController.text.trim(),
                    name: profileProvider.nameEditingController.text.trim(), phone: profileProvider.phoneNumberEditingController.text.trim());
              }
            },
            titleText:  AppLocalizations.of(context)!.save,);
        },)
        ,
      ),
    );
  }
}

