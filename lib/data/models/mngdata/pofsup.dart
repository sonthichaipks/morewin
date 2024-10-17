// To parse this JSON data, do
//
//     final poFsup = poFsupFromJson(jsonString);
//https://localhost:44381/POF/SPR-677/xxx/sup/1/2
import 'dart:convert';

List<PoFsup> poFsupFromJson(String str) =>
    List<PoFsup>.from(json.decode(str).map((x) => PoFsup.fromJson(x)));

String poFsupToJson(List<PoFsup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoFsup {
  String supplId;
  String skuCode;
  String skuDesc;
  String purUnit;
  String stkUnit;
  double mpoQty;
  double purUnitRatio;
  double rcvPurQty;

  PoFsup({
    required this.supplId,
    required this.skuCode,
    required this.skuDesc,
    required this.purUnit,
    required this.stkUnit,
    required this.mpoQty,
    required this.purUnitRatio,
    required this.rcvPurQty,
  });

  factory PoFsup.fromJson(Map<String, dynamic> json) => PoFsup(
        supplId: json["supplId"],
        skuCode: json["skuCode"],
        skuDesc: json["skuDesc"],
        purUnit: json["purUnit"],
        stkUnit: json["stkUnit"],
        mpoQty: json["mpoQty"]?.toDouble(),
        purUnitRatio: json["purUnitRatio"]?.toDouble(),
        rcvPurQty: json["rcvPurQty"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "supplId": supplId,
        "skuCode": skuCode,
        "skuDesc": skuDesc,
        "purUnit": purUnit,
        "stkUnit": stkUnit,
        "mpoQty": mpoQty,
        "purUnitRatio": purUnitRatio,
        "rcvPurQty": rcvPurQty,
      };
}
