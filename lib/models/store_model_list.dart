// To parse this JSON data, do
//
//     final storeModelList = storeModelListFromJson(jsonString);

import 'dart:convert';

class StoreModelList {
  StoreModelList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory StoreModelList.fromRawJson(String str) =>
      StoreModelList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoreModelList.fromJson(Map<String, dynamic> json) => StoreModelList(
        count: json["count"] == null ? null : json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
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
    this.percentage,
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
  double? percentage;
  Storeaddress? storeaddress;
  String? worktime;
  String? telegram;
  int? deliverycost;
  double? avgcheck;
  String? instagram;
  String? whatsapp;
  String? slogan;
  String? description;
  dynamic rating;
  int? category;
  bool? isfavouritestore;
  int? subcategory;
  bool? isStaff;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        login: json["login"] == null ? null : json["login"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        type: json["type"] == null ? null : json["type"],
        percentage: json["percentage"] == null ? null : json["percentage"],
        storeaddress: json["storeaddress"] == null
            ? null
            : Storeaddress.fromJson(json["storeaddress"]),
        worktime: json["worktime"] == null ? null : json["worktime"],
        telegram: json["telegram"] == null ? null : json["telegram"],
        deliverycost:
            json["deliverycost"] == null ? null : json["deliverycost"],
        avgcheck: json["avgcheck"] == null ? null : json["avgcheck"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        slogan: json["slogan"] == null ? null : json["slogan"],
        description: json["description"] == null ? null : json["description"],
        rating: json["rating"],
        category: json["category"] == null ? null : json["category"],
        isfavouritestore:
            json["isfavouritestore"] == null ? null : json["isfavouritestore"],
        subcategory: json["subcategory"] == null ? null : json["subcategory"],
        isStaff: json["is_staff"] == null ? null : json["is_staff"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "login": login == null ? null : login,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "avatar": avatar == null ? null : avatar,
        "type": type == null ? null : type,
        "percentage": percentage == null ? null : percentage,
        "storeaddress": storeaddress == null ? null : storeaddress!.toJson(),
        "worktime": worktime == null ? null : worktime,
        "telegram": telegram == null ? null : telegram,
        "deliverycost": deliverycost == null ? null : deliverycost,
        "avgcheck": avgcheck == null ? null : avgcheck,
        "instagram": instagram == null ? null : instagram,
        "whatsapp": whatsapp == null ? null : whatsapp,
        "slogan": slogan == null ? null : slogan,
        "description": description == null ? null : description,
        "rating": rating,
        "category": category == null ? null : category,
        "isfavouritestore": isfavouritestore == null ? null : isfavouritestore,
        "subcategory": subcategory == null ? null : subcategory,
        "is_staff": isStaff == null ? null : isStaff,
      };
}

class Storeaddress {
  Storeaddress({
    this.city,
    this.name,
    this.latitude,
    this.longitude,
  });

  String? city;
  String? name;
  String? latitude;
  String? longitude;

  factory Storeaddress.fromRawJson(String str) =>
      Storeaddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Storeaddress.fromJson(Map<String, dynamic> json) => Storeaddress(
        city: json["city"] == null ? null : json["city"],
        name: json["name"] == null ? null : json["name"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "city": city == null ? null : city,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
      };
}
