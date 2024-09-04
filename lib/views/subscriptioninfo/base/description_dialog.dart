import 'package:flutter/material.dart';

class DescriptionDialog extends StatelessWidget {
  BuildContext  context;
  String oldValue;
   DescriptionDialog({super.key,required  this.context, required this.oldValue});
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    descriptionController.text = oldValue;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: const Text('Enter Description'),
          content: TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: "Description"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'CANCEL',
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                descriptionController.clear(); // Clear the text field
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                // setState(() {
                //   _descrip = descriptionController.text.trim();
                // });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
