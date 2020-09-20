import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String errorText;
  final String labelText;
  final TextInputType inputType;
  final bool obscureText;
  final void Function(String val) onSubmitted;
  final Widget suffixIcon;
  const CustomTextField(
      {Key key,
      this.controller,this.suffixIcon,
      this.onSubmitted,
      this.focusNode,
      this.errorText,
      this.obscureText,
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
      obscureText: obscureText ?? false,
      style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
      decoration: InputDecoration(
        errorText: errorText,suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
