import 'dart:convert';

class PromotionModel {
  String? icon;
  String? value;
  String? title;

  PromotionModel({this.icon, this.value, this.title});

  factory PromotionModel.fromRawJson(String str) =>
      PromotionModel.fromJson(json.decode(str));

  factory PromotionModel.fromJson(Map<String, dynamic> json) => PromotionModel(
        icon: json["icon"],
        value: json["value"],
        title: json["title"],
      );
}

class ProdListModel {
  String? icon;
  String? pludesc;
  String? plucode;
  double? price;
  String? pluunit;
  int? favorite;
  double? addQty;

  ProdListModel(
      {this.icon,
      this.pludesc,
      this.plucode,
      this.price,
      this.pluunit,
      this.favorite,
      this.addQty = 0});

  factory ProdListModel.fromRawJson(String str) =>
      ProdListModel.fromJson(json.decode(str));

  factory ProdListModel.fromJson(Map<String, dynamic> json) => ProdListModel(
        icon: json["icon"],
        pludesc: json["pludesc"],
        plucode: json["plucode"],
        price: json["price"]?.toDouble(),
        pluunit: json["pluunit"],
        favorite: json["favorite"],
        addQty: json["addQty"]?.toDouble(),
      );
}
