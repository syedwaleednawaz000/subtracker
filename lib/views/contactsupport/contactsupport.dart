import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/contact_with_support_provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../settings/settings.dart';
import 'base/formfieldcomponent.dart';


class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<ContactWithSupportProvider>(context,listen: false).getTicketIssuesTypes());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
        Colors.black
            : const Color(0XFFFFFFFF),
        appBar:  CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.support),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding:  EdgeInsets.only(left: 38,right:MySize.size8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: MySize.size20,),
                Text( AppLocalizations.of(context)!.generate_ticket,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0xffEEEEEE)
                          : const Color(0xff333339),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                Text( AppLocalizations.of(context)!.issue,
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0xffEEEEEE)
                          : const Color(0xff424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
        Consumer<ContactWithSupportProvider>(
          builder: (context, issuesProvider, child) {
            if (issuesProvider.isLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,));
            } else if (issuesProvider.issues.isEmpty) {
              return  Center(child: Text( AppLocalizations.of(context)!.no_issues_found));
            } else {
              return DropdownMenu(

                onSelected: (value) {
                  Provider.of<ContactWithSupportProvider>(context,listen: false).getIssueId(issueID: value.toString());
                },
                hintText:  AppLocalizations.of(context)!.select_issue,

                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? const Color(0xffFFFFFF)
                      : const Color(0xffD2D2D2),
                ),
                width: MySize.scaleFactorWidth * 310,
                inputDecorationTheme: InputDecorationTheme(
                  constraints: const BoxConstraints(
                      maxWidth: 330,
                      maxHeight: 50
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0xff757784)
                            : const Color(0xffE2E2E2),),
                      borderRadius: const BorderRadius.all(Radius.circular(4))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0xff757784)
                          : const Color(0xffE2E2E2),
                    ),
                  ),
                  isDense: true,
                ),
                dropdownMenuEntries: issuesProvider.issues.map((issue) {
                  return DropdownMenuEntry(
                    value: issue['id'],
                    label: issue['title'],
                  );
                }).toList(),
                trailingIcon: const Icon(Icons.expand_more),
              );
            }
          },
        ),

                SizedBox(height: MySize.size14,),
                Text(  AppLocalizations.of(context)!.subject,
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0xffEEEEEE)
                          : const Color(0xff424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                 FormFieldComponent(
                   controller: subjectController,
                   validator: (value){},
                  maxLines: null,
                  hintText:  AppLocalizations.of(context)!.enter_subject,

                ),
                SizedBox(height: MySize.size14,),
                Text( AppLocalizations.of(context)!.description,
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0xffEEEEEE)
                          : const Color(0xff424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                FormFieldComponent(
                  controller: descriptionController,
                  validator: (value){},
                  hintText:  AppLocalizations.of(context)!.enter_description,
                  height: MySize.scaleFactorHeight* 210,
                  maxLines:7,
                ),
              ],
            ),
          ),

            // const Spacer(),
      // Container(
      //   height: 114,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //       borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      //       color: Provider.of<ThemeChanger>(context).themeData == darkMode
      //           ? const Color(0XFF353542).withOpacity(0.50)
      //           : const Color(0xFFF1F1FF).withOpacity(0.50),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Consumer<ContactWithSupportProvider>(builder: (context, contactWithSupportProvider, child) {
      //         return GestureDetector(
      //           onTap: () {
      //             contactWithSupportProvider.sendSupportRequest( subject: subjectController.text.trim(), description: descriptionController.text.trim());
      //           },
      //           child: Container(
      //               height: 48,
      //               width: 288,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(40),
      //                 color: Provider.of<ThemeChanger>(context).themeData == darkMode
      //                     ? const Color(0XFF353542).withOpacity(0.50)
      //                     : const Color(0xFFF1F1FF),
      //                 border: Border(
      //                     top: BorderSide(color: Colors.white.withOpacity(.15)),
      //                     left: BorderSide(color: Colors.white.withOpacity(.15)),
      //                 ),
      //               ),
      //               child: Center(
      //                 child: contactWithSupportProvider.isSendLoading ? const CircularProgressIndicator(color: AppColors.purpleFF,):  Text(
      //                   AppLocalizations.of(context)!.submit,
      //                   style: TextStyle(
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w600,
      //                     color: Provider.of<ThemeChanger>(context).themeData ==
      //                         darkMode
      //                         ? const Color(0XFFFFFFFF)
      //                         : Colors.black,
      //                   ),
      //                 ),
      //               )),
      //         );
      //       },)
      //     ],
      //   ),
      // )
          ],
        ),
          bottomNavigationBar:           Consumer<ContactWithSupportProvider>(builder: (context, contactWithSupportProvider, child) {
            return CustomSaveButton(titleText:  AppLocalizations.of(context)!.submit,onTap: (){
                          contactWithSupportProvider.sendSupportRequest( subject: subjectController.text.trim(), description: descriptionController.text.trim());
            }
            );
          },)

      ),
    );
  }
}
