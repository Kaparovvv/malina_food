// To parse this JSON data, do
//
//     final subcategoriesModel = subcategoriesModelFromJson(jsonString);

import 'dart:convert';

class SubcategoriesModel {
    SubcategoriesModel({
        this.id,
        this.name,
        this.icon,
        this.category,
    });

    int? id;
    String? name;
    String? icon;
    int? category;

    factory SubcategoriesModel.fromRawJson(String str) => SubcategoriesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubcategoriesModel.fromJson(Map<String, dynamic> json) => SubcategoriesModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        icon: json["icon"] == null ? null : json["icon"],
        category: json["category"] == null ? null : json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "icon": icon == null ? null : icon,
        "category": category == null ? null : category,
    };
}