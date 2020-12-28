import 'package:covid_19_app/components/custom_appbar.dart';
import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class StatsScreen extends StatelessWidget {
  static const routeName = '/statistics_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppbar(),
      body: Body(),
    );
  }
}
