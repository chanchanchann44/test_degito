part of 'hotel_bloc.dart';

enum HotelStatus {
  initialized,
  GetHotelList,
}

class HotelState {
  const HotelState._({
    @required this.status,
    this.hotelList,
  });

  const HotelState.initialized()
      : this._(status: HotelStatus.initialized);

  const HotelState.hotelList({HotelList? hotelList}) : this._(status: HotelStatus.GetHotelList,hotelList: hotelList);

  final HotelStatus? status;
  final HotelList? hotelList;
}
