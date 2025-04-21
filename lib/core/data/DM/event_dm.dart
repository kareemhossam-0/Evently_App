import 'package:flutter/material.dart';

class EventDM {
  final String category;

  final String title;

  final String description;

  final DateTime date;

  final TimeOfDay time;

  final int? lat;

  final int? lng;

  const EventDM({
    required this.category,

    required this.title,

    required this.description,

    required this.date,

    required this.time,

    this.lat,

    this.lng,
  });
}
