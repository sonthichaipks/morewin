// To parse this JSON data, do
//
//     final poItemFormula = poItemFormulaFromJson(jsonString);

import 'dart:convert';

List<PoItemFormula> poItemFormulaFromJson(String str) => List<PoItemFormula>.from(json.decode(str).map((x) => PoItemFormula.fromJson(x)));

String poItemFormulaToJson(List<PoItemFormula> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoItemFormula {
    int qryId;
    String mpono;
    String skuCode;
    String pluCode;
    String deliveNote;
    double lastPurPrice;
    double purSelUnitRatio;
    double plans;
    double goal;
    double reqQty;
    double planQty;
    double salesamount;

    PoItemFormula({
        required this.qryId,
        required this.mpono,
        required this.skuCode,
        required this.pluCode,
        required this.deliveNote,
        required this.lastPurPrice,
        required this.purSelUnitRatio,
        required this.plans,
        required this.goal,
        required this.reqQty,
        required this.planQty,
        required this.salesamount,
    });

    factory PoItemFormula.fromJson(Map<String, dynamic> json) => PoItemFormula(
        qryId: json["qryId"],
        mpono: json["mpono"],
        skuCode: json["skuCode"],
        pluCode: json["pluCode"],
        deliveNote: json["deliveNote"],
        lastPurPrice: json["lastPurPrice"]?.toDouble(),
        purSelUnitRatio: json["purSelUnitRatio"]?.toDouble(),
        plans: json["plans"]?.toDouble(),
        goal: json["goal"]?.toDouble(),
        reqQty: json["reqQty"]?.toDouble(),
        planQty: json["planQty"]?.toDouble(),
        salesamount: json["salesamount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "qryId": qryId,
        "mpono": mpono,
        "skuCode": skuCode,
        "pluCode": pluCode,
        "deliveNote": deliveNote,
        "lastPurPrice": lastPurPrice,
        "purSelUnitRatio": purSelUnitRatio,
        "plans": plans,
        "goal": goal,
        "reqQty": reqQty,
        "planQty": planQty,
        "salesamount": salesamount,
    };
}
