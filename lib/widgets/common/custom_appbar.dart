import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final void Function() backAction;

  const CustomAppBar({@required this.title, this.backAction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight , bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (backAction != null)
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
            title.toUpperCase(),
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
