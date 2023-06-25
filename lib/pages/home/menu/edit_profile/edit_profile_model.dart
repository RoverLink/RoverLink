import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/loading_wheel/loading_wheel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? previewURL;

  String? newPFP;

  bool uploading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for LoadingWheel component.
  late LoadingWheelModel loadingWheelModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (CreateAttachment)] action in IconButton widget.
  ApiCallResponse? uploadPFP;
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
  ApiCallResponse? changeDisplayNameResult;
  // Stores action output result for [Backend Call - API (ChangeProfilePhoto)] action in Button widget.
  ApiCallResponse? changeProfilePhotoResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingWheelModel = createModel(context, () => LoadingWheelModel());
    usernameControllerValidator = _usernameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    loadingWheelModel.dispose();
    displayNameController?.dispose();
    usernameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
