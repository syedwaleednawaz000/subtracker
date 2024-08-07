import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
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
  TextEditingController? addCategoryController = TextEditingController();
  TextEditingController? priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? updatePic1;
  XFile? updatePic2;

  Future<void> pickPicture1() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        updatePic1 = image;
      });
    }
  }

  Future<void> pickPicture2() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        updatePic2 = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : Colors.black,
      title: Center(
        child: Text(
          'Spending & Budgets',
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
              Text(
                'Please enter new category and its price.',
                style: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0xFF000000) : Colors.grey,
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: MySize.size20),
              Row(
                children: [
                  SizedBox(
                    width: 103,
                    child: GestureDetector(
                      onTap: pickPicture1,
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
                            child: updatePic1 == null
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
                              io.File(updatePic1!.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  SizedBox(
                    width: 103,
                    child: GestureDetector(
                      onTap: pickPicture2,
                      child: DottedBorder(
                        dashPattern: const [6, 6, 6, 6],
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF4E4E61) : const Color(0XFF4E4E61).withOpacity(.5),
                        strokeWidth: 1,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(MySize.size12),
                        child: SizedBox(
                          height: MySize.scaleFactorHeight * 70,
                          width: MySize.size120, // Adjust width as needed
                          child: updatePic2 == null
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
                            io.File(updatePic2!.path),
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
                controller: addCategoryController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter category name';
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
                  labelText: 'Category',
                  hintText: 'Enter Category',
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
                controller: addCategoryController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter Add provider';
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
                  labelText: 'Add provider',
                  hintText: 'Enter Add provider',
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
                    return 'Please enter price';
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
                  labelText: 'Enter Price',
                  hintText: 'Enter Price',
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
        Consumer<CategoryProvider>(
          builder: (context, categoryProvider, child) {
            return TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.lightBlue : Colors.lightBlue,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  categoryProvider.addCategories(
                    categoryName: addCategoryController!.text.trim(),
                    // price: priceController.text.trim(),
                  ).then((value) {
                    FlutterToast.toastMessage(message: "Category added");
                  });
                  addCategoryController?.clear();
                  priceController?.clear();
                  Navigator.of(context).pop();
                }
              },
            );
          },
        ),
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.redAccent : Colors.redAccent,
              fontSize: MySize.size15,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            addCategoryController?.clear();
            priceController?.clear();
            FlutterToast.toastMessage(message: "Category not added", isError: true);
          },
        ),
      ],
    );
  }
}
