import 'package:cloud_firestore/cloud_firestore.dart';

import '../../resourses/constant_manager.dart';
import 'category_dm.dart';

class EventDM {
  String id;
  String uid;
  final CategoryDM category;
  final String title;
  final String description;
  final DateTime dateTime;

  final int? lat;
  final int? lng;

  EventDM({this.id = "",
    required this.uid,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    this.lat,
    this.lng});

  EventDM.fromJson(Map<String, dynamic> json)
      : this(
    id: json["id"],
    uid: json["uid"],
    title: json["title"],
    description: json["description"],
    dateTime: (json["dateTime"] as Timestamp).toDate(),
    category: ConstantManager.categoriesWithoutAll.firstWhere(
          (category) => category.id == json["categoryId"],
    ),
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "uid": uid,
        "title": title,
        "description": description,
        "categoryId": category.id,
        "dateTime": Timestamp.fromDate(dateTime),
      };
}