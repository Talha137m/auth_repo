import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.area,
      required this.hintText,
      required this.keyboardType,
      required this.validator,
      required this.textEditingController,
      this.focusNode});
  final double area;
  final String hintText;
  final TextInputType keyboardType;
  final FormFieldValidator<String?> validator;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.blueGrey,
      cursorRadius: Radius.circular(area),
      decoration: InputDecoration(
        errorMaxLines: 1,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.blueGrey, fontWeight: FontWeight.w300),
        helperText: 'required',
        helperStyle: const TextStyle(color: Colors.blueGrey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              area * 0.00004,
            ),
            borderSide: const BorderSide(color: Colors.blueGrey, width: 2)),
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              area * 0.00004,
            ),
            borderSide: const BorderSide(
              color: Colors.blueGrey,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              area * 0.00004,
            ),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              area * 0.00004,
            ),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error, width: 1.5)),
      ),
    );
  }
}
