import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/my_size.dart';
import '../theme/theme.dart';
import '../views/base/text_widgets.dart';
import '../views/language_selection/base/custom_appBar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: MySize.size25),
          child:  CustomAppBar(
            onTap: (){
              Navigator.pop(context);
            },
            text: 'Notifications',
            icon: Icons.arrow_back_rounded,
          ),
        ),
      ),
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Color(0XFF1C1C23)
          : Color(0XFFF7F7FF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 48, top: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Notifications(4)',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MySize.size16,
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Colors.white
                            : Color(0XFF424252),
                    fontFamily: 'Poppins_Regular'),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 28,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Payment Alert',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? Colors.white
                                    : Color(0XFF424252),
                                fontFamily: 'Poppins_Regular'),
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet consectetur. Turpis diam quis odio ipsum in.',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MySize.size12,
                                color: Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                    ? Colors.white
                                    : Color(0XFF424252),
                                fontFamily: 'Poppins_Regular'),),
                          leading: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                    ? Colors.white.withOpacity(.1)
                                    : Color(0XFFC1C1FF).withOpacity(.2),
                              shape: BoxShape.circle
                            ),
                            child: Image.asset(
                              'assets/icons/notif.png',
                              height: 48,
                              width: 48,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Colors.white
                                  : Color(0XFF424252),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 8),
                          child: Divider(
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Color(0xFFD0D3FF).withOpacity(.2)
                                : Color(0xFFD0D3FF).withOpacity(.2),
                            indent: 40,
                            endIndent: 80,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )

          ///   ////////////////////////////////////////////////////////
          // ListView.separated(
          //   shrinkWrap: true,
          //   itemCount: 4,
          //   separatorBuilder: (BuildContext context, int index) => const Divider(indent: 30, endIndent: 40,),
          //   itemBuilder: (BuildContext context, int index) {
          //     return Align(
          //       alignment: Alignment.centerLeft,
          //       child: ListTile(
          //         title:  Text( 'Payment Alert',
          //             style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.white,
          //                 fontFamily: 'Poppins_Regular'
          //             )),
          //         subtitle: Text( 'Lorem ipsum dolor sit amet consectetur. Turpis diam quis odio ipsum in.',
          //           style: TextStyle(
          //               fontSize: 12,
          //               color: Colors.white.withOpacity(.7),
          //               fontFamily: 'Poppins_Regular'
          //           ),
          //         ),
          //         leading: Image.asset('assets/icons/notif.png',height: 42, width: 42,),
          //       ),
          //     );
          //   },
          // )

          // Container(
          //   height: 44, width: 331,
          //   decoration: BoxDecoration(
          //     boxShadow: [BoxShadow(
          //         color: Colors.grey.withOpacity(.15),
          //         spreadRadius: 0,
          //         blurRadius: 2
          //     )],
          //     borderRadius: BorderRadius.all(Radius.circular(8),
          //     ),
          //     color: Color(0XFF272730),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: TextWidgetInterBold(title: 'Lorem ipsum dolor sit ?', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          //           ),
          //           Spacer(),
          //           Icon(Icons.expand_more, size: 35, color: Colors.white)
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 15,),
          // RichText(text: const TextSpan(
          //     children: [
          //       TextSpan(
          //         text:
          //         'Lorem ipsum dolor sit amet consectetur. Auctor urna et at faucibus cras. Consectetur sed lorem aliquet '
          //             'adipiscing sit in porttitor viverra. Erat maecenas euismod a dictum. Interdum massa senectus ultricies '
          //             'malesuada scelerisque sed \n\n\nDiam quam dignissim dignissim tellus tellus eu sed a. Et nec suspendisse ante sed'
          //             ' odio sit mauris nec sit. Adipiscing ipsum lacus in penatibus tortor faucibus nisl diam. ',
          //         style: TextStyle(fontSize: 12, fontWeight:FontWeight.w400,color: Colors.white),
          //       ),
          //       TextSpan(
          //         text: 'Aenean non ut malesuada',
          //         style: TextStyle(fontSize: 12, fontWeight:FontWeight.w700, color: Colors.white),
          //       ),
          //       TextSpan(
          //         text: ' gravida vel integer suspendisse arcu velit. Facilisis vel lectus a nisi. Vitae donec ipsum eu nulla '
          //             'pellentesque semper. Dapibus egestas diam mi eleifend risus nunc enim.',
          //         style: TextStyle(fontSize: 12, fontWeight:FontWeight.w400,color: Colors.white),
          //       ),
          //       TextSpan(
          //         text: ' Natoque pellentesque amet interdum ut felis. Vitae integer posuere',
          //         style: TextStyle(fontSize: 12, fontWeight:FontWeight.w700, color: Colors.white),
          //       ),
          //       TextSpan(
          //         text: ' euismod ut amet. Diam amet egestas pretium a ultrices auctor cras scelerisque. In porttitor sed',
          //         style: TextStyle(fontSize: 12, fontWeight:FontWeight.w400, color: Colors.white),
          //       ),
          //     ]
          // )),
          //
          // const SizedBox(height: 15,),
          // Container(
          //   height: 44, width: 331,
          //   decoration: BoxDecoration(
          //     boxShadow: [BoxShadow(
          //         color: Colors.grey.withOpacity(.15),
          //         spreadRadius: 0,
          //         blurRadius: 2
          //     )],
          //     borderRadius: BorderRadius.all(Radius.circular(8),
          //     ),
          //     color: Color(0XFF272730),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: TextWidgetInterBold(title: 'Lorem ipsum dolor sit ?', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          //           ),
          //           Spacer(),
          //           Icon(Icons.expand_more, size: 35, color: Colors.white)
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 15,),
          // Container(
          //   height: 44, width: 331,
          //   decoration: BoxDecoration(
          //     boxShadow: [BoxShadow(
          //         color:Colors.grey.withOpacity(.15),
          //         spreadRadius: 0,
          //         blurRadius: 2
          //     )],
          //     borderRadius: BorderRadius.all(Radius.circular(8),
          //     ),
          //     color: Color(0XFF272730),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: TextWidgetInterBold(title: 'Lorem ipsum dolor sit ?', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          //           ),
          //           Spacer(),
          //           Icon(Icons.expand_more, size: 35, color: Colors.white)
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
