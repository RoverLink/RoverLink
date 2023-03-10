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

import 'package:cached_network_image/cached_network_image.dart';

class DisplayUploadedImage extends StatefulWidget {
  const DisplayUploadedImage({
    Key? key,
    this.width,
    this.height,
    this.image,
    this.isCircle,
    this.defaultImageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final FFUploadedFile? image;
  final bool? isCircle;
  final String? defaultImageUrl;

  @override
  _DisplayUploadedImageState createState() => _DisplayUploadedImageState();
}

class _DisplayUploadedImageState extends State<DisplayUploadedImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: widget.isCircle == true ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: widget.image != null
          ? Image.memory(widget.image!.bytes!)
          : widget.defaultImageUrl != null
              ? CachedNetworkImage(
                  imageUrl: widget.defaultImageUrl!,
                  fit: BoxFit.cover,
                )
              : const SizedBox.shrink(),
    );
  }
}
