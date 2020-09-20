import 'package:flutter/material.dart';

class CustomAuthAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final void Function() backAction;

  const CustomAuthAppBar({@required this.title, this.backAction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight - 15, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (backAction != null)
            Expanded(
              child: GestureDetector(
                onTap: backAction,
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ),
          Spacer(
            flex: 1,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          Spacer(
            flex: backAction == null ? 1 : 2,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 90);
}
