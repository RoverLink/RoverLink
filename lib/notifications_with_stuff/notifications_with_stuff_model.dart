import '../backend/api_requests/api_calls.dart';
import '../components/announcement_widget.dart';
import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsWithStuffModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    backButtonModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
