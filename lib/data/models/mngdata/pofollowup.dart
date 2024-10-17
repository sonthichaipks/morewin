// To parse this JSON data, do
//
//     final poFollowup = poFollowupFromJson(jsonString);

import 'dart:convert';

List<PoFollowup> poFollowupFromJson(String str) => List<PoFollowup>.from(json.decode(str).map((x) => PoFollowup.fromJson(x)));

String poFollowupToJson(List<PoFollowup> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoFollowup {
    int referQryId;
    String supplId;
    dynamic supplName;
    String catCode;
    String mpoNo;
    DateTime mpoDate;
    String skuCode;
    String pluCode;
    String itemDesc;
    double mpoQty;
    double instock;
    String lastRcvNo;
    DateTime lastChecked;
    String purUnit;
    double mpOprice;
    double mpOamount;
    String deliveryNote;
    double plans;
    double goal;
    double reqQty;
    double purSelUnitRatio;
    String stkUnit;

    PoFollowup({
        required this.referQryId,
        required this.supplId,
        required this.supplName,
        required this.catCode,
        required this.mpoNo,
        required this.mpoDate,
        required this.skuCode,
        required this.pluCode,
        required this.itemDesc,
        required this.mpoQty,
        required this.instock,
        required this.lastRcvNo,
        required this.lastChecked,
        required this.purUnit,
        required this.mpOprice,
        required this.mpOamount,
        required this.deliveryNote,
        required this.plans,
        required this.goal,
        required this.reqQty,
        required this.purSelUnitRatio,
        required this.stkUnit,
    });

    factory PoFollowup.fromJson(Map<String, dynamic> json) => PoFollowup(
        referQryId: json["referQryId"],
        supplId: json["supplId"],
        supplName: (json["supplName"]==null)?'':json["supplName"],
        catCode: json["catCode"],
        mpoNo: json["mpoNo"],
        mpoDate: DateTime.parse(json["mpoDate"]),
        skuCode: json["skuCode"],
        pluCode: json["pluCode"],
        itemDesc: json["itemDesc"],
        mpoQty: json["mpoQty"]?.toDouble(),
        instock: json["instock"]?.toDouble(),
        lastRcvNo: (json["lastRcvNo"]==null)?'':json["lastRcvNo"],
        lastChecked: DateTime.parse(json["lastChecked"]),
        purUnit: json["purUnit"],
        mpOprice: json["mpOprice"]?.toDouble(),
        mpOamount: json["mpOamount"]?.toDouble(),
        deliveryNote: json["deliveryNote"],
        plans: json["plans"]?.toDouble(),
        goal: json["goal"]?.toDouble(),
        reqQty: json["reqQty"]?.toDouble(),
        purSelUnitRatio: json["purSelUnitRatio"]?.toDouble(),
        stkUnit: json["stkUnit"],
    );

    Map<String, dynamic> toJson() => {
        "referQryId": referQryId,
        "supplId": supplId,
        "supplName": supplName,
        "catCode": catCode,
        "mpoNo": mpoNo,
        "mpoDate": mpoDate.toIso8601String(),
        "skuCode": skuCode,
        "pluCode": pluCode,
        "itemDesc": itemDesc,
        "mpoQty": mpoQty,
        "instock": instock,
        "lastRcvNo": lastRcvNo,
        "lastChecked": lastChecked.toIso8601String(),
        "purUnit": purUnit,
        "mpOprice": mpOprice,
        "mpOamount": mpOamount,
        "deliveryNote": deliveryNote,
        "plans": plans,
        "goal": goal,
        "reqQty": reqQty,
        "purSelUnitRatio": purSelUnitRatio,
        "stkUnit": stkUnit,
    };
}
