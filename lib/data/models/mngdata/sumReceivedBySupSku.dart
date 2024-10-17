// To parse this JSON data, do
//
//     final sumReceivedBySupSku = sumReceivedBySupSkuFromJson(jsonString);

import 'dart:convert';

List<SumReceivedBySupSku> sumReceivedBySupSkuFromJson(String str) => List<SumReceivedBySupSku>.from(json.decode(str).map((x) => SumReceivedBySupSku.fromJson(x)));

String sumReceivedBySupSkuToJson(List<SumReceivedBySupSku> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SumReceivedBySupSku {
    DateTime fmDate;
    DateTime toDate;
    String supplId;
    String supplName;
    String skuCode;
    String skuDesc;
    double supplQty;
    String purUnit;
    double lastPurPrice;
    double supplAmt;
    double qtyInStkUnit;
    String stkUnit;
    String catCode;
    String catName;

    SumReceivedBySupSku({
        required this.fmDate,
        required this.toDate,
        required this.supplId,
        required this.supplName,
        required this.skuCode,
        required this.skuDesc,
        required this.supplQty,
        required this.purUnit,
        required this.lastPurPrice,
        required this.supplAmt,
        required this.qtyInStkUnit,
        required this.stkUnit,
        required this.catCode,
        required this.catName,
    });

    factory SumReceivedBySupSku.fromJson(Map<String, dynamic> json) => SumReceivedBySupSku(
        fmDate: DateTime.parse(json["fmDate"]),
        toDate: DateTime.parse(json["toDate"]),
        supplId: json["supplId"],
        supplName: json["supplName"],
        skuCode: json["skuCode"],
        skuDesc: json["skuDesc"],
        supplQty: json["supplQty"]?.toDouble(),
        purUnit: json["purUnit"],
        lastPurPrice:(json["lastPurPrice"]==null)?0: json["lastPurPrice"]?.toDouble(),
        supplAmt: json["supplAmt"]?.toDouble(),
        qtyInStkUnit: json["qtyInStkUnit"]?.toDouble(),
        stkUnit: json["stkUnit"],
        catCode: json["catCode"],
        catName: json["catName"],
    );

    Map<String, dynamic> toJson() => {
        "fmDate": fmDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
        "supplId": supplId,
        "supplName": supplName,
        "skuCode": skuCode,
        "skuDesc": skuDesc,
        "supplQty": supplQty,
        "purUnit": purUnit,
        "lastPurPrice": lastPurPrice,
        "supplAmt": supplAmt,
        "qtyInStkUnit": qtyInStkUnit,
        "stkUnit": stkUnit,
        "catCode": catCode,
        "catName": catName,
    };
}
