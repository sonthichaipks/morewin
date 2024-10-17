// To parse this JSON data, do
//
//     final PrHeader = PrHeaderFromJson(jsonString);

import 'dart:convert';

List<PrHeader> PrHeaderFromJson(String str) =>
    List<PrHeader>.from(json.decode(str).map((x) => PrHeader.fromJson(x)));

String PrHeaderToJson(List<PrHeader> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrHeader {
  PrHeader({
    required this.docNo,
    required this.docDate,
    required this.docType,
    required this.refDocNo,
    required this.taxInvName,
    required this.taxInvAddressLine1,
    required this.taxInvAddressLine2,
    required this.taxInvAddressLine3,
    required this.taxId,
    required this.salesVatType,
    required this.grossAmt,
    required this.discountAmt,
    required this.chargeAmt,
    required this.netAmt,
    required this.vatAmt,
    required this.noOfPrint,
    required this.createBy,
    required this.createDate,
    required this.updateBy,
    required this.lastUpdate,
    required this.id,
  });

  String docNo;
  DateTime docDate;
  String docType;
  String refDocNo;
  String taxInvName;
  String taxInvAddressLine1;
  String taxInvAddressLine2;
  String taxInvAddressLine3;
  String taxId;
  String salesVatType;
  double grossAmt;
  double discountAmt;
  double chargeAmt;
  double netAmt;
  double vatAmt;
  int noOfPrint;
  String createBy;
  DateTime createDate;
  String updateBy;
  DateTime lastUpdate;
  int id;

  factory PrHeader.fromJson(Map<String, dynamic> json) => PrHeader(
        docNo: json["docNo"],
        docDate: DateTime.parse(json["docDate"]),
        docType: json["docType"],
        refDocNo: json["refDocNo"],
        taxInvName: json["taxInvName"],
        taxInvAddressLine1: json["taxInvAddressLine1"],
        taxInvAddressLine2: json["taxInvAddressLine2"],
        taxInvAddressLine3: json["taxInvAddressLine3"],
        taxId: json["taxId"],
        salesVatType: json["salesVatType"],
        grossAmt: json["grossAmt"].toDouble(),
        discountAmt: json["discountAmt"].toDouble(),
        chargeAmt: json["chargeAmt"].toDouble(),
        netAmt: json["netAmt"].toDouble(),
        vatAmt: json["vatAmt"].toDouble(),
        noOfPrint: json["noOfPrint"],
        createBy: json["createBy"],
        createDate: DateTime.parse(json["createDate"]),
        updateBy: json["updateBy"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "docNo": docNo,
        "docDate": docDate.toIso8601String(),
        "docType": docType,
        "refDocNo": refDocNo,
        "taxInvName": taxInvName,
        "taxInvAddressLine1": taxInvAddressLine1,
        "taxInvAddressLine2": taxInvAddressLine2,
        "taxInvAddressLine3": taxInvAddressLine3,
        "taxId": taxId,
        "salesVatType": salesVatType,
        "grossAmt": grossAmt,
        "discountAmt": discountAmt,
        "chargeAmt": chargeAmt,
        "netAmt": netAmt,
        "vatAmt": vatAmt,
        "noOfPrint": noOfPrint,
        "createBy": createBy,
        "createDate": createDate.toIso8601String(),
        "updateBy": updateBy,
        "lastUpdate": lastUpdate.toIso8601String(),
        "id": id,
      };
}

class ItemSummary {
  ItemSummary(
      this.itemcount,
      this.discitemcount,
      this.totalqty,
      this.totaldisc,
      this.totalchagre,
      this.totalamount,
      this.totalvat,
      this.lsalesitem,
      this.ldischgitem,
      this.lreceiptitem);
  // this.totalcharge);
  final int itemcount;
  final int discitemcount;
  final double totalqty;
  final double totaldisc;
  final double totalchagre;
  final double totalamount;
  final double totalvat;
  final int lsalesitem;
  final int ldischgitem;
  final int lreceiptitem;
  //final double totalcharge;
}
