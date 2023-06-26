import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/follow_button/follow_button_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtherProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for FollowButton component.
  late FollowButtonModel followButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    followButtonModel = createModel(context, () => FollowButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    followButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
