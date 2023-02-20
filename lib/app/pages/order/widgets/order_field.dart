import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';

class OrderField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  const OrderField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 35,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.textRegular.copyWith(fontSize: 16),
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                hintText: hintText,
                border: defaultBorder,
                enabledBorder: defaultBorder,
                focusedErrorBorder: defaultBorder),
          )
        ],
      ),
    );
  }
}
