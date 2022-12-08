import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

Color transparentTest() {
  return Color.fromRGBO(255, 255, 255, 0);
}

String humanDate(String? date) {
  return date == null ? '' : timeago.format(DateTime.parse(date));
}

bool isSameDay(
  String? eventDate,
  DateTime? selectedDate,
) {
  if (eventDate == null || selectedDate == null) {
    return true;
  }

  final date1 = DateTime.parse(eventDate);
  final date2 = selectedDate;

  return date1.day == date2.day &&
      date1.month == date2.month &&
      date1.year == date2.year;
}

bool isElementaryOrMiddleSchool(String? schoolName) {
  // checks if string contains "Elementary" or "Middle School"
  if (schoolName == null) return false;
  return schoolName.toLowerCase().contains("elementary") ||
      schoolName.toLowerCase().contains("middle school");
}

String formatDateTime(String date) {
  return DateFormat('MMM d yyyy hh:mm a').format(DateTime.parse(date));
}
