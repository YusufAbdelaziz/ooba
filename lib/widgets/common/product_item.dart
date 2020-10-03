import 'package:Ooba/utilities/space.dart';
import 'package:Ooba/widgets/common/favourite_button.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Theme.of(context).primaryColor, width: 0.8)),
              child: Image.asset(
                'assets/images/product.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(top: 10, left: 10, child: FavouriteButton(size: 16,radius: 15,))
          ],
        ),
        space(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('White T-Shirt'),
                  Text('20\$'),
                ],
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'By Wahab',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
