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

import 'package:rich_text_view/rich_text_view.dart';
import 'package:json_path/json_path.dart';

class PostTextViewer extends StatefulWidget {
  const PostTextViewer({
    Key? key,
    this.width,
    this.height,
    required this.post,
    required this.linkTextColor,
    required this.truncate,
    required this.maxLines,
    this.viewMoreText,
    this.viewLessText,
    this.textScaleFactor,
    required this.urlHandler,
    required this.emailHandler,
    required this.phoneHandler,
    required this.mentionHandler,
    required this.hashtagHandler,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic post;
  final Color linkTextColor;
  final bool truncate;
  final int maxLines;
  final String? viewMoreText;
  final String? viewLessText;
  final double? textScaleFactor;
  final Future<dynamic> Function() urlHandler;
  final Future<dynamic> Function() emailHandler;
  final Future<dynamic> Function() phoneHandler;
  final Future<dynamic> Function() mentionHandler;
  final Future<dynamic> Function() hashtagHandler;

  @override
  _PostTextViewerState createState() => _PostTextViewerState();
}

class _PostTextViewerState extends State<PostTextViewer> {
  void handleUrlTap(String? url) {
    url ??= '';

    if (url.isEmpty) {
      return;
    }

    if (!url.startsWith('https://') && !url.startsWith('http://')) {
      url = 'https://' + url;
    }
    FFAppState().selectedPostEntity = url;
    widget.urlHandler();
  }

  void handleEmailTap(String? email) {
    FFAppState().selectedPostEntity = email ?? '';
    widget.emailHandler();
  }

  void handlePhoneTap(String? phone) {
    FFAppState().selectedPostEntity = phone ?? '';
    widget.phoneHandler();
  }

  void handleMentionTap(String? mention) {
    mention ??= '';

    String path = r"$..userMentions[?(@.username == '" + mention + r"')].id";
    dynamic id = getJsonField(widget.post, path, false).ToString();

    if (mention.startsWith('@')) {
      mention = mention.substring(1);
    }

    FFAppState().selectedPostEntity = id;
    widget.mentionHandler();
  }

  void handleHashtagTap(String? hashtag) {
    hashtag ??= '';
    if (hashtag.startsWith('#') || hashtag.startsWith('﹟')) {
      hashtag = hashtag.substring(1);
    }

    FFAppState().selectedPostEntity = hashtag;
    widget.hashtagHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: RichTextView(
          style: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 12),
          text: getJsonField(
            widget.post,
            r'''$.text''',
            false,
          ),
          maxLines: widget.maxLines,
          truncate: widget.truncate,
          viewMoreText: widget.viewMoreText ?? 'more',
          viewLessText: widget.viewLessText ?? 'less',
          textScaleFactor: widget.textScaleFactor ?? 1.2,
          linkStyle: TextStyle(color: widget.linkTextColor ?? Colors.blue),
          textAlign: TextAlign.left,
          supportedTypes: [
            EmailParser(onTap: (email) => handleEmailTap(email.value)),
            PhoneParser(onTap: (phone) => handlePhoneTap(phone.value)),
            MentionParser(onTap: (mention) => handleMentionTap(mention.value)),
            UrlParser(onTap: (url) => handleUrlTap(url.value)),
            BoldParser(),
            HashTagParser(onTap: (hashtag) => handleHashtagTap(hashtag.value))
          ],
        ));
  }
}

dynamic getJsonField(
  dynamic response,
  String jsonPath, [
  bool isForList = false,
]) {
  final field = JsonPath(jsonPath).read(response);
  if (field.isEmpty) {
    return null;
  }
  if (field.length > 1) {
    return field.map((f) => f.value).toList();
  }
  final value = field.first.value;
  return isForList && value is! Iterable ? [value] : value;
}
