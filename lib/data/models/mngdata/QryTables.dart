// To parse this JSON data, do
//
//     final prQryTables = prQryTablesFromJson(jsonString);

import 'dart:convert';

List<PrQryTables> prQryTablesFromJson(String str) => List<PrQryTables>.from(
    json.decode(str).map((x) => PrQryTables.fromJson(x)));

String prQryTablesToJson(List<PrQryTables> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrQryTables {
  int id;
  int qryId;
  int qryNumber;
  String salShop;
  String code;
  int qryCount;
  double sumQty;
  int selected;

  PrQryTables({
    required this.id,
    required this.qryId,
    required this.qryNumber,
    required this.salShop,
    required this.code,
    required this.qryCount,
    required this.sumQty,
    required this.selected,
  });

  factory PrQryTables.fromJson(Map<String, dynamic> json) => PrQryTables(
        id: json["id"],
        qryId: json["qryId"],
        qryNumber: json["qryNumber"],
        salShop: (json["salShop"] == null) ? '' : json["salShop"],
        code: (json["code"] == null) ? '' : json["code"],
        qryCount: json["qryCount"],
        sumQty: json["sumQty"]?.toDouble(),
        selected: json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qryId": qryId,
        "qryNumber": qryNumber,
        "salShop": salShop,
        "code": code,
        "qryCount": qryCount,
        "sumQty": sumQty,
        "selected": selected,
      };
}
