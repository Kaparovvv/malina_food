// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

class CategoriesModel {
    CategoriesModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    int? count;
    dynamic next;
    dynamic previous;
    List<Result>? results;

    factory CategoriesModel.fromRawJson(String str) => CategoriesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.name,
        this.login,
        this.phone,
        this.email,
        this.avatar,
        this.type,
        required this.percentage,
        this.storeaddress,
        this.worktime,
        this.telegram,
        this.deliverycost,
        this.avgcheck,
        this.instagram,
        this.whatsapp,
        this.slogan,
        this.description,
        this.rating,
        this.category,
        this.isfavouritestore,
        this.subcategory,
        this.isStaff,
    });

    int? id;
    String? name;
    String? login;
    String? phone;
    String? email;
    String? avatar;
    int? type;
    double percentage;
    dynamic storeaddress;
    dynamic worktime;
    dynamic telegram;
    int? deliverycost;
    dynamic avgcheck;
    dynamic instagram;
    dynamic whatsapp;
    dynamic slogan;
    String? description;
    dynamic rating;
    dynamic category;
    bool? isfavouritestore;
    dynamic subcategory;
    bool? isStaff;

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        login: json["login"],
        phone: json["phone"],
        email: json["email"],
        avatar: json["avatar"],
        type: json["type"],
        percentage: json["percentage"],
        storeaddress: json["storeaddress"],
        worktime: json["worktime"],
        telegram: json["telegram"],
        deliverycost: json["deliverycost"],
        avgcheck: json["avgcheck"],
        instagram: json["instagram"],
        whatsapp: json["whatsapp"],
        slogan: json["slogan"],
        description: json["description"],
        rating: json["rating"],
        category: json["category"],
        isfavouritestore: json["isfavouritestore"],
        subcategory: json["subcategory"],
        isStaff: json["is_staff"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "login": login,
        "phone": phone,
        "email": email,
        "avatar": avatar,
        "type": type,
        "percentage": percentage,
        "storeaddress": storeaddress,
        "worktime": worktime,
        "telegram": telegram,
        "deliverycost": deliverycost,
        "avgcheck": avgcheck,
        "instagram": instagram,
        "whatsapp": whatsapp,
        "slogan": slogan,
        "description": description,
        "rating": rating,
        "category": category,
        "isfavouritestore": isfavouritestore,
        "subcategory": subcategory,
        "is_staff": isStaff,
    };
}
