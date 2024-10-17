// To parse this JSON data, do
//
//     final mpoItFormula = mpoItFormulaFromJson(jsonString);

import 'dart:convert';

List<MpoItFormula> mpoItFormulaFromJson(String str) => List<MpoItFormula>.from(json.decode(str).map((x) => MpoItFormula.fromJson(x)));

String mpoItFormulaToJson(List<MpoItFormula> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MpoItFormula {
    int qryId;
    String mpono;
    // DateTime mpodate;
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

    MpoItFormula({
        required this.qryId,
        required this.mpono,
        // required this.mpodate,
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

    factory MpoItFormula.fromJson(Map<String, dynamic> json) => MpoItFormula(
        qryId: json["qryId"],
        mpono: json["mpono"],
        // mpodate: DateTime.parse(json["mpodate"]),
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
Map<String, String> toJson2() => {
        "qryId": qryId.toString(),
        "mpono": mpono,
        // "mpodate": mpodate.toIso8601String(),
        "skuCode": skuCode,
        "pluCode": pluCode,
        "deliveNote": deliveNote,
        "lastPurPrice": lastPurPrice.toString(),
        "purSelUnitRatio": purSelUnitRatio.toString(),
        "plans": plans.toString(),
        "goal": goal.toString(),
        "reqQty": reqQty.toString(),
        "planQty": planQty.toString(),
        "salesamount": salesamount.toString(),
    };
    Map<String, dynamic> toJson() => {
        "qryId": qryId.toString(),
        "mpono": mpono,
        // "mpodate": mpodate.toIso8601String(),
        "skuCode": skuCode,
        "pluCode": pluCode,
        "deliveNote": deliveNote,
        "lastPurPrice": lastPurPrice.toString(),
        "purSelUnitRatio": purSelUnitRatio.toString(),
        "plans": plans.toString(),
        "goal": goal.toString(),
        "reqQty": reqQty.toString(),
        "planQty": planQty.toString(),
        "salesamount": salesamount.toString(),
    };
}
