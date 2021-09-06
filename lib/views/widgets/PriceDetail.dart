import 'package:flutter/material.dart';
import 'package:test_degito/configs/AppTheme.dart';
import 'package:test_degito/configs/BoxTheme.dart';
import 'package:test_degito/configs/FontTheme.dart';
import 'package:test_degito/models/Hotel.dart';
import 'package:intl/intl.dart';

class PriceDetailWidget extends StatelessWidget {
  const PriceDetailWidget({Key? key, this.hotel}) : super(key: key);
  final Hotel? hotel;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hotel?.roomType?.length,
              itemBuilder: (context, index) {
                return roomPrice(context, hotel?.roomType?[index] ?? "",
                    "\$${formatter.format(hotel?.roomTypePrice?[index])}");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget roomPrice(context, String type, String price) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: width * 0.048, right: width * 0.048, top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: FontTheme.fontMedium15.copyWith(color: AppTheme.grey),
              ),
              RichText(
                text: TextSpan(
                    text: price,
                    style: FontTheme.fontMedium15,
                    children: [
                      TextSpan(
                        text: " 24 hrs",
                        style: FontTheme.fontMedium10,
                      ),
                      TextSpan()
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
