// To parse this JSON data, do
//
//     final stkExpireList = stkExpireListFromJson(jsonString);

import 'dart:convert';

List<StkExpireList> stkExpireListFromJson(String str) => List<StkExpireList>.from(json.decode(str).map((x) => StkExpireList.fromJson(x)));



String stkExpireListToJson(List<StkExpireList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StkExpireList {
    int exR;
    DateTime? asOfDate;
    String? skuCode;
    DateTime? expDate;
    double? exQty;
    double? exCost;
    String? skuDesc;
    String? stkUnit;
    String? productId;
    int? purLeadTime;
    String? supplier;
    String? category;

    StkExpireList({
        required this.exR,
        required this.asOfDate,
        required this.skuCode,
        required this.expDate,
        required this.exQty,
        required this.exCost,
        required this.skuDesc,
        required this.stkUnit,
        required this.productId,
        required this.purLeadTime,
        required this.supplier,
        required this.category,
    });

    factory StkExpireList.fromJson(Map<String, dynamic> json) => StkExpireList(
        exR: json["exR"],
        asOfDate: DateTime.parse(json["asOfDate"]),
        skuCode: json["skuCode"]??'',
        expDate: DateTime.parse(json["expDate"]),
        exQty: json["exQty"]?.toDouble()??0,
        exCost: json["exCost"]?.toDouble()??0,
        skuDesc: json["skuDesc"]??'',
        stkUnit: json["stkUnit"]??'',
        productId: json["productID"]??'',
        purLeadTime: json["purLeadTime"],
        supplier: json["supplier"] ?? '',
        category: json["category"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "exR": exR,
        "asOfDate": asOfDate!.toIso8601String(),
        "skuCode": skuCode,
        "expDate": expDate!.toIso8601String(),
        "exQty": exQty,
        "exCost": exCost,
        "skuDesc": skuDesc,
        "stkUnit": stkUnit,
        "productID": productId,
        "purLeadTime": purLeadTime,
        "supplier": supplier,
        "category": category,
    };

   
 
}

