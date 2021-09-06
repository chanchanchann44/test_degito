import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_degito/models/Hotel.dart';
import 'package:test_degito/repository/HotelRepo.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(const HotelState.initialized());

  @override
  Stream<HotelState> mapEventToState(
      HotelEvent event,
      ) async* {
    if (event is GetHotelList) {
      /// Mock get data from API
      HotelList hotelList = await HotelRepo().getHotelList();
      yield HotelState.hotelList(hotelList: hotelList);
    }
  }
}
