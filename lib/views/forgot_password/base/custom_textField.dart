import 'package:flutter/material.dart';
import '../../../utils/my_size.dart';


class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  const CustomTextField({super.key, this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(

        contentPadding: EdgeInsets.all(MySize.size12),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(icon,
              color: Colors.grey.withOpacity(0.5)),
        ),
        hintText: hintText,
        hintStyle:
        TextStyle(color: Colors.grey.withOpacity(0.5)),

      ),
    );
  }
}
