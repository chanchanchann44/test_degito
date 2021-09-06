import 'package:flutter/material.dart';
import 'package:test_degito/configs/AppTheme.dart';
import 'package:test_degito/configs/BoxTheme.dart';
import 'package:test_degito/configs/FontTheme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_degito/models/Hotel.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key, this.hotel}) : super(key: key);
  final Hotel? hotel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.048),
            child: Text(
              "Provide facility",
              style: FontTheme.fontSemiBold12,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          buildGridView(context)
        ],
      ),
    );
  }

  Widget buildGridView(context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Center(
        child: Container(
          width: width * 0.82,
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 15,
            children: List.generate(8, (index) {
              return Column(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    child: SvgPicture.asset(
                      facilityListSvg[index],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(facilityList[index],style: FontTheme.fontMedium12,),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  static List<String> facilityListSvg = [
    "assets/icons/FreeWifi.svg",
    "assets/icons/Spa.svg",
    "assets/icons/Beach.svg",
    "assets/icons/Pool.svg",
    "assets/icons/Breakfast.svg",
    "assets/icons/Bar.svg",
    "assets/icons/Gym.svg",
    "assets/icons/Parking.svg"
  ];
  static List<String> facilityList = [
    "Free Wifi",
    "Spa",
    "Beach",
    "Pool",
    "Breakfast",
    "Bar",
    "Gym",
    "Parking"
  ];
}
