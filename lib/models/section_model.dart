// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

SectionModel sectionModelFromJson(String str) =>
    SectionModel.fromJson(json.decode(str));

String sectionModelToJson(SectionModel data) => json.encode(data.toJson());

class SectionModel {
  int? id;
  String? lib;
  String? desc;
  DateTime? createdAt;

  SectionModel({
    this.id,
    this.lib,
    this.desc,
    this.createdAt,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        id: json["id"],
        lib: json["lib"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lib": lib,
        "desc": desc,
        "created_at": createdAt!.toIso8601String(),
      };
}
