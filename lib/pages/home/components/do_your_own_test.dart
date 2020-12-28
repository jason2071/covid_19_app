import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class DoYourOwnTest extends StatelessWidget {
  const DoYourOwnTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sw = SizeConfig.screenWidth;
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: kGradientColor,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 0,
            child: Container(
              height: 135,
              child: Image.asset(
                "assets/images/do_your_own_test.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sw * 0.5,
                    child: Text(
                      "Do your own test!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sw * 0.5,
                    child: Text(
                      "Follow the instructions to do your own test.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
