// To parse this JSON data, do
//
//     final poItems = poItemsFromJson(jsonString);

import 'dart:convert';

List<PoItems> poItemsFromJson(String str) => List<PoItems>.from(json.decode(str).map((x) => PoItems.fromJson(x)));

String poItemsToJson(List<PoItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoItems {
    int referQryId;
    int id;
    String mpoNo;
    String skuCode;
    String pluCode;
    String itemDesc;
    double mpoQty;
    String purUnit;
    double mpOprice;
    double mpOamount;
    String deliveryNote;
    double plans;
    double goal;
    double reqQty;
    double purSelUnitRatio;
    String stkUnit;

    PoItems({
        required this.referQryId,
        required this.id,
        required this.mpoNo,
        required this.skuCode,
        required this.pluCode,
        required this.itemDesc,
        required this.mpoQty,
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

    factory PoItems.fromJson(Map<String, dynamic> json) => PoItems(
        referQryId: json["referQryId"],
        id: json["id"],
        mpoNo: json["mpoNo"],
        skuCode: json["skuCode"],
        pluCode: json["pluCode"],
        itemDesc: json["itemDesc"],
        mpoQty: json["mpoQty"]?.toDouble(),
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
        "id": id,
        "mpoNo": mpoNo,
        "skuCode": skuCode,
        "pluCode": pluCode,
        "itemDesc": itemDesc,
        "mpoQty": mpoQty,
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
