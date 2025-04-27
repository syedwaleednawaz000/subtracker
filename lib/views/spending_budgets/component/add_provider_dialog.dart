import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';

class AddProviderDialog extends StatefulWidget {
  String categoryName;
  String categoryId;
  AddProviderDialog({required this.categoryId,required this.categoryName,super.key});

  @override
  State<AddProviderDialog> createState() => _AddProviderDialogState();
}

class _AddProviderDialogState extends State<AddProviderDialog> {
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : Colors.black,
      title:  Center(child: Text(AppLocalizations.of(context)!.add_provider,
        style: TextStyle(
          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
        ),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MySize.size240,
            child: GestureDetector(
              onTap: pickProviderImage,
              child: DottedBorder(
                dashPattern: const [6, 6, 6, 6],
                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF4E4E61) : const Color(0XFF4E4E61).withOpacity(.5),
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: Radius.circular(MySize.size12),
                child: SizedBox(
                  height: MySize.scaleFactorHeight * 85,
                  width: MySize.size240,
                  child: _pickProviderImage == null
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        AppLocalizations.of(context)!.add_image,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MySize.size10,
                          fontWeight: FontWeight.w600,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFFA2A2B5) : const Color(0XFFA2A2B5),
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Container(
                        height: MySize.size16,
                        width: MySize.size16,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(MySize.size90),
                          border: Border.all(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0xFF4E4E61).withOpacity(0.4) : const Color(0xFF4E4E61).withOpacity(0.4),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFFA2A2B5) : const Color(0XFFA2A2B5),
                            size: MySize.size14,
                          ),
                        ),
                      ),
                    ],
                  )
                      : Image.file(
                    File(_pickProviderImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
           SizedBox(height: MySize.size10,),
           Text(AppLocalizations.of(context)!.provider_name,
            style: TextStyle(
              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,

            ),
          ),
           SizedBox(height: MySize.size20,),
          SizedBox(
            height: MySize.size60,width: MySize.scaleFactorWidth*260,
            child: TextFormField(
              cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
              style: TextStyle(
                fontSize: MySize.size14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
              ),
              controller: priceController,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: MySize.size10,horizontal: MySize.size10),

                labelText: AppLocalizations.of(context)!.provider_name,
                labelStyle: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                ),
                hintText: AppLocalizations.of(context)!.enter_provider_name,
                hintStyle: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,

                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size16),
                  borderSide:  BorderSide(color: Provider.of<ThemeChanger>(context)
                      .themeData ==
                      darkMode
                      ? const Color(0XFFFFFFFF)
                      : Colors.black45),),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size15),
                  borderSide: BorderSide(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white, // Color for unselected border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size15),
                  borderSide: BorderSide(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white, // Color for unselected border
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(width: 18),
            Consumer<SpendingBudgetProvider>(builder: (context, spendingBudgetProvider, child) {
              return  TextButton(
                onPressed: () {
                  if(_pickProviderImage != null){
                    spendingBudgetProvider.addProviderInUserCategory(
                        context: context,providerName: priceController.text.trim(),
                        categoryID: widget.categoryId,providerImage: _pickProviderImage);
                  }else{
                    FlutterToast.toastMessage(message: AppLocalizations.of(context)!.please_upload_image, isError: true);
                  }
                },
                child:spendingBudgetProvider.isAddProviderInUserCategoryLoading ? SizedBox(
                    height: MySize.size20,
                    width: MySize.size20,
                    child: const CircularProgressIndicator(color: AppColors.purpleFF,)) :
                     Text(AppLocalizations.of(context)!.add_add, style: TextStyle(color: Colors.blue)),
              );
            },
            ),
          ],
        ),
      ],
    );
  }
    XFile? _pickProviderImage;
  Future<void> pickProviderImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickProviderImage = image;
      });
    }
  }
}
