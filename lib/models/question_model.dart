// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  int? id;
  String? lib;
  int? courId;
  int? editionId;
  int? point;
  DateTime? createdAt;
  DateTime? updatedAt;

  QuestionModel({
    this.id,
    this.lib,
    this.courId,
    this.editionId,
    this.point,
    this.createdAt,
    this.updatedAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        lib: json["lib"],
        courId: json["cour_id"],
        editionId: json["edition_id"],
        point: json["point"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lib": lib,
        "cour_id": courId,
        "edition_id": editionId,
        "point": point,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
