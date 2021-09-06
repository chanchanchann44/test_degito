import 'package:flutter/services.dart';
import 'package:test_degito/models/Hotel.dart';

class HotelRepo {

  Future<HotelList> getHotelList() async {
    final String response = await rootBundle.loadString('assets/hotel.json');

    return hotelListFromJson(response);
  }
}
