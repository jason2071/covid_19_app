import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.imageSrc,
    this.title,
    this.color,
    this.press,
  }) : super(key: key);
  final String imageSrc, title;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imageSrc,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
