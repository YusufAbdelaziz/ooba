import 'package:flutter/material.dart';

class CustomAuthFooter extends StatelessWidget {
  final String boldText;
  final String normalText;
  final void Function() onTap;
  const CustomAuthFooter({@required this.boldText, this.normalText, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: normalText, style: Theme.of(context).textTheme.headline5),
          TextSpan(text: ' '),
          TextSpan(text: boldText, style: Theme.of(context).textTheme.headline2)
        ]),
      ),
    );
  }
}
