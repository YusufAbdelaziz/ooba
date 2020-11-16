import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  final double radius;
  final double size;
  final bool isFavorite;
  final void Function() onClick;
  const FavouriteButton(
      {@required this.radius,
      @required this.size,
      @required this.isFavorite,
      @required this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onClick,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: CircleAvatar(
        radius: this.radius,
        backgroundColor: Color(0xFFF7F7F7),
        child: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : Colors.grey,
          size: this.size,
        ),
      ),
    );
  }
}
