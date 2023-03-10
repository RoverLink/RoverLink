// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blurhash/flutter_blurhash.dart';

class BlurHashWidget extends StatefulWidget {
  const BlurHashWidget(
      {Key? key, this.width, this.height, required this.blurHash})
      : super(key: key);

  final double? width;
  final double? height;
  final String blurHash;

  @override
  _BlurHashWidgetState createState() => _BlurHashWidgetState();
}

class _BlurHashWidgetState extends State<BlurHashWidget> {
  @override
  Widget build(BuildContext context) {
    return BlurHash(hash: widget.blurHash);
  }
}
