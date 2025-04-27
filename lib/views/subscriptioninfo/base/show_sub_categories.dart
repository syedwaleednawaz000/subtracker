import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/views/addNewSubscription/model/all_category_model.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';
class ShowSubCategories extends StatelessWidget {
  BuildContext context;
      Categories category;
  List<Providers>? providers;
   ShowSubCategories({this.providers,required this.context, required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            '${ AppLocalizations.of(context)!.subcategories_of} ${category.name}',
            style:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...providers!.map((subCat) {
            return ListTile(
                title: Text(subCat.name ?? ""),
                onTap: () {
                  Provider.of<SubscriptionInfoProvider>(context, listen: false)
                      .setAllCategoryValue(
                      categoryID: category.id.toString(),
                      categoryName: category.name.toString(),
                      subCategoryID: subCat.id.toString(),
                      subCategoryName: subCat.name.toString());
                });
          }).toList(),
        ],
      ),
    );;
  }
}
