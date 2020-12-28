import 'package:covid_19_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/icon_menu.svg"),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/icon_bell.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
