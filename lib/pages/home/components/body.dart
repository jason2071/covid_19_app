import 'package:covid_19_app/constants.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'do_your_own_test.dart';
import 'dropdown_country.dart';
import 'preventation_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildTitle(title: "Preventaion"),
            SizedBox(height: 20),
            _buildPreventations(),
            SizedBox(height: 20),
            DoYourOwnTest(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle({String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }

  Widget _buildPreventations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PreventationCard(
          imageSrc: "assets/icons/avoid_close_contact.svg",
          title: "Avoid Close Contact",
        ),
        PreventationCard(
          imageSrc: "assets/icons/clean_your_hands_often.svg.svg",
          title: "Clean your hands often",
        ),
        PreventationCard(
          imageSrc: "assets/icons/wear_a_facemask.svg",
          title: "Wear a facemask",
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Covid-19",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              DropDownCountry(
                imageSrc: "assets/images/usa_flag.jpg",
                title: "USA",
                press: () {},
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Are you feeling sick?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                imageSrc: "assets/icons/icon_phone.svg",
                title: "Call Now",
                color: Color(0xFFFF4D58),
                press: () {},
              ),
              CustomButton(
                imageSrc: "assets/icons/icon_message-circle.svg",
                title: "Send SMS",
                color: Color(0xFF4D79FF),
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
