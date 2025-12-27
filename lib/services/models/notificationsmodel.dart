import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final Icon icon;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    this.isRead = false,
  });
}
