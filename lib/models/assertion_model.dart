// To parse this JSON data, do
//
//     final assertionModel = assertionModelFromJson(jsonString);

import 'dart:convert';

AssertionModel assertionModelFromJson(String str) =>
    AssertionModel.fromJson(json.decode(str));

String assertionModelToJson(AssertionModel data) => json.encode(data.toJson());

class AssertionModel {
  int id;
  String lib;
  int isCorrect;
  int questionId;

  AssertionModel({
    required this.id,
    required this.lib,
    required this.isCorrect,
    required this.questionId,
  });

  factory AssertionModel.fromJson(Map<String, dynamic> json) => AssertionModel(
        id: json["id"],
        lib: json["lib"],
        isCorrect: json["is_correct"],
        questionId: json["question_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lib": lib,
        "is_correct": isCorrect,
        "question_id": questionId,
      };
}
