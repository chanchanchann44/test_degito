import 'package:flutter/material.dart';
import 'package:test_degito/bloc/hotel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomePage.dart';

class HotelProvider extends StatefulWidget {
  const HotelProvider({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HotelProvider> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelBloc(),
      child: HomePage(),
    );
  }
}
