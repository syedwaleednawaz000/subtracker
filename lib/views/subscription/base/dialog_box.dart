import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';

class DialogBoxWidget extends StatelessWidget {
   DialogBoxWidget({super.key});
  TextEditingController? addCategoryController = TextEditingController();
  TextEditingController? priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
      Provider.of<ThemeChanger>(context)
          .themeData ==
          darkMode
          ? Colors.white
          : Colors.black,
      title: Center(
        child: Text(
          'Spending & Budgets',
          style: TextStyle(
            color: Provider.of<ThemeChanger>(context)
                .themeData ==
                darkMode
                ? const Color(0xFF000000)
                : const Color(0xFFFFFFFF),
            fontSize: MySize.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please enter new category and its price.',
              style: TextStyle(
                color:
                Provider.of<ThemeChanger>(context)
                    .themeData ==
                    darkMode
                    ? const Color(0xFF000000)
                    : Colors.grey,
                fontSize: MySize.size14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: MySize.size20),
            TextFormField(
              cursorColor:
              Provider.of<ThemeChanger>(context)
                  .themeData ==
                  darkMode
                  ? Colors.black
                  : Colors.white,
              style: TextStyle(
                fontSize: MySize.size14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color:
                Provider.of<ThemeChanger>(context)
                    .themeData ==
                    darkMode
                    ? Colors.black
                    : Colors.white,
              ),
              controller: addCategoryController,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Please enter category name';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        MySize.size20),
                    borderSide: BorderSide(
                        color:
                        Provider.of<ThemeChanger>(
                            context)
                            .themeData ==
                            darkMode
                            ? Colors.white
                            : AppColors.grey20)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      MySize.size20),
                  borderSide: BorderSide(
                    color: Provider.of<ThemeChanger>(
                        context)
                        .themeData ==
                        darkMode
                        ? Colors.black
                        : Colors
                        .white, // Color for unselected border
                  ),
                ),
                labelText: 'Category',
                hintText: 'Enter Category',
                hintStyle: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(
                        context)
                        .themeData ==
                        darkMode
                        ? Colors.grey
                        : Colors.grey,
                    fontFamily: 'Inter-Medium'),
                labelStyle: TextStyle(
                  color:
                  Provider.of<ThemeChanger>(context)
                      .themeData ==
                      darkMode
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              cursorColor:
              Provider.of<ThemeChanger>(context)
                  .themeData ==
                  darkMode
                  ? Colors.black
                  : Colors.white,
              style: TextStyle(
                fontSize: MySize.size14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color:
                Provider.of<ThemeChanger>(context)
                    .themeData ==
                    darkMode
                    ? Colors.black
                    : Colors.white,
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Please enter price';
                }
                return null;
              },
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        MySize.size20),
                    borderSide: BorderSide(
                        color:
                        Provider.of<ThemeChanger>(
                            context)
                            .themeData ==
                            darkMode
                            ? Colors.white
                            : AppColors.grey20)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      MySize.size20),
                  borderSide: BorderSide(
                    color: Provider.of<ThemeChanger>(
                        context)
                        .themeData ==
                        darkMode
                        ? Colors.black
                        : Colors
                        .white, // Color for unselected border
                  ),
                ),
                labelText: 'Price',
                hintText: 'Enter Price',
                hintStyle: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(
                        context)
                        .themeData ==
                        darkMode
                        ? Colors.grey
                        : Colors.grey,
                    fontFamily: 'Inter-Medium'),
                labelStyle: TextStyle(
                  color:
                  Provider.of<ThemeChanger>(context)
                      .themeData ==
                      darkMode
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Consumer<CategoryProvider>(builder: (context, categoryProvider, child) {
          return         TextButton(
            child: Text(
              'Add',
              style: TextStyle(
                color: Provider.of<ThemeChanger>(context)
                    .themeData ==
                    darkMode
                    ? Colors.lightBlue
                    : Colors.lightBlue,
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
        },),
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Provider.of<ThemeChanger>(context)
                  .themeData ==
                  darkMode
                  ? Colors.redAccent
                  : Colors.redAccent,
              fontSize: MySize.size15,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            addCategoryController?.clear();
            priceController?.clear();
            FlutterToast.toastMessage(message: "category not added",isError: true);
          },
        ),
      ],
    );
  }
}
