import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'dart:io' as io;

class DialogBoxWidget extends StatefulWidget {
  DialogBoxWidget({super.key});

  @override
  State<DialogBoxWidget> createState() => _DialogBoxWidgetState();
}

class _DialogBoxWidgetState extends State<DialogBoxWidget> {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController providerNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? _pickCategoryImage;
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
  Future<void> pickCategoryImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickCategoryImage = image;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : Colors.black,
      title: Center(
        child: Text(
          AppLocalizations.of(context)!.create_new_category,
          style: TextStyle(
            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
            fontSize: MySize.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MySize.scaleFactorWidth*115,
                    child: Center(child: Text(AppLocalizations.of(context)!.category,
                    style:TextStyle(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                    )
                    ),),
                  ),
                  SizedBox(width: MySize.size5,),
                  SizedBox(
                    width: 103,
                    child: Center(child: Text(AppLocalizations.of(context)!.provider,
                    style: TextStyle(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                    ),
                    ),),
                  ),
                ],
              ),
              SizedBox(height: MySize.size10,),
              Row(
                children: [
                  SizedBox(
                    width: MySize.scaleFactorWidth*115,
                    child: GestureDetector(
                      onTap: pickCategoryImage,
                      child: SizedBox(
                        child: DottedBorder(
                          dashPattern: const [6, 6, 6, 6],
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF4E4E61) : const Color(0XFF4E4E61).withOpacity(.5),
                          strokeWidth: 1,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(MySize.size12),
                          child: SizedBox(
                            height: MySize.scaleFactorHeight * 70,
                            width: MySize.size120, // Adjust width as needed
                            child: _pickCategoryImage == null
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
                              io.File(_pickCategoryImage!.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MySize.size15,),
                  SizedBox(
                    width: 103,
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
                            io.File(_pickProviderImage!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MySize.size20),
              TextFormField(
                cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                style: TextStyle(
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                ),
                controller: categoryNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_category_name;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MySize.size20),
                    borderSide: BorderSide(color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : AppColors.grey20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MySize.size20),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white, // Color for unselected border
                    ),
                  ),
                  labelText: AppLocalizations.of(context)!.category,
                  hintText: AppLocalizations.of(context)!.enter_category,
                  hintStyle: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.grey : Colors.grey,
                    fontFamily: 'Inter-Medium',
                  ),
                  labelStyle: TextStyle(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MySize.size20),
              TextFormField(
                cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                style: TextStyle(
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                ),
                controller: providerNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_provider_name;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MySize.size20),
                    borderSide: BorderSide(color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : AppColors.grey20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MySize.size20),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white, // Color for unselected border
                    ),
                  ),
                  labelText:AppLocalizations.of(context)!.add_provider,
                  hintText:AppLocalizations.of(context)!.enter_add_provider,
                  hintStyle: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.grey : Colors.grey,
                    fontFamily: 'Inter-Medium',
                  ),
                  labelStyle: TextStyle(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MySize.size20),
              TextFormField(
                cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                style: TextStyle(
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_price;
                  }
                  return null;
                },
                controller: priceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MySize.size20),
                    borderSide: BorderSide(color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : AppColors.grey20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MySize.size20),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white, // Color for unselected border
                    ),
                  ),
                  labelText: AppLocalizations.of(context)!.enter_price,
                  hintText: AppLocalizations.of(context)!.enter_price,
                  hintStyle: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.grey : Colors.grey,
                    fontFamily: 'Inter-Medium',
                  ),
                  labelStyle: TextStyle(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.redAccent : Colors.redAccent,
                  fontSize: MySize.size15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Consumer<SpendingBudgetProvider>(
              builder: (context, spendingBudgetProvider, child) {
                return TextButton(
                  child: spendingBudgetProvider.isAddCategoryLoading ? Center(child: SizedBox(
                      height: MySize.size20,
                      width: MySize.size20,
                      child: CircularProgressIndicator(color: AppColors.purpleFF,)),): Text(
                    AppLocalizations.of(context)!.add_add,
                    style: TextStyle(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.lightBlue : Colors.lightBlue,
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    if(_pickCategoryImage != null){
                      if(_pickProviderImage != null){
                        if (_formKey.currentState!.validate()) {
                          spendingBudgetProvider.addUserCategory(
                              context: context,
                              categoryName: categoryNameController.text.trim(),
                              price: priceController.text.trim(),
                              providerName: providerNameController.text.trim(),
                              categoryImage: _pickCategoryImage,
                              providerImage: _pickProviderImage
                          );
                        }
                      }else{
                        FlutterToast.toastMessage(message:AppLocalizations.of(context)!.please_upload_provider_image, isError: true);
                      }
                    }else{
                      FlutterToast.toastMessage(message: AppLocalizations.of(context)!.please_upload_category_image, isError: true);
                    }
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }
}
