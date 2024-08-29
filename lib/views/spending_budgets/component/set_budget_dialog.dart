import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/utils/my_size.dart';

class SetBudgetDialog extends StatefulWidget {
  final String categoryName;
  final String categoryId;

  SetBudgetDialog({required this.categoryId, required this.categoryName, Key? key}) : super(key: key);

  @override
  State<SetBudgetDialog> createState() => _SetBudgetDialogState();
}

class _SetBudgetDialogState extends State<SetBudgetDialog> {
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : Colors.black,
      title:  Center(child: Text(AppLocalizations.of(context)!.set_budget,
      style: TextStyle(
        color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
      ),)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${AppLocalizations.of(context)!.set_total_budget_for} ${widget.categoryName}',style: TextStyle(
                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,

              ),),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppLocalizations.of(context)!.total_budget,style: TextStyle(
                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                 ),
               ),
               SizedBox(height: MySize.size20),
              SizedBox(
                height: MySize.size80,
                width: MySize.scaleFactorWidth * 260,
                child: TextFormField(
                  cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                  style: TextStyle(
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  controller: priceController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: MySize.size10, horizontal: MySize.size10),
                    labelText: AppLocalizations.of(context)!.total_budget,
                    labelStyle: TextStyle(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,
                    ),
                    hintText: AppLocalizations.of(context)!.enter_total_budget,
                    hintStyle: TextStyle(
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.black : Colors.white,

                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MySize.size15),
                      borderSide: BorderSide(color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : AppColors.grey20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MySize.size15),
                      borderSide: BorderSide(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ?  Colors.black
                            : Colors.white,
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
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(width: 18),
            Consumer<SpendingBudgetProvider>(
              builder: (context, spendingBudgetProvider, child) {
                return TextButton(
                  onPressed: () {
                    spendingBudgetProvider.budgetSet(price: priceController.text.trim(),context: context, categoryID: widget.categoryId);
                  },
                  child: spendingBudgetProvider.isBudgetSetLoading
                      ? SizedBox(
                    height: MySize.size20,
                    width: MySize.size20,
                    child: const CircularProgressIndicator(color: AppColors.purpleFF),
                  )
                      :  Text(AppLocalizations.of(context)!.submit, style: TextStyle(color: Colors.blue)),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
