import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar/custom_app_bar_widget.dart';
import '/components/follow_icon/follow_icon_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchoolsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Model for NavbarFloating component.
  late NavbarFloatingModel navbarFloatingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    navbarFloatingModel = createModel(context, () => NavbarFloatingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customAppBarModel.dispose();
    navbarFloatingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
