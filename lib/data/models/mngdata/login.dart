// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

List<Login> loginFromJson(String str) => List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
    int userId;
    String username;
    String shopId;
    String displayName;
    String source;
    String passwordHash;
    String passwordSalt;
    int isActive;

    Login({
        required this.userId,
        required this.username,
        required this.shopId,
        required this.displayName,
        required this.source,
        required this.passwordHash,
        required this.passwordSalt,
        required this.isActive,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        userId: json["userId"],
        username: json["username"],
        shopId: json["shopId"],
        displayName: json["displayName"],
        source: json["source"],
        passwordHash: json["passwordHash"],
        passwordSalt: json["passwordSalt"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "shopId": shopId,
        "displayName": displayName,
        "source": source,
        "passwordHash": passwordHash,
        "passwordSalt": passwordSalt,
        "isActive": isActive,
    };
}
