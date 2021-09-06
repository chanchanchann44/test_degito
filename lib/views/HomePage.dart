import 'package:flutter/material.dart';
import 'package:test_degito/views/widgets/ShowHotels.dart';
import 'package:test_degito/bloc/hotel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<HotelBloc>().add(GetHotelList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<HotelBloc>().add(GetHotelList());
    return BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          switch (state.status) {
            case HotelStatus.GetHotelList:
              return ShowHotels(hotelList: state.hotelList,);
            default:
              return Scaffold(
                  body: Container()
              );
          }
        },
    );
  }
}
