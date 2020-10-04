import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String errorText;
  final String labelText;
  final TextInputType inputType;
  final bool obscureText;
  final bool isEnabled;
  final void Function(String val) onSubmitted;
  final void Function(String val) onChanged;
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
      keyboardType: inputType,
      onChanged: onChanged,
      enabled: isEnabled,
      obscureText: obscureText ?? false,
      style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
