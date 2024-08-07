import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';

class SetBudgetDialog extends StatefulWidget {
  String categoryName;
  String categoryId;
   SetBudgetDialog({required this.categoryId,required this.categoryName,super.key});

  @override
  State<SetBudgetDialog> createState() => _SetBudgetDialogState();
}

class _SetBudgetDialogState extends State<SetBudgetDialog> {
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Set budget')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Set total budget for ${widget.categoryName}'),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total budget:'),
              const SizedBox(height: 10,),
              SizedBox(
                height: MySize.size60,width: MySize.scaleFactorWidth*260,
                child: TextFormField(
                  cursorColor: Colors.black38,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  controller: priceController,
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: MySize.size10,horizontal: MySize.size10),
                    hintText: 'Enter total budget',
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
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(width: 18),
            Consumer<SpendingBudgetProvider>(builder: (context, spendingBudgetProvider, child) {
              return             TextButton(
                onPressed: () {
                  spendingBudgetProvider.budgetSet(price: priceController.text.trim(), categoryID: widget.categoryId);
                },
                child:spendingBudgetProvider.isBudgetSetLoading ? SizedBox(
                    height: MySize.size20,
                    width: MySize.size20,
                    child: const CircularProgressIndicator(color: AppColors.purpleFF,)) :const Text('Submit', style: TextStyle(color: Colors.blue)),
              );
            },)
          ],
        ),
      ],
    );
  }
}
