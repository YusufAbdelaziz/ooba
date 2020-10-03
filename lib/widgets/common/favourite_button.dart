import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  final double radius;
  final double size;

  const FavouriteButton({@required this.radius, @required this.size});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.radius,
      backgroundColor: Color(0xFFF7F7F7),
      child: Icon(
        Icons.favorite,
        color: Colors.grey,
        size: this.size,
      ),
    );
  }
}
