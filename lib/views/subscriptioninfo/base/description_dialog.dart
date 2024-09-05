import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';

class DescriptionDialog extends StatelessWidget {
  BuildContext  context;

   DescriptionDialog({super.key,required  this.context,});
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: const Text('Enter Description'),
          content: Consumer<SubscriptionInfoProvider>(builder: (context, subscriptionInfoProvider, child) {
            return TextField(
              controller: subscriptionInfoProvider.descriptionController,
              decoration: const InputDecoration(hintText: "Description"),
            );
          },),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'CANCEL',
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
