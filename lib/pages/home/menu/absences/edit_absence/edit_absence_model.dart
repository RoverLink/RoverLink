import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class EditAbsenceModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> reasonIDs = [];
  void addToReasonIDs(String item) => reasonIDs.add(item);
  void removeFromReasonIDs(String item) => reasonIDs.remove(item);
  void removeAtIndexFromReasonIDs(int index) => reasonIDs.removeAt(index);
  void updateReasonIDsAtIndex(int index, Function(String) updateFn) =>
      reasonIDs[index] = updateFn(reasonIDs[index]);

  List<String> reasons = [];
  void addToReasons(String item) => reasons.add(item);
  void removeFromReasons(String item) => reasons.remove(item);
  void removeAtIndexFromReasons(int index) => reasons.removeAt(index);
  void updateReasonsAtIndex(int index, Function(String) updateFn) =>
      reasons[index] = updateFn(reasons[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetAbsenceReasons)] action in EditAbsence widget.
  ApiCallResponse? getAbsenceReasonsResult;
  // State field(s) for StudentName widget.
  TextEditingController? studentNameController;
  String? Function(BuildContext, String?)? studentNameControllerValidator;
  String? _studentNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5zc9n1mj' /* Please enter full name of stud... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'lbvp7qhu' /* Please enter full name of stud... */,
      );
    }

    return null;
  }

  // State field(s) for School widget.
  String? schoolValue;
  FormFieldController<String>? schoolValueController;
  // State field(s) for Teacher widget.
  TextEditingController? teacherController;
  String? Function(BuildContext, String?)? teacherControllerValidator;
  String? _teacherControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v16w67rb' /* Please enter the name of the s... */,
      );
    }

    return null;
  }

  // State field(s) for Grade widget.
  int? gradeValue;
  FormFieldController<int>? gradeValueController;
  DateTime? datePicked;
  // State field(s) for Reason widget.
  String? reasonValue;
  FormFieldController<String>? reasonValueController;
  // State field(s) for OtherReason widget.
  TextEditingController? otherReasonController;
  String? Function(BuildContext, String?)? otherReasonControllerValidator;
  String? _otherReasonControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ljx95clr' /* A reason for student's absence... */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Signature widget.
  SignatureController? signatureController;
  // Stores action output result for [Backend Call - API (CreateAttachment)] action in Button widget.
  ApiCallResponse? doctorsNoteAttachment2;
  // Stores action output result for [Backend Call - API (UpdateAbsence)] action in Button widget.
  ApiCallResponse? updateAbsenceResultOtherReason;
  // Stores action output result for [Backend Call - API (UpdateAbsence)] action in Button widget.
  ApiCallResponse? updateAbsenceResultNoOtherReason;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    studentNameControllerValidator = _studentNameControllerValidator;
    teacherControllerValidator = _teacherControllerValidator;
    otherReasonControllerValidator = _otherReasonControllerValidator;
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    studentNameController?.dispose();
    teacherController?.dispose();
    otherReasonController?.dispose();
    signatureController?.dispose();
    backButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
