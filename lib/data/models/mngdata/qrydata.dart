// To parse this JSON data, do
//
//     final qryData = qryDataFromJson(jsonString);

import 'dart:convert';

List<QryData> qryDataFromJson(String str) {
  List<QryData> result = [];
  try {
    str = '[$str]';
    result =
        List<QryData>.from(json.decode(str).map((x) => QryData.fromJson(x)));
  } catch (e) {
    result = [];
  }
  return result;
}

String qryDataToJson(List<QryData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QryData {
  int id;
  String menu;
  double goal;
  double plan;
  DateTime dateBegin;
  DateTime dateEnd;

  QryData({
    required this.id,
    required this.menu,
    required this.goal,
    required this.plan,
    required this.dateBegin,
    required this.dateEnd,
  });

  factory QryData.fromJson(Map<String, dynamic> json) => QryData(
        id: json["id"],
        menu: (json["menu"] == null) ? '' : json["menu"],
        goal: json["goal"]?.toDouble(),
        plan: json["plan"]?.toDouble(),
        dateBegin: DateTime.parse(json["dateBegin"].toString().split('T')[0]),
        dateEnd: DateTime.parse(json["dateEnd"].toString().split('T')[0]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menu": menu,
        "goal": goal,
        "plan": plan,
        "dateBegin": dateBegin.toIso8601String(),
        "dateEnd": dateEnd.toIso8601String(),
      };
}

//---------------------------------------------EndMonth Process Model
List<QryDash> qryDashFromJson(String str) {
  List<QryDash> result = [];
  try {
    str = '[$str]';
    result =
        List<QryDash>.from(json.decode(str).map((x) => QryDash.fromJson(x)));
  } catch (e) {
    result = [];
  }
  return result;
}

String qryDashToJson(List<QryDash> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QryDash {
  String Menu;

  DateTime datebegin;
  DateTime dateend;

  QryDash({
    required this.Menu,
    required this.datebegin,
    required this.dateend,
  });

  Map<String, String> toJson2() => {
        "menu": Menu,
        "dateBegin": datebegin.toIso8601String(),
        "dateEnd": dateend.toIso8601String(),
      };
  factory QryDash.fromJson(Map<String, dynamic> json) => QryDash(
        Menu: (json["menu"] == null) ? '' : json["menu"],
        datebegin: DateTime.parse(json["dateBegin"].toString().split('T')[0]),
        dateend: DateTime.parse(json["dateEnd"].toString().split('T')[0]),
      );

  Map<String, dynamic> toJson() => {
        "menu": Menu,
        "dateBegin": datebegin.toIso8601String(),
        "dateEnd": dateend.toIso8601String(),
      };
}
