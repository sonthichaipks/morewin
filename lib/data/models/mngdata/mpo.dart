// To parse this JSON data, do
//
//     final mpo = mpoFromJson(jsonString);

import 'dart:convert';

List<Mpo> mpoFromJson(String str) => List<Mpo>.from(json.decode(str).map((x) => Mpo.fromJson(x)));

String mpoToJson(List<Mpo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mpo {
    int id;
    int referQryId;
    String mpono;
    // DateTime mpodate;
    String supplId;
    // String supplName;
    // String supplAddres1;
    // String supplRemark;
    // String supplTel;
    // String supTaxId;
   // DateTime dueDate;
    int creditTerm;
    String bookBankNo;
    String bookBankName;
    double orderAmt;
    int orderStatus;
    String remark;

    Mpo({
        required this.id,
        required this.referQryId,
        required this.mpono,
        // required this.mpodate,
        required this.supplId,
        // required this.supplName,
        // required this.supplAddres1,
        // required this.supplRemark,
        // required this.supplTel,
        // required this.supTaxId,
     //   required this.dueDate,
        required this.creditTerm,
        required this.bookBankNo,
        required this.bookBankName,
        required this.orderAmt,
        required this.orderStatus,
        required this.remark,
    });

    factory Mpo.fromJson(Map<String, dynamic> json) => Mpo(
        id: json["id"],
        referQryId: json["referQryId"],
        mpono: json["mpono"],
        // mpodate: DateTime.parse(json["mpodate"]),
        supplId: json["supplId"],
        // supplName: json["supplName"],
        // supplAddres1: json["supplAddres1"],
        // supplRemark: json["supplRemark"],
        // supplTel: json["supplTel"],
        // supTaxId: json["supTaxId"],
       // dueDate: DateTime.parse(json["dueDate"]),
        creditTerm: json["creditTerm"],
        bookBankNo: json["bookBankNo"],
        bookBankName: json["bookBankName"],
        orderAmt: json["orderAmt"]?.toDouble(),
        orderStatus: json["orderStatus"],
        remark: json["remark"],
    );

 Map<String, String> toJson2() => {
        "id": '0',
        "referQryId": referQryId.toString(),
        "mpono": mpono,
        // "mpodate": mpodate.toIso8601String(),
        "supplId": supplId,
        // "supplName": supplName,
        // "supplAddres1": supplAddres1,
        // "supplRemark": supplRemark,
        // "supplTel": supplTel,
        // "supTaxId": supTaxId,
        //"dueDate": dueDate.toIso8601String(),
        "creditTerm": creditTerm.toString(),
        "bookBankNo": bookBankNo,
        "bookBankName": bookBankName,
        "orderAmt": orderAmt.toString(),
        "orderStatus": orderStatus.toString(),
        "remark": remark,
    };
    Map<String, dynamic> toJson() => {
        // "id": id,
        "referQryId": referQryId,
        "mpono": mpono,
        // "mpodate": mpodate.toIso8601String(),
        "supplId": supplId,
        // "supplName": supplName,
        // "supplAddres1": supplAddres1,
        // "supplRemark": supplRemark,
        // "supplTel": supplTel,
        // "supTaxId": supTaxId,
       // "dueDate": dueDate.toIso8601String(),
        "creditTerm": creditTerm,
        "bookBankNo": bookBankNo,
        "bookBankName": bookBankName,
        "orderAmt": orderAmt,
        "orderStatus": orderStatus,
        "remark": remark,
    };
}
