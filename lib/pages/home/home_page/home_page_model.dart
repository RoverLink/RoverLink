import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar/custom_app_bar_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
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
    customAppBarModel.dispose();
    navbarFloatingModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
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
