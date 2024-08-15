import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/contact_with_support_provider.dart';
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
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? const Color(0XFF1C1C23)
            : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: MySize.size25),
            child: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading:GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppImages.backArrow,color: const Color(0XFFA2A2B5),)),
              title:  Text('Support',style: TextStyle(color: const Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding:  EdgeInsets.only(left: 38,right:MySize.size8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: MySize.size20,),
                Text('Generate Ticket',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFFEEEEEE)
                          : const Color(0XFF333339),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                Text('Issue',
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFFEEEEEE)
                          : const Color(0XFF424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
        Consumer<ContactWithSupportProvider>(
          builder: (context, issuesProvider, child) {
            if (issuesProvider.isLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,));
            } else if (issuesProvider.issues.isEmpty) {
              return const Center(child: Text('No issues found'));
            } else {
              return DropdownMenu(

                onSelected: (value) {
                  Provider.of<ContactWithSupportProvider>(context,listen: false).getIssueId(issueID: value.toString());
                },
                hintText: "Select Issue",

                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? const Color(0XFFFFFFFF)
                      : const Color(0XFFD2D2D2),
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
                            ? const Color(0XFF757784)
                            : const Color(0XFFE2E2E2),),
                      borderRadius: const BorderRadius.all(Radius.circular(4))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF757784)
                          : const Color(0XFFE2E2E2),
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
                Text( 'Subject',
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFFEEEEEE)
                          : const Color(0XFF424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                 FormFieldComponent(
                   controller: subjectController,
                   validator: (value){},
                  maxLines: null,
                  hintText: 'Enter Subject',

                ),
                SizedBox(height: MySize.size14,),
                Text('Description',
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFFEEEEEE)
                          : const Color(0XFF424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                FormFieldComponent(
                  controller: descriptionController,
                  validator: (value){},
                  hintText: 'Enter Description',
                  height: MySize.scaleFactorHeight* 210,
                  maxLines:7,
                ),
              ],
            ),
          ),

            const Spacer(),
      Container(
        height: 114,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF353542).withOpacity(0.50)
                : const Color(0XFFF1F1FF).withOpacity(.50),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ContactWithSupportProvider>(builder: (context, contactWithSupportProvider, child) {
              return GestureDetector(
                onTap: () {
                  contactWithSupportProvider.sendSupportRequest( subject: subjectController.text.trim(), description: descriptionController.text.trim());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Settings()));
                },
                child: Container(
                    height: 48,
                    width: 288,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFFF1F1FF).withOpacity(.15)
                          : const Color(0XFFF1F1FF),

                    ),
                    child: Center(
                      child: contactWithSupportProvider.isSendLoading ? const CircularProgressIndicator(color: AppColors.purpleFF,):  Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                          Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                              ? const Color(0XFFFFFFFF)
                              : const Color(0XFF1c1c23),
                        ),
                      ),
                    )),
              );
            },)
          ],
        ),
      )
          ],
        ),
      ),
    );
  }
}
