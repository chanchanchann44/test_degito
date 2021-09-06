import 'package:flutter/material.dart';
import 'package:test_degito/configs/AppTheme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_degito/configs/BoxTheme.dart';
import 'package:test_degito/configs/FontTheme.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage(
      {Key? key,
      this.checkIn,
      this.checkOut,
      this.roomType,
      this.roomPrice,
      this.night,
      this.totalPrice})
      : super(key: key);
  final String? checkIn;
  final String? checkOut;
  final String? roomType;
  final String? roomPrice;
  final String? night;
  final String? totalPrice;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.09,
                ),
                Container(
                  height: 150,
                  width: 166,
                  child: SvgPicture.asset("assets/icons/BookingSuccessfully.svg"),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Booking Successfully",
                  style: FontTheme.fontSemiBold25,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: Container(
                    height: height * 0.32,
                    width: width * 0.885,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxTheme.containerBorderRadius,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Text(
                            "Booking Detail",
                            style: FontTheme.fontMedium16,
                          ),
                        ),
                        Divider(
                          color: AppTheme.lightGrey,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              rowBookingDetail("Check In", checkIn!),
                              rowBookingDetail("Check Out", checkOut!),
                              rowBookingDetail("Room Type", roomType!),
                              rowBookingDetail("Room Price", roomPrice!),
                              rowBookingDetail("Night", night!),
                              rowBookingDetail("Total Price", totalPrice!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Container(
                    height: height*0.062,
                    width: width*0.79,
                    decoration: BoxTheme.containerBorderRadius
                        .copyWith(color: AppTheme.blue),
                    child: Center(
                      child: Text(
                        "Back",
                        style: FontTheme.fontSemiBold16
                            .copyWith(color: AppTheme.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowBookingDetail(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: FontTheme.fontMedium15.copyWith(color: AppTheme.grey),
        ),
        (title == "Room Price")
            ? RichText(
                text: TextSpan(
                    text: subTitle,
                    style: FontTheme.fontMedium15,
                    children: [
                      TextSpan(
                        text: " 24 hrs",
                        style: FontTheme.fontMedium10,
                      ),
                      TextSpan()
                    ]),
              )
            : Text(
                subTitle,
                style: FontTheme.fontMedium15,
              )
      ],
    );
  }
}
