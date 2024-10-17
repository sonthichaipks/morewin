// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

List<Lookup> lookupFromJson(String str) =>
    List<Lookup>.from(json.decode(str).map((x) => Lookup.fromJson(x)));

String lookupToJson(List<Lookup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lookup {
  String Code;
  String Mode;

  Lookup({
    required this.Code,
    required this.Mode,
  });

  factory Lookup.fromJson(Map<String, dynamic> json) => Lookup(
        Code: json["Code"],
        Mode: json["Mode"],
      );

  Map<String, dynamic> toJson() => {
        "Code": Code,
        "Mode": Mode,
      };
}
