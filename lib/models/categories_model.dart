// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

class CategoriesModel {
    CategoriesModel({
        this.id,
        this.name,
        this.icon,
        this.available,
    });

    int? id;
    String? name;
    String? icon;
    int? available;

    factory CategoriesModel.fromRawJson(String str) => CategoriesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        icon: json["icon"] == null ? null : json["icon"],
        available: json["available"] == null ? null : json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "icon": icon == null ? null : icon,
        "available": available == null ? null : available,
    };
}
