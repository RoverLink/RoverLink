import '/auth/firebase_auth/auth_util.dart';
import '/components/back_button_white/back_button_white_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress_ForgotPassword widget.
  TextEditingController? emailAddressForgotPasswordController;
  String? Function(BuildContext, String?)?
      emailAddressForgotPasswordControllerValidator;
  // Model for BackButtonWhite component.
  late BackButtonWhiteModel backButtonWhiteModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonWhiteModel = createModel(context, () => BackButtonWhiteModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressForgotPasswordController?.dispose();
    backButtonWhiteModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
