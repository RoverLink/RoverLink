import '/components/follow_button/follow_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PeopleChipModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for FollowButton component.
  late FollowButtonModel followButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    followButtonModel = createModel(context, () => FollowButtonModel());
  }

  void dispose() {
    followButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
