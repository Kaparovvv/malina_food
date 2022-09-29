// To parse this JSON data, do
//
//     final StoreIdModel = StoreIdModelFromJson(jsonString);

import 'dart:convert';

class StoreIdModel {
  StoreIdModel({
    this.id,
    this.branch,
    this.storeId,
    this.number,
  });

  int? id;
  int? branch;
  int? storeId;
  int? number;

  factory StoreIdModel.fromRawJson(String str) =>
      StoreIdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoreIdModel.fromJson(Map<String, dynamic> json) =>
      StoreIdModel(
        id: json["id"] == null ? null : json["id"],
        branch: json["branch"] == null ? null : json["branch"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "branch": branch == null ? null : branch,
        "store_id": storeId == null ? null : storeId,
        "number": number == null ? null : number,
      };
}
