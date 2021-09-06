import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_degito/bloc/hotel_bloc.dart';
import 'package:test_degito/configs/BoxTheme.dart';
import 'package:test_degito/views/widgets/Detail.dart';
import 'package:test_degito/views/widgets/PriceDetail.dart';
import 'package:table_calendar/table_calendar.dart';
import '../configs/AppTheme.dart';
import '../configs/FontTheme.dart';
import '../models/Hotel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ReceiptPage.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({Key? key, this.hotel}) : super(key: key);
  final Hotel? hotel;

  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage>
    with SingleTickerProviderStateMixin {
  Hotel? get hotel => widget.hotel;
  int? _tabController = 1;
  DateTime? _focusedDayCheckIn = DateTime.now();
  DateTime? _focusedDayCheckOut = DateTime.now().add(Duration(days: 1));
  DateTime? _checkIn = DateTime.now();
  DateTime? _checkOut = DateTime.now().add(Duration(days: 1));
  DateTime? _selectedCheckIn = DateTime.now();
  DateTime? _selectedCheckOut = DateTime.now().add(Duration(days: 1));
  DateTime? _firstDayCheckOut = DateTime.now().add(Duration(days: 1));
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int? _indexRoomType = 0;
  var formatter = NumberFormat('#,###,000');

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
          hotel?.name ?? "",
          style: FontTheme.fontSemiBold20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/BackIcon.svg',
            // color: AppTheme.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height * 0.82,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: height * 0.37,
                    width: width,
                    child: Image.asset(
                      hotel?.image ?? "",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.32,
                  child: Container(
                    decoration: BoxTheme.containerBorderRadius,
                    height: height * 0.465,
                    width: width * 0.89,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Center(
                          child: Container(
                            height: height * 0.071,
                            width: width * 0.82,
                            decoration: BoxTheme.containerBorderRadius.copyWith(
                                color: AppTheme.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      await _datePicker(true, DateTime.now());
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6, bottom: 9),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Check In",
                                            style: FontTheme.fontMedium10
                                                .copyWith(
                                                    color: AppTheme.white),
                                          ),
                                          Text(
                                            DateFormat('dd-MMM-yyyy').format(
                                                _checkIn ?? DateTime.now()),
                                            style: FontTheme.fontMedium10
                                                .copyWith(
                                                    color: AppTheme.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                    color: AppTheme.white, width: 0.5),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      await _datePicker(
                                          false, _firstDayCheckOut);
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6, bottom: 9),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Check Out",
                                            style: FontTheme.fontMedium10
                                                .copyWith(
                                                    color: AppTheme.white),
                                          ),
                                          Text(
                                            DateFormat('dd-MMM-yyyy').format(
                                                _checkOut ??
                                                    DateTime.now().add(
                                                        Duration(days: 1))),
                                            style: FontTheme.fontMedium10
                                                .copyWith(
                                                    color: AppTheme.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                    color: AppTheme.white, width: 0.5),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      await _roomTypePicker();
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6, bottom: 9),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Room Type",
                                            style: FontTheme.fontMedium10
                                                .copyWith(
                                                    color: AppTheme.white),
                                          ),
                                          Text(
                                            hotel!.roomType![_indexRoomType!],
                                            style: FontTheme.fontMedium10
                                                .copyWith(
                                                    color: AppTheme.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        (_tabController == 1)
                            ? DetailWidget(
                                hotel: hotel,
                              )
                            : PriceDetailWidget(
                                hotel: hotel,
                              ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.294,
                  child: Container(
                    decoration: BoxTheme.containerBorderRadius
                        .copyWith(color: Colors.transparent),
                    height: height * 0.053,
                    width: width * 0.66,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _tabController = 1;
                              });
                            },
                            child: Container(
                              decoration: (_tabController == 1)
                                  ? BoxTheme.containerBorderRadiusOnlyRight
                                      .copyWith(color: AppTheme.blue)
                                  : BoxTheme.containerBorderRadiusOnlyRight,
                              child: Center(
                                child: Text(
                                  "Detail",
                                  style: (_tabController == 1)
                                      ? FontTheme.fontMedium15
                                          .copyWith(color: AppTheme.white)
                                      : FontTheme.fontMedium15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _tabController = 2;
                              });
                            },
                            child: Container(
                              decoration: (_tabController == 2)
                                  ? BoxTheme.containerBorderRadiusOnlyLeft
                                      .copyWith(color: AppTheme.blue)
                                  : BoxTheme.containerBorderRadiusOnlyLeft,
                              child: Center(
                                child: Text(
                                  "Price Detail",
                                  style: (_tabController == 2)
                                      ? FontTheme.fontMedium15
                                          .copyWith(color: AppTheme.white)
                                      : FontTheme.fontMedium15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.755,
                  child: InkWell(
                    onTap: () {
                      int night = _checkOut!.difference(_checkIn!).inDays;
                      double totalPrice =
                          hotel!.roomTypePrice![_indexRoomType!] * night;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReceiptPage(
                                    checkIn: DateFormat('dd-MMM-yyyy')
                                        .format(_checkIn ?? DateTime.now()),
                                    checkOut: DateFormat('dd-MMM-yyyy')
                                        .format(_checkOut ?? DateTime.now()),
                                    roomType: hotel!.roomType![_indexRoomType!],
                                    roomPrice:
                                        "\$${formatter.format(hotel!.roomTypePrice![_indexRoomType!])}",
                                    night: "$night Nights",
                                    totalPrice:
                                        "\$${formatter.format(totalPrice)}",
                                  )));
                    },
                    child: Container(
                      decoration: BoxTheme.containerBorderRadius
                          .copyWith(color: AppTheme.blue),
                      height: height * 0.062,
                      width: width * 0.79,
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: FontTheme.fontSemiBold16
                              .copyWith(color: AppTheme.white),
                        ),
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

  Future<void> _datePicker(bool? isCheckIn, DateTime? firstDay) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (_) => HotelBloc(),
          child: StatefulBuilder(builder: (context, setStateDialog) {
            double height = MediaQuery.of(context).size.height;
            double width = MediaQuery.of(context).size.width;
            return Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(20),
              child: Container(
                height: (height > 900)
                    ? 580
                    : (height > 700)
                        ? height * 0.65
                        : height * 0.8,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: (height > 900)
                          ? 530
                          : (height > 700)
                              ? height * 0.58
                              : height * 0.73,
                      width: width,
                      decoration: BoxTheme.containerBorderRadius,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 120,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (isCheckIn!) ? 'Check In' : 'Check Out',
                                style: FontTheme.fontSemiBold16,
                              ),
                            ),
                          ),
                          Divider(
                            color: AppTheme.lightGrey,
                          ),
                          TableCalendar(
                            firstDay: firstDay ?? DateTime.now(),
                            lastDay: DateTime.now().add(Duration(days: 365)),
                            focusedDay: (isCheckIn)
                                ? _focusedDayCheckIn!
                                : _focusedDayCheckOut!,
                            calendarFormat: _calendarFormat,
                            daysOfWeekHeight: 35,
                            rowHeight: 52,
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekendStyle: FontTheme.fontSemiBold16,
                              weekdayStyle: FontTheme.fontSemiBold16,
                              dowTextFormatter: (date, locale) =>
                                  DateFormat.yMMMEd(locale).format(date)[0],
                            ),
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                              titleTextStyle: FontTheme.fontSemiBold16,
                              headerPadding: EdgeInsets.symmetric(vertical: 0),
                            ),
                            calendarStyle: CalendarStyle(
                                todayTextStyle: FontTheme.fontMedium16,
                                todayDecoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                selectedDecoration: BoxDecoration(
                                  color: AppTheme.blue,
                                  shape: BoxShape.circle,
                                ),
                                defaultTextStyle: FontTheme.fontMedium16,
                                weekendTextStyle: FontTheme.fontMedium16,
                                selectedTextStyle: FontTheme.fontMedium16
                                    .copyWith(color: AppTheme.white),
                                outsideTextStyle: FontTheme.fontMedium16
                                    .copyWith(color: AppTheme.lightGrey)),
                            selectedDayPredicate: (day) {
                              return isSameDay(
                                  (isCheckIn)
                                      ? _selectedCheckIn
                                      : _selectedCheckOut,
                                  day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(
                                  (isCheckIn)
                                      ? _selectedCheckIn
                                      : _selectedCheckOut,
                                  selectedDay)) {
                                // Call `setState()` when updating the selected day
                                setStateDialog(() {
                                  if (isCheckIn) {
                                    setState(() {
                                      _selectedCheckIn = selectedDay;
                                      _focusedDayCheckIn = focusedDay;
                                    });
                                  } else {
                                    setState(() {
                                      _selectedCheckOut = selectedDay;
                                      _focusedDayCheckOut = focusedDay;
                                    });
                                  }
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: (height > 900)
                          ? 530
                          : (height > 700)
                              ? height * 0.585
                              : height * 0.735,
                      child: InkWell(
                        onTap: () {
                          _checkIn = _selectedCheckIn;
                          if ((_checkIn!.day >= _checkOut!.day &&
                                  _checkIn!.month >= _checkOut!.month) ||
                              _checkIn!.month > _checkOut!.month) {
                            _checkOut = _checkIn!.add(Duration(days: 1));
                            _selectedCheckOut =
                                _checkIn!.add(Duration(days: 1));
                            _focusedDayCheckOut = _checkOut;
                          } else {
                            _checkOut = _selectedCheckOut;
                            _focusedDayCheckOut = _checkOut;
                          }
                          _firstDayCheckOut = _checkIn!.add(Duration(days: 1));
                          // _focusedDay = _firstDayCheckOut!;
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Container(
                          height: 51,
                          width: 247,
                          decoration: BoxTheme.containerBorderRadius
                              .copyWith(color: AppTheme.blue),
                          child: Center(
                              child: Text(
                            "Apply",
                            style: FontTheme.fontMedium16
                                .copyWith(color: AppTheme.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Future<void> _roomTypePicker() {
    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setStateRoomType) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxTheme.containerBorderRadius,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 16),
                    child: Text(
                      'Room Type',
                      style: FontTheme.fontSemiBold16,
                    ),
                  ),
                  Divider(
                    color: AppTheme.lightGrey,
                  ),
                  ListView.builder(
                      itemCount: hotel!.roomType!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${hotel!.roomType![index]}',
                            style: (_indexRoomType == index)
                                ? FontTheme.fontMedium15
                                : FontTheme.fontMedium15
                                    .copyWith(color: AppTheme.grey),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/icons/Selected.svg',
                            color: (_indexRoomType == index)
                                ? AppTheme.blue
                                : AppTheme.white,
                          ),
                          onTap: () {
                            setStateRoomType(() {
                              _indexRoomType = index;
                            });
                            setState(() {
                              _indexRoomType = index;
                            });
                          },
                        );
                      })
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
