// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class TokensModel {
  TokensModel({
    this.token,
    this.refreshToken,
  });

  String? token;
  String? refreshToken;

  factory TokensModel.fromRawJson(String str) =>
      TokensModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
        token: json["token"] == null ? null : json["token"],
        refreshToken:
            json["refresh_token"] == null ? null : json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "refresh_token": refreshToken == null ? null : refreshToken,
      };
}
