// To parse this JSON data, do
//
//     final poFrcv = poFrcvFromJson(jsonString);
//https://localhost:44381/POF/SPR-677/8850999141008/rcv

import 'dart:convert';

List<PoFrcv> poFrcvFromJson(String str) => List<PoFrcv>.from(json.decode(str).map((x) => PoFrcv.fromJson(x)));

String poFrcvToJson(List<PoFrcv> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoFrcv {
    DateTime docDate;
    DateTime tranDate;
    String docNo;
    String supplId;
    String skuCode;
    double rcvPurQty;

    PoFrcv({
        required this.docDate,
        required this.tranDate,
        required this.docNo,
        required this.supplId,
        required this.skuCode,
        required this.rcvPurQty,
    });

    factory PoFrcv.fromJson(Map<String, dynamic> json) => PoFrcv(
        docDate: DateTime.parse(json["docDate"]),
        tranDate: DateTime.parse(json["tranDate"]),
        docNo: json["docNo"],
        supplId: json["supplId"],
        skuCode: json["skuCode"],
        rcvPurQty: json["rcvPurQty"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "docDate": docDate.toIso8601String(),
        "tranDate": tranDate.toIso8601String(),
        "docNo": docNo,
        "supplId": supplId,
        "skuCode": skuCode,
        "rcvPurQty": rcvPurQty,
    };
}
