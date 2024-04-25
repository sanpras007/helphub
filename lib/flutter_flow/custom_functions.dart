import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

String? perioddate(DateTime? currentdate) {
  // a function thet return a date that is 28 more than the current date and return in a string
  DateTime? newDate = currentdate?.add(Duration(days: 28));
  return newDate != null ? DateFormat('yyyy-MM-dd').format(newDate) : null;
}

String? firtilitydate(DateTime? setdate) {
  // caeate a custom function that return dates as string  that is 38 more than settdate
  DateTime? newDate = setdate?.add(Duration(days: 38));
  return newDate != null ? DateFormat('yyyy-MM-dd').format(newDate) : null;
}
