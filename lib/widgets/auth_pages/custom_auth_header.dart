import 'package:flutter/material.dart';

class CustomAuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomAuthHeader({@required this.title, @required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,
        )
      ],
    );
  }
}
