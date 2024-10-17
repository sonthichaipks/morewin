// To parse this JSON data, do
//
//     final mpoItems = mpoItemsFromJson(jsonString);

import 'dart:convert';

List<MpoItems> mpoItemsFromJson(String str) => List<MpoItems>.from(json.decode(str).map((x) => MpoItems.fromJson(x)));

String mpoItemsToJson(List<MpoItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MpoItems {
    int id;
    String mpono;
    // DateTime mpodate;
    String skuCode;
    String pluCode;
    String itemDesc;
    String stkUnit;
    String purUnit;
    double mpoqty;
    double mpoprice;
    double mpoamount;
    //String lrcvno;
    //DateTime lrcvdate;
    //double srcvqty;
    int mpostatus;

    MpoItems({
        required this.id,
        required this.mpono,
        // required this.mpodate,
        required this.skuCode,
        required this.pluCode,
        required this.itemDesc,
        required this.stkUnit,
        required this.purUnit,
        required this.mpoqty,
        required this.mpoprice,
        required this.mpoamount,
      //  required this.lrcvno,
      //  required this.lrcvdate,
      //  required this.srcvqty,
        required this.mpostatus,
    });

    factory MpoItems.fromJson(Map<String, dynamic> json) => MpoItems(
        id: json["id"],
        mpono: json["mpono"],
        // mpodate: DateTime.parse(json["mpodate"]),
        skuCode: json["skuCode"],
        pluCode: json["pluCode"] ?? '',
        itemDesc: json["itemDesc"] ?? '',
        stkUnit: json["stkUnit"] ?? '',
        purUnit: json["purUnit"] ?? '',
        mpoqty: json["mpoqty"]?.toDouble(),
        mpoprice: json["mpoprice"]?.toDouble(),
        mpoamount: json["mpoamount"]?.toDouble(),
        // lrcvno: json["lrcvno"],
        // lrcvdate: DateTime.parse(json["lrcvdate"]),
        // srcvqty: json["srcvqty"]?.toDouble(),
        mpostatus: json["mpostatus"],
    );
//---for add / update only
    Map<String, String> toJson2() => {
        "id": id.toString(),
        "mpono": mpono,
        //"mpodate": mpodate.toIso8601String(),
        "skuCode": skuCode,
        "pluCode": pluCode,
        "itemDesc": itemDesc,
        "stkUnit": stkUnit,
        "purUnit": purUnit,
        "mpoqty": mpoqty.toString(),
        "mpoprice": mpoprice.toString(),
        "mpoamount": mpoamount.toString(),
       // "lrcvno": lrcvno,
        //"lrcvdate": lrcvdate.toIso8601String(),
       // "srcvqty": srcvqty.toString(),
        "mpostatus": mpostatus.toString(),
    };
    Map<String, dynamic> toJson() => {
        "id": id,
        "mpono": mpono,
        // "mpodate": mpodate.toIso8601String(),
        "skuCode": skuCode,
        "pluCode": pluCode,
        "itemDesc": itemDesc,
        "stkUnit": stkUnit,
        "purUnit": purUnit,
        "mpoqty": mpoqty,
        "mpoprice": mpoprice,
        "mpoamount": mpoamount,
        // "lrcvno": lrcvno,
        // "lrcvdate": lrcvdate.toIso8601String(),
        // "srcvqty": srcvqty,
        "mpostatus": mpostatus,
    };
}
