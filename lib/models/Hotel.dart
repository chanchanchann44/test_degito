// To parse this JSON data, do
//
//     final hotelList = hotelListFromJson(jsonString);

import 'dart:convert';

HotelList hotelListFromJson(String str) => HotelList.fromJson(json.decode(str));

String hotelListToJson(HotelList data) => json.encode(data.toJson());

class HotelList {
  HotelList({
    this.hotel,
  });

  List<Hotel>? hotel;

  factory HotelList.fromJson(Map<String, dynamic> json) => HotelList(
    hotel: json["hotel"] == null ? null : List<Hotel>.from(json["hotel"].map((x) => Hotel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hotel": hotel == null ? null : List<dynamic>.from(hotel!.map((x) => x.toJson())),
  };
}

class Hotel {
  Hotel({
    this.name,
    this.imagePreview,
    this.image,
    this.roomType,
    this.provideFacility,
    this.roomTypePrice,
  });

  String? name;
  String? imagePreview;
  String? image;
  List<String>? roomType;
  ProvideFacility? provideFacility;
  List<double>? roomTypePrice;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    name: json["name"] == null ? null : json["name"],
    imagePreview: json["imagePreview"] == null ? null : json["imagePreview"],
    image: json["image"] == null ? null : json["image"],
    roomType: json["roomType"] == null ? null : List<String>.from(json["roomType"].map((x) => x)),
    provideFacility: json["provideFacility"] == null ? null : ProvideFacility.fromJson(json["provideFacility"]),
    roomTypePrice: json["roomTypePrice"] == null ? null : List<double>.from(json["roomTypePrice"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "imagePreview": imagePreview == null ? null : imagePreview,
    "image": image == null ? null : image,
    "roomType": roomType == null ? null : List<dynamic>.from(roomType!.map((x) => x)),
    "provideFacility": provideFacility == null ? null : provideFacility!.toJson(),
    "roomTypePrice": roomTypePrice == null ? null : List<dynamic>.from(roomTypePrice!.map((x) => x)),
  };
}

class ProvideFacility {
  ProvideFacility({
    this.freeWifi,
    this.spa,
    this.beach,
    this.pool,
    this.breakfast,
    this.bar,
    this.gym,
    this.parking,
  });

  bool? freeWifi;
  bool? spa;
  bool? beach;
  bool? pool;
  bool? breakfast;
  bool? bar;
  bool? gym;
  bool? parking;

  factory ProvideFacility.fromJson(Map<String, dynamic> json) => ProvideFacility(
    freeWifi: json["freeWifi"] == null ? null : json["freeWifi"],
    spa: json["spa"] == null ? null : json["spa"],
    beach: json["beach"] == null ? null : json["beach"],
    pool: json["pool"] == null ? null : json["pool"],
    breakfast: json["breakfast"] == null ? null : json["breakfast"],
    bar: json["bar"] == null ? null : json["bar"],
    gym: json["gym"] == null ? null : json["gym"],
    parking: json["parking"] == null ? null : json["parking"],
  );

  Map<String, dynamic> toJson() => {
    "freeWifi": freeWifi == null ? null : freeWifi,
    "spa": spa == null ? null : spa,
    "beach": beach == null ? null : beach,
    "pool": pool == null ? null : pool,
    "breakfast": breakfast == null ? null : breakfast,
    "bar": bar == null ? null : bar,
    "gym": gym == null ? null : gym,
    "parking": parking == null ? null : parking,
  };
}
