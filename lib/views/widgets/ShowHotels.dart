import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_degito/bloc/hotel_bloc.dart';
import 'package:test_degito/views/HotelDetailPage.dart';
import '../../configs/AppTheme.dart';
import '../../configs/BoxTheme.dart';
import '../../configs/FontTheme.dart';
import '../../models/Hotel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowHotels extends StatefulWidget {
  const ShowHotels({Key? key, this.hotelList}) : super(key: key);
  final HotelList? hotelList;

  @override
  _ShowHotelsState createState() => _ShowHotelsState();
}

class _ShowHotelsState extends State<ShowHotels> {
  HotelList? get hotelList => widget.hotelList;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        title: Text(
          "HOME",
          style: FontTheme.fontSemiBold20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/MenuList.svg',
            // color: AppTheme.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/User.svg',
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          // padding: EdgeInsets.only(top: 12),
          height: 70,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 28,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/Website.svg',
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Website",
                          style: FontTheme.fontSemiBold12
                              .copyWith(color: AppTheme.blue),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 28,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/Call.svg',
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Call",
                          style: FontTheme.fontSemiBold12
                              .copyWith(color: AppTheme.blue),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 28,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/Location.svg',
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Location",
                          style: FontTheme.fontSemiBold12
                              .copyWith(color: AppTheme.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 332,
                height: height * 0.37,
                width: width,
                child: Image.asset(
                  "assets/images/HomePage.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  "Popular Hotel in London",
                  style: FontTheme.fontSemiBold16,
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                height: height * 0.2,
                padding: EdgeInsets.only(left: 23),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: hotelList?.hotel?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (_) => HotelBloc(),
                              child: HotelDetailPage(
                                  hotel: hotelList?.hotel?[index]),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: height * 0.19,
                        width: width * 0.465,
                        margin: EdgeInsets.only(right: 23),
                        child: Stack(
                          children: [
                            Container(
                              height: height * 0.175,
                              width: width * 0.465,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  hotelList?.hotel?[index].imagePreview ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * 0.005),
                                decoration: BoxTheme.textBorderRadius20,
                                height: height * 0.044,
                                width: width * 0.365,
                                child: Center(
                                    child: Text(
                                  hotelList?.hotel?[index].name ?? "",
                                  style: FontTheme.fontMedium12,
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  "Recommended Hotel in London",
                  style: FontTheme.fontSemiBold16,
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                height: height * 0.2,
                padding: EdgeInsets.only(left: 23),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: hotelList?.hotel?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (_) => HotelBloc(),
                              child: HotelDetailPage(
                                  hotel: hotelList?.hotel?[index]),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: height * 0.19,
                        width: width * 0.465,
                        margin: EdgeInsets.only(right: 23),
                        child: Stack(
                          children: [
                            Container(
                              height: height * 0.175,
                              width: width * 0.465,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  hotelList?.hotel?[index].imagePreview ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * 0.005),
                                decoration: BoxTheme.textBorderRadius20,
                                height: height * 0.044,
                                width: width * 0.365,
                                child: Center(
                                    child: Text(
                                  hotelList?.hotel?[index].name ?? "",
                                  style: FontTheme.fontMedium12,
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
