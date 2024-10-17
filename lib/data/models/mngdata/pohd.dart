// To parse this JSON data, do
//
//     final mpo = mpoFromJson(jsonString);

import 'dart:convert';

List<PoHd> mpoFromJson(String str) =>
    List<PoHd>.from(json.decode(str).map((x) => PoHd.fromJson(x)));

String mpoToJson(List<PoHd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoHd {
  int id;
  int referQryId;
  String mpono;
  DateTime mpodate;
  String supplId;
  String supplName;
  String supplAddres1;
  String supplRemark;
  String supplTel;
  String supTaxId;
  DateTime dueDate;
  int creditTerm;
  String bookBankNo;
  String bookBankName;
  double orderAmt;
  int orderStatus;
  String remark;

  PoHd({
    required this.id,
    required this.referQryId,
    required this.mpono,
    required this.mpodate,
    required this.supplId,
    required this.supplName,
    required this.supplAddres1,
    required this.supplRemark,
    required this.supplTel,
    required this.supTaxId,
    required this.dueDate,
    required this.creditTerm,
    required this.bookBankNo,
    required this.bookBankName,
    required this.orderAmt,
    required this.orderStatus,
    required this.remark,
  });

  factory PoHd.fromJson(Map<String, dynamic> json) => PoHd(
      id: json["id"],
      referQryId: json["referQryId"],
      mpono: json["mpono"],
      mpodate: DateTime.parse(json["mpodate"]),
      supplId: json["supplId"],
      supplName: json["supplName"],
      supplAddres1: (json["supplAddres1"] == null) ? '' : json["supplAddres1"],
      supplRemark: (json["supplRemark"] == null) ? '' : json["supplRemark"],
      supplTel: (json["supplTel"] == null) ? '' : json["supplTel"],
      supTaxId: (json["supTaxId"] == null) ? '' : json["supTaxId"],
      dueDate: DateTime.parse(json["dueDate"]
          .toString()
          .split('T')[0]), //DateTime.parse(json["dueDate"]),
      creditTerm: (json["creditTerm"] == null) ? 0 : json["creditTerm"],
      bookBankNo: (json["bookBankNo"] == null) ? '' : json["bookBankNo"],
      bookBankName: (json["bookBankName"] == null) ? '' : json["bookBankName"],
      orderAmt: json["orderAmt"]?.toDouble(),
      orderStatus: json["orderStatus"],
      remark: (json["remark"] == null) ? '' : json["remark"]);

  Map<String, String> toJson2() => {
        "id": '0',
        "referQryId": referQryId.toString(),
        "mpono": mpono,
        "mpodate": mpodate.toIso8601String(),
        "supplId": supplId,
        "supplName": supplName,
        "supplAddres1": supplAddres1,
        "supplRemark": supplRemark,
        "supplTel": supplTel,
        "supTaxId": supTaxId,
        "dueDate": dueDate.toIso8601String(),
        "creditTerm": creditTerm.toString(),
        "bookBankNo": bookBankNo,
        "bookBankName": bookBankName,
        "orderAmt": orderAmt.toString(),
        "orderStatus": orderStatus.toString(),
        "remark": remark,
      };
  Map<String, dynamic> toJson() => {
        "id": id,
        "referQryId": referQryId,
        "mpono": mpono,
        "mpodate": mpodate.toIso8601String(),
        "supplId": supplId,
        "supplName": supplName,
        "supplAddres1": supplAddres1,
        "supplRemark": supplRemark,
        "supplTel": supplTel,
        "supTaxId": supTaxId,
        "dueDate": dueDate.toIso8601String(),
        "creditTerm": creditTerm,
        "bookBankNo": bookBankNo,
        "bookBankName": bookBankName,
        "orderAmt": orderAmt,
        "orderStatus": orderStatus,
        "remark": remark,
      };
}
