import 'dart:convert';

TaskModel taskFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskToJson(TaskModel data) => json.encode(data.toJson());


class TaskModel {
    TaskModel({
        this.id,
        this.title,
        this.description,
        this.done,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    String? title;
    String? description;
    bool? done;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        done: json["done"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "done": done,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}