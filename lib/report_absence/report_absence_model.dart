import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class ReportAbsenceModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for StudentName widget.
  TextEditingController? studentNameController;
  String? Function(BuildContext, String?)? studentNameControllerValidator;
  String? _studentNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6qrnuoul' /* Please enter full name of stud... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'yl7jmd83' /* Please enter full name of stud... */,
      );
    }

    return null;
  }

  // State field(s) for School widget.
  String? schoolValue;
  // State field(s) for Teacher widget.
  TextEditingController? teacherController;
  String? Function(BuildContext, String?)? teacherControllerValidator;
  // State field(s) for Grade widget.
  String? gradeValue;
  // State field(s) for AbsenceDate widget.
  TextEditingController? absenceDateController;
  String? Function(BuildContext, String?)? absenceDateControllerValidator;
  DateTime? datePicked;
  // State field(s) for Reason widget.
  TextEditingController? reasonController;
  String? Function(BuildContext, String?)? reasonControllerValidator;
  String? _reasonControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mlgmzzoo' /* A reason for student's absence... */,
      );
    }

    return null;
  }

  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Signature widget.
  late SignatureController signatureController;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    studentNameControllerValidator = _studentNameControllerValidator;
    reasonControllerValidator = _reasonControllerValidator;
    signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Color(0xFF888888),
      exportBackgroundColor: Colors.white,
    );
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    studentNameController?.dispose();
    teacherController?.dispose();
    absenceDateController?.dispose();
    reasonController?.dispose();
    signatureController.dispose();
  }

  /// Additional helper methods are added here.

}
