import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for displayName widget.
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for username widget.
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zw001qap' /* Username is required */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'qz53miub' /* Username should be at least 5 ... */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'rqm8092b' /* Username can have at most 15 c... */,
      );
    }
    if (!RegExp('[a-zA-Z0-9_]{5,15}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'oxx5e4zi' /* Usernames can only contain let... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (UsernameExists)] action in Button widget.
  ApiCallResponse? usernameExistsResult;
  // Stores action output result for [Backend Call - API (ChangeUsername)] action in Button widget.
  ApiCallResponse? changeUsernameResult;
  // Stores action output result for [Backend Call - API (ChangeDisplayName)] action in Button widget.
  ApiCallResponse? updateUserResultWithPFP;
  // Stores action output result for [Backend Call - API (ChangeDisplayName)] action in Button widget.
  ApiCallResponse? updateUserResultNoPFP;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    usernameControllerValidator = _usernameControllerValidator;
  }

  void dispose() {
    displayNameController?.dispose();
    usernameController?.dispose();
  }

  /// Additional helper methods are added here.

}
