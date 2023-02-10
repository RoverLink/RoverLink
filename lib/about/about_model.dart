import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Test JWT Call)] action in Image widget.
  ApiCallResponse? apiResult6x7;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
