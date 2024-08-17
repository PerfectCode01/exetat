// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

CategorieModel categorieModelFromJson(String str) =>
    CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {
  int id;
  String lib;
  String desc;

  CategorieModel({
    required this.id,
    required this.lib,
    required this.desc,
  });

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
        id: json["id"],
        lib: json["lib"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lib": lib,
        "desc": desc,
      };
}
