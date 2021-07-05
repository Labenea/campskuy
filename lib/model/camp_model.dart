// To parse this JSON data, do
//
//     final campData = campDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CampData campDataFromJson(String str) => CampData.fromJson(json.decode(str));

String campDataToJson(CampData data) => json.encode(data.toJson());

class CampData {
  CampData({
    required this.title,
    required this.desc,
    required this.image,
    required this.location,
    required this.price,
    required this.str,
    required this.type,
    required this.view,
  });

  final String title;
  final String desc;
  final String image;
  final String location;
  final String price;
  final String str;
  final String type;
  final int view;

  factory CampData.fromJson(Map<String, dynamic> json) => CampData(
        title: json["title"],
        desc: json["desc"],
        image: json["image"],
        location: json["location"],
        price: json["price"],
        str: json["str"],
        type: json["type"],
        view: json["view"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "image": image,
        "location": location,
        "price": price,
        "str": str,
        "type": type,
        "view": view,
      };
}
