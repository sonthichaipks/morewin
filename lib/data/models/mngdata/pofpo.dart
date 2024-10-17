// https://localhost:44381/POF/SPR-677/8850999141008/po/1

// To parse this JSON data, do
//
//     final poFpo = poFpoFromJson(jsonString);

import 'dart:convert';

List<PoFpo> poFpoFromJson(String str) => List<PoFpo>.from(json.decode(str).map((x) => PoFpo.fromJson(x)));

String poFpoToJson(List<PoFpo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoFpo {
    String supplId;
    DateTime mpoDate;
    String mpoNo;
    String skuCode;
    double mpoQty;
    String remark;
    String free;

    PoFpo({
        required this.supplId,
        required this.mpoDate,
        required this.mpoNo,
        required this.skuCode,
        required this.mpoQty,
        required this.remark,
        required this.free,
    });

    factory PoFpo.fromJson(Map<String, dynamic> json) => PoFpo(
        supplId: json["supplId"],
        mpoDate: DateTime.parse(json["mpoDate"]),
        mpoNo: json["mpoNo"],
        skuCode: json["skuCode"],
        mpoQty: json["mpoQty"]?.toDouble(),
        remark: json["remark"],
        free: json["free"],
    );

    Map<String, dynamic> toJson() => {
        "supplId": supplId,
        "mpoDate": mpoDate.toIso8601String(),
        "mpoNo": mpoNo,
        "skuCode": skuCode,
        "mpoQty": mpoQty,
        "remark": remark,
        "free": free,
    };
}
