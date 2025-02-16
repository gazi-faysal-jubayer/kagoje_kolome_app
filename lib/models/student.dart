import 'package:flutter/material.dart';

class Student {
  final String name;
  final int points;
  final String id;
  final Color profileColor;

  Student({
    required this.name,
    required this.points,
    required this.id,
    Color? profileColor,
  }) : profileColor = profileColor ?? const Color(0xFF2A8088);
}