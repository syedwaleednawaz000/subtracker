import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';

class UploadDocument extends StatelessWidget {
  const UploadDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionInfoProvider>(
      builder: (context, subscriptionInfoProvider, child) {
        return GestureDetector(
          onTap: () async {
            await subscriptionInfoProvider.pickFiles();
          },
          child: subscriptionInfoProvider.filePath == null
              ? DottedBorder(
                  dashPattern: const [6, 6, 6, 6],
                  color:
                      Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF4E4E61)
                          : const Color(0XFF4E4E61).withOpacity(.5),
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(MySize.size12),
                  child: SizedBox(
                    height: MySize.scaleFactorHeight * 61,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Upload documents',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
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
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: Provider.of<ThemeChanger>(context)
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
                              color: Provider.of<ThemeChanger>(context)
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
                )
              : Text(
                  textAlign: TextAlign.center,
                  'File path: ${subscriptionInfoProvider.filePath}',
                  style: TextStyle(
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
        );
      },
    );
  }
}
