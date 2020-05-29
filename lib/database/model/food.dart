// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  int id;
  String name;
  int minYear;
  String type;
  bool introduced;
  int feedback;
  String image;

  Food({
    this.id,
    this.name,
    this.minYear,
    this.type,
    this.introduced,
    this.feedback,
    this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        minYear: json["minYear"],
        type: json["type"],
        introduced: json["introduced"] == 1,
        feedback: json["feedback"],
        image: json["image"],
      );

  factory Food.fromMap(Map<String, dynamic> map) => Food(
        id: map["id"],
        name: map["name"],
        minYear: map["minYear"],
        type: map["type"],
        introduced: map["introduced"] == 1,
        feedback: map["feedback"],
        image: map["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minYear": minYear,
        "type": type,
        "introduced": introduced ? 1 : 0,
        "feedback": feedback,
        "image": image,
      };

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "minYear": minYear,
        "type": type,
        "introduced": introduced ? 1 : 0,
        "feedback": feedback,
        "image": image,
      };

  @override
  String toString() {
    return "${this.id} - ${this.name} - ${this.minYear} - ${this.type} - ${this.image} - ${this.introduced ? "true" : "false"} - ${this.feedback}";
  }
}
