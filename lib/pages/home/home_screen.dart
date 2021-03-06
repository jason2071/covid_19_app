import 'package:covid_19_app/components/custom_appbar.dart';
import 'package:covid_19_app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: CustomAppbar(),
      body: Body(),
    );
  }
}
