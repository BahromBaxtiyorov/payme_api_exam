// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class UserModel {
  UserModel({
    this.name,
    this.cardname,
    this.price,
    this.expireDateNumber,
    this.image,
    this.cardNumber,
    this.id,
  });

  @HiveField(1)
  String? name;
  @HiveField(2)
  String? cardname;
  @HiveField(3)
  String? price;
  @HiveField(4)
  String? expireDateNumber;
  @HiveField(5)
  String? image;
  @HiveField(6)
  String? cardNumber;
  @HiveField(7)
  String? id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    cardname: json["cardname"],
    price: json["price"],
    expireDateNumber: json["expireDateNumber"],
    image: json["image"],
    cardNumber: json["cardNumber"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cardname": cardname,
    "price": price,
    "expireDateNumber": expireDateNumber,
    "image": image,
    "cardNumber": cardNumber,
    "id": id,
  };
}
