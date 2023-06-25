import '/auth/firebase_auth/auth_util.dart';
import '/components/follow_icon/follow_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PeopleChipLargeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for FollowIcon component.
  late FollowIconModel followIconModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    followIconModel = createModel(context, () => FollowIconModel());
  }

  void dispose() {
    followIconModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
