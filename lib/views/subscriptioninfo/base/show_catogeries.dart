import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';

class ShowCategories extends StatelessWidget {
  CategoryProvider provider;
   ShowCategories({required this.provider,super.key});

  @override
  Widget build(BuildContext context) {
    return provider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: provider.categories.map((category) {
          return ListTile(
            title: Text(category.name ?? ""),
            onTap: () {
              Navigator.pop(context);
              Provider.of<SubscriptionInfoProvider>(context,listen: false).showSubcategories(context: context,category: category);
            },
          );
        }).toList(),
      ),
    );;
  }
}
