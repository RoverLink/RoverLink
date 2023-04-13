// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> setSubscription(
    BuildContext context, String slug, bool active) async {
  // Add your function code here!
  final subscriptions = FFAppState().subscriptions;

  if (!subscriptions.contains(slug)) {
    if (active) {
      subscriptions.add(slug);
      return true;
    }
  } else if (!active) {
    subscriptions.remove(slug);
    return true;
  }

  return false;
}
