import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress_Login widget.
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  // State field(s) for password_Login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  AudioPlayer? soundPlayer;
  // Stores action output result for [Custom Action - gravatarHash] action in Button-Login widget.
  String? gravatarHashUrl;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Button-Login widget.
  ApiCallResponse? loginNotifySyncResult;
  // Stores action output result for [Custom Action - gravatarHash] action in Container widget.
  String? gravatarHashUrlGuest1;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? googleSignupNotifySyncResult;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? googleLoginNotifySyncResult;
  // Stores action output result for [Custom Action - gravatarHash] action in Container widget.
  String? gravatarHashUrlGuest2;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? appleSignupNotifySyncResult;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? appleLoginNotifySyncResult;
  // Stores action output result for [Custom Action - gravatarHash] action in Container widget.
  String? gravatarHashUrlGuest3;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? facebookSignupNotifySyncResult;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? facebookLoginNotifySyncResult;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordConfirm widget.
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  // Stores action output result for [Custom Action - gravatarHash] action in Button widget.
  String? gravatarHashUrlGuest;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Button widget.
  ApiCallResponse? signupNotifySyncResult;
  // Stores action output result for [Custom Action - gravatarHash] action in Container widget.
  String? gravatarHashUrlGuest4;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? googleSignupNotifySyncResult2;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? googleLoginNotifySyncResult2;
  // Stores action output result for [Custom Action - gravatarHash] action in Container widget.
  String? gravatarHashUrlGuest5;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? appleSignupNotifySyncResult2;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? appleLoginNotifySyncResult2;
  // Stores action output result for [Custom Action - gravatarHash] action in Container widget.
  String? gravatarHashUrlGuest6;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? facebookSignupNotifySyncResult2;
  // Stores action output result for [Backend Call - API ( NotifySync)] action in Container widget.
  ApiCallResponse? facebookLoginNotifySyncResult2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    passwordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
