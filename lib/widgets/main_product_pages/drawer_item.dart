import 'package:Ooba/utilities/space.dart';
import 'package:flutter/material.dart';

typedef void CustomAction();

class DrawerItem extends StatelessWidget {
  final String name;
  final CustomAction onTap;

  const DrawerItem({@required this.name, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              Text(name),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
          space(height: 10),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          space(height: 25)
        ],
      ),
    );
  }
}
