// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future newCustomAction(DateTime settime) async {
  // create a custom action to set a timer on settime
// This function will create a custom action to set a timer on a specific settime in Flutter

  // First, calculate the duration between the current time and the settime
  Duration duration = settime.difference(DateTime.now());

  // Then, create a new Timer object with the calculated duration
  Timer timer = Timer(duration, () {
    // This code will be executed when the timer is finished
    print("Timer finished at $settime");
  });

  // Return the Timer object
  return timer;
}
