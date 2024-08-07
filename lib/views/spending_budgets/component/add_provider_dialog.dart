import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
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
      title: const Center(child: Text('Add Provider')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MySize.size110,
            child: GestureDetector(
              onTap: pickProviderImage,
              child: DottedBorder(
                dashPattern: const [6, 6, 6, 6],
                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF4E4E61) : const Color(0XFF4E4E61).withOpacity(.5),
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: Radius.circular(MySize.size12),
                child: SizedBox(
                  height: MySize.scaleFactorHeight * 70,
                  width: MySize.size120, // Adjust width as needed
                  child: _pickProviderImage == null
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add  Image',
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
          const Text('Provider name:'),
          const SizedBox(height: 10,),
          SizedBox(
            height: MySize.size60,width: MySize.scaleFactorWidth*260,
            child: TextFormField(
              cursorColor: Colors.black38,
              // keyboardType: const TextInputType.te,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              // ],
              controller: priceController,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: MySize.size10,horizontal: MySize.size10),
                hintText: 'Enter provider name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size16),
                  borderSide:  BorderSide(color: Provider.of<ThemeChanger>(context)
                      .themeData ==
                      darkMode
                      ? const Color(0XFFFFFFFF)
                      : Colors.black45),),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size16),
                  borderSide:  BorderSide(
                      color: Provider.of<ThemeChanger>(context)
                          .themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF)
                          : Colors.black45),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size16),
                  borderSide:  BorderSide(color: Provider.of<ThemeChanger>(context)
                      .themeData ==
                      darkMode
                      ? const Color(0XFFFFFFFF)
                      : Colors.black45),),
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
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(width: 18),
            Consumer<SpendingBudgetProvider>(builder: (context, spendingBudgetProvider, child) {
              return  TextButton(
                onPressed: () {
                  spendingBudgetProvider.addProviderInUserCategory(context: context,providerName: priceController.text.trim(),categoryID: widget.categoryId,providerImage: _pickProviderImage);
                },
                child:spendingBudgetProvider.isAddProviderInUserCategoryLoading ? SizedBox(
                    height: MySize.size20,
                    width: MySize.size20,
                    child: const CircularProgressIndicator(color: AppColors.purpleFF,)) :const Text('Add', style: TextStyle(color: Colors.blue)),
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
