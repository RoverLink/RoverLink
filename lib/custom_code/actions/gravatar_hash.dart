// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:flutter_gravatar/utils.dart';

Future<String> gravatarHash(String email) async {
  final gravatar = Gravatar(email);
  return gravatar.imageUrl();
}
