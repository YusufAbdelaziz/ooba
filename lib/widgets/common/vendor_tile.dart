import 'package:Ooba/utilities/space.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class VendorTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage('assets/images/vendor_logo.png'),
        ),
        space(height: 10),
        AutoSizeText(
          'Wahab',
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.w200,
              ),
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
        )
      ],
    );
  }
}
