// To parse this JSON data, do
//
//     final prFormula = prFormulaFromJson(jsonString);

import 'dart:convert';

// import 'package:momostore/utils/fnc_provider.dart';

List<PrFormula> prFormulaFromJson(String str) =>
    List<PrFormula>.from(json.decode(str).map((x) => PrFormula.fromJson(x)));

String prFormulaToJson(List<PrFormula> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrFormula {
  int? qryId;
  // DateTime dateBegin;
  // DateTime dateEnd;
  String? skuCode;
  String? skuDesc;
  String? pluShortDesc;
  String? pluCode;
  String? sellUnit;
  double? sellUnitRatio;
  String? purUnit;
  double? purUnitRatio;
  double? lastPurPrice;
  double? unitSellPurRate;
  // String? style;
  // String? size;
  String? vendor;
  // String? taste;
  // String? brand;
  String? category;
  // String? subcat1Name;
  // String? subcat2Name;
  String? branch;
  double? plans;
  double? goal;
  double? reqQty;
  double? avgPrice;
  double? sumPrice;
  double?
      salesamount; //apply to newplan purchase amount = planqty * lastPurPrice //16-5-24 updated
  String? stkUnit;
  double? onhandQty;
  double? costOnHand;
  double? costAvg;
  double? planQty;

  PrFormula({
    required this.qryId,
    // required this.dateBegin,
    // required this.dateEnd,
    required this.skuCode,
    required this.skuDesc,
    required this.pluShortDesc,
    required this.pluCode,
    required this.sellUnit,
    required this.sellUnitRatio,
    required this.purUnit,
    required this.purUnitRatio,
    required this.lastPurPrice,
    required this.unitSellPurRate,
    // required this.style,
    // required this.size,
    required this.vendor,
    // required this.taste,
    // required this.brand,
    required this.category,
    // required this.subcat1Name,
    // required this.subcat2Name,
    required this.branch,
    required this.plans,
    required this.goal,
    required this.reqQty,
    required this.avgPrice,
    required this.sumPrice,
    required this.salesamount,
    required this.stkUnit,
    required this.onhandQty,
    required this.costOnHand,
    required this.costAvg,
    required this.planQty,
  });

  // String getIndex(int index) {
  //   switch (index) {
  //     case 0:
  //       return (pluCode.isEmpty) ? '' : cno.format(qryId).padLeft(5);
  //     case 1:
  //       return (pluCode.isEmpty) ? '' : pluCode.padRight(15).substring(0, 14);
  //     case 2:
  //       return pluShortDesc.split(',')[0].padRight(40).substring(0, 39);
  //     case 3:
  //       return (pluCode.isEmpty) ? '' : oCcy.format(planQty).padLeft(10, " ");

  //     case 4:
  //       return (pluCode.isEmpty) ? '' : pluShortDesc.split(',')[1];
  //     case 5:
  //       return (pluCode.isEmpty)
  //           ? ''
  //           : oCcy.format(lastPurPrice).padLeft(12, " ");
  //     case 6:
  //       return '0.00';
  //     // ((pluCode.isEmpty)
  //     //     ? oCcy
  //     //         .format(chargeAmt - discamt)
  //     //         .padLeft(15, " ")
  //     //         .padRight(24, " ")
  //     //     : oCcy.format(exPrice).padLeft(16, " ") +
  //     //         itemVatType.padLeft(5, ' ').padRight(7, ' '));
  //   }
  //   return '';
  // }

  factory PrFormula.fromJson(Map<String, dynamic> json) => PrFormula(
        qryId: json["qryId"]??0,
        // dateBegin: DateTime.parse(json["dateBegin"]),
        // dateEnd: DateTime.parse(json["dateEnd"]),
        skuCode: json["skuCode"]??'',
        skuDesc: json["skuDesc"]??'',
        pluShortDesc: json["pluShortDesc"] ?? '',
        pluCode: json["pluCode"] ?? '',
        sellUnit: json["sellUnit"] ?? '',
        sellUnitRatio: (json["sellUnitRatio"] ?? 0).toDouble(),
        purUnit: json["purUnit"] ?? '',
        purUnitRatio: (json["purUnitRatio"] ?? 0).toDouble(),
        lastPurPrice: (json["lastPurPrice"] ?? 0).toDouble(),
        unitSellPurRate: (json["unitSellPurRate"]??0).toDouble(),
        // style: (json["style"] ??''),
        // size: (json["size"] ??''),
        vendor: (json["vendor"] ?? ''),
        // taste: (json["taste"] ??''),
        // brand: json["brand"] ??'',
        category: json["category"] ?? '',
        // subcat1Name: json["subcat1Name"] ??'',
        // subcat2Name: json["subcat2Name"] ??'',
        branch: json["branch"] ?? '',
        plans: (json["plans"] ?? 0).toDouble(),
        goal: (json["goal"] ?? 0).toDouble(),
        reqQty: (json["reqQty"]??0).toDouble(),
        avgPrice: (json["avgPrice"]??0).toDouble(),
        sumPrice: (json["sumPrice"]??0).toDouble(),
        salesamount: (json["salesamount"]??0).toDouble(),
        stkUnit: json["stkUnit"]??'',
        onhandQty: (json["onhandQty"]??0).toDouble(),
        costOnHand: (json["costOnHand"]??0).toDouble(),
        costAvg: (json["costAvg"]??0).toDouble(),
        planQty: (json["planQty"]??0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "qryId": qryId,
        // "dateBegin": dateBegin.toIso8601String(),
        // "dateEnd": dateEnd.toIso8601String(),
        "skuCode": skuCode,
        "skuDesc": skuDesc,
        "pluShortDesc": pluShortDesc,
        "pluCode": pluCode,
        "sellUnit": sellUnit,
        "sellUnitRatio": sellUnitRatio,
        "purUnit": purUnit,
        "purUnitRatio": purUnitRatio,
        "lastPurPrice": lastPurPrice,
        "unitSellPurRate": unitSellPurRate,
        // "style": style,
        // "size": size,
        "vendor": vendor,
        // "taste": taste,
        // "brand": brand,
        "category": category,
        // "subcat1Name": subcat1Name,
        // "subcat2Name": subcat2Name,
        "branch": branch,
        "plans": plans,
        "goal": goal,
        "reqQty": reqQty,
        "avgPrice": avgPrice,
        "sumPrice": sumPrice,
        "salesamount": salesamount,
        "stkUnit": stkUnit,
        "onhandQty": onhandQty,
        "costOnHand": costOnHand,
        "costAvg": costAvg,
        "planQty": planQty,
      };
}
