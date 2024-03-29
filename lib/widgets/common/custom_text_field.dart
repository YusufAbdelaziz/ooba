import 'package:flutter/material.dart';

typedef CustomFunction = void Function(String val);

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String errorText;
  final String labelText;
  final TextInputType inputType;
  final bool obscureText;
  final bool isEnabled;
  final CustomFunction onSubmitted;
  final CustomFunction onChanged;
  final Widget suffixIcon;

  const CustomTextField(
      {Key key,
      this.controller,
      this.suffixIcon,
      this.onSubmitted,
      this.onChanged,
      this.focusNode,
      this.errorText,
      this.obscureText,
      this.isEnabled = true,
      this.labelText,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: inputType,
      onChanged: onChanged,
      enabled: isEnabled,
      obscureText: obscureText ?? false,
      style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
      decoration: InputDecoration(
        errorText: errorText,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        )),
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
