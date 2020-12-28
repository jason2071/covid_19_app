import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreventationCard extends StatelessWidget {
  const PreventationCard({
    Key key,
    this.title,
    this.imageSrc,
  }) : super(key: key);

  final String title, imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(width: 100, child: SvgPicture.asset(imageSrc)),
          SizedBox(
            width: 100,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
