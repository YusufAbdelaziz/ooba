import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color color;
  final double verticalPadding;
  CustomLoadingIndicator({this.color , this.verticalPadding = 10.0});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding:  EdgeInsets.symmetric(vertical: verticalPadding),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).primaryColor),
      ),
    ));
  }
}
