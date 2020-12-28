import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class DropDownCountry extends StatelessWidget {
  const DropDownCountry({
    Key key,
    this.press,
    this.imageSrc,
    this.title,
  }) : super(key: key);

  final String imageSrc, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: SizeConfig.screenWidth * 0.31,
        padding: EdgeInsets.only(left: 4, right: 16, top: 2, bottom: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  imageSrc,
                  height: 27,
                  width: 27,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SvgPicture.asset("assets/icons/icon_arrow_down.svg"),
          ],
        ),
      ),
    );
  }
}
