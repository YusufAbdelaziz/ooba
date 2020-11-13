import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String logoAsset;
  final Widget content;
  final Color color;
  final void Function() onTap;
  const CustomButton({this.logoAsset, @required this.content, @required this.color, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: logoAsset != null ? EdgeInsetsDirectional.only(start: 15) : EdgeInsets.zero,
        margin: EdgeInsets.only(bottom: 10),
        height: 44,
        color: color,
        child: Row(
          children: [
            if (logoAsset != null)
              Expanded(
                  child: Image.asset(
                logoAsset,
                alignment: Alignment.center,
              )),
            Spacer(),
            content,
            Spacer(
              flex: logoAsset != null ? 2 : 1,
            )
          ],
        ),
      ),
    );
  }
}
