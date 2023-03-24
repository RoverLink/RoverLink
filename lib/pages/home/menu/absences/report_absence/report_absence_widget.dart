import '/auth/auth_util.dart';
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
import 'report_absence_model.dart';
export 'report_absence_model.dart';

class ReportAbsenceWidget extends StatefulWidget {
  const ReportAbsenceWidget({Key? key}) : super(key: key);

  @override
  _ReportAbsenceWidgetState createState() => _ReportAbsenceWidgetState();
}

class _ReportAbsenceWidgetState extends State<ReportAbsenceWidget> {
  late ReportAbsenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportAbsenceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getAbsenceReasonsResult =
          await AbsencesGroup.getAbsenceReasonsCall.call(
        jwtToken: currentJwtToken,
      );
      setState(() {
        _model.reasonIDs =
            (AbsencesGroup.getAbsenceReasonsCall.absenceReasonIDs(
          (_model.getAbsenceReasonsResult?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .map((e) => e)
                .toList()
                .map((e) => e.toString())
                .toList()
                .toList();
        _model.reasons = (AbsencesGroup.getAbsenceReasonsCall.absenceReason(
          (_model.getAbsenceReasonsResult?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .map((e) => e)
            .toList()
            .map((e) => e.toString())
            .toList()
            .toList();
      });
      setState(() {
        _model.addToReasonIDs('Other');
      });
    });

    _model.studentNameController ??= TextEditingController();
    _model.teacherController ??= TextEditingController();
    _model.otherReasonController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).transparentBackground,
        automaticallyImplyLeading: false,
        leading: wrapWithModel(
          model: _model.backButtonModel,
          updateCallback: () => setState(() {}),
          child: BackButtonWidget(),
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'ig4pe40x' /* Report Absence  */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title2Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.studentNameController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'jwwhxy1w' /* Student's Full Name */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.name,
                          validator: _model.studentNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: BuildingsGroup.getBuildingsCall.call(
                            includeDisabled: false,
                            includeHidden: false,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final schoolGetBuildingsResponse = snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.schoolController ??=
                                  FormFieldController<String>(
                                _model.schoolValue ??= '',
                              ),
                              options:
                                  (BuildingsGroup.getBuildingsCall.buildingIDs(
                                schoolGetBuildingsResponse.jsonBody,
                              ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                      .map((e) => e)
                                      .toList()
                                      .map((e) => e.toString())
                                      .toList()
                                      .toList(),
                              optionLabels: (BuildingsGroup.getBuildingsCall
                                      .buildingNames(
                                schoolGetBuildingsResponse.jsonBody,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()!
                                  .map((e) => e)
                                  .toList()
                                  .map((e) => e.toString())
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _model.schoolValue = val),
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context).bodyText1,
                              hintText: FFLocalizations.of(context).getText(
                                'k5ogbgzy' /* Please select a School */,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.teacherController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'a472bdc8' /* Teacher */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.name,
                          validator: _model.teacherControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.gradeController ??=
                              FormFieldController<int>(null),
                          options: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'qfkjpxyg' /* Kindergarten */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ku0m2sig' /* 1st Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'e7gxn2u3' /* 2nd Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'm38xj8c2' /* 3rd Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vg2qkos0' /* 4th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qxqlbsfh' /* 5th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'r9nul7lr' /* 6th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cs5gm7aa' /* 7th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              '7kk549v5' /* 8th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qbhk3f34' /* 9th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'pyq64fdx' /* 10th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nkzzxbye' /* 11th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              '730k1onl' /* 12th Grade */,
                            )
                          ],
                          onChanged: (val) =>
                              setState(() => _model.gradeValue = val),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'cibsn1fo' /* Please select a grade level */,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        ),
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'MMMMEEEEd',
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'Select Date of Absence',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 0.0),
                            child: InkWell(
                              onTap: () async {
                                final _datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                if (_datePickedDate != null) {
                                  setState(() {
                                    _model.datePicked = DateTime(
                                      _datePickedDate.year,
                                      _datePickedDate.month,
                                      _datePickedDate.day,
                                    );
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.reasonController ??=
                              FormFieldController<String>(
                            _model.reasonValue ??= '',
                          ),
                          options: _model.reasonIDs.toList(),
                          optionLabels: _model.reasons.toList(),
                          onChanged: (val) =>
                              setState(() => _model.reasonValue = val),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: FFLocalizations.of(context).getText(
                            'r2rf8lbi' /* Please select a Reason */,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        ),
                      ),
                      if (_model.reasonValue == 'Other')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: TextFormField(
                            controller: _model.otherReasonController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'xrqv4ouh' /* Reason for Absence */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            validator: _model.otherReasonControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 2048.00,
                              maxHeight: 2048.00,
                              allowPhoto: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              pickerFontFamily: 'Fira Sans',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                        ))
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            '2cpyhjt3' /* Optional: Add Doctor's Note Ph... */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '3c4nk704' /* Parent or Guardian Signature */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'lqihzcox' /* Sign your name in the box belo... */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRect(
                              child: Signature(
                                controller: _model.signatureController,
                                backgroundColor: Colors.transparent,
                                height: 120.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.schoolValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You must select a school',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.gradeValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You must select a grade level',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.datePicked == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You must select a date of absence.',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.reasonValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You must select a reason',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.datePicked != null) {
                                    _model.doctorsNoteAttachment =
                                        await MediaGroup.createAttachmentCall
                                            .call(
                                      media: _model.uploadedLocalFile,
                                      jwtToken: currentJwtToken,
                                    );
                                    _shouldSetState = true;
                                    if (_model.reasonValue == 'Other') {
                                      _model.createAbsenceResultOtherReason =
                                          await AbsencesGroup.createAbsenceCall
                                              .call(
                                        jwtToken: currentJwtToken,
                                        studentName:
                                            _model.studentNameController.text,
                                        buildingId: _model.schoolValue,
                                        teacher: _model.teacherController.text,
                                        gradeLevel: _model.gradeValue,
                                        absenceDate: functions
                                            .toJsonDate(_model.datePicked),
                                        reasonID: _model.reasonValue,
                                        photoAttachmentId: getJsonField(
                                          (_model.doctorsNoteAttachment
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.attachmentId''',
                                        ).toString(),
                                        signatureAttachmentId:
                                            'It it not yet possible to upload signature images to our app yet so this won\'t work yet',
                                        otherReason:
                                            _model.otherReasonController.text,
                                      );
                                      _shouldSetState = true;
                                      if (getJsonField(
                                            (_model.createAbsenceResultOtherReason
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.responseStatus.message''',
                                          ) !=
                                          'Success') {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Sorry! There as an error.'),
                                                      content:
                                                          Text(getJsonField(
                                                        (_model.createAbsenceResultOtherReason
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.responseStatus.message''',
                                                      ).toString()),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Ok'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                              'Report Bug'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          context.pushNamed('ReportABug');
                                        }
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      _model.createAbsenceResultNoOtherReason =
                                          await AbsencesGroup.createAbsenceCall
                                              .call(
                                        jwtToken: currentJwtToken,
                                        studentName:
                                            _model.studentNameController.text,
                                        buildingId: _model.schoolValue,
                                        teacher: _model.teacherController.text,
                                        gradeLevel: _model.gradeValue,
                                        absenceDate: functions
                                            .toJsonDate(_model.datePicked),
                                        reasonID: _model.reasonValue,
                                        photoAttachmentId: getJsonField(
                                          (_model.doctorsNoteAttachment
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.attachmentId''',
                                        ).toString(),
                                        signatureAttachmentId:
                                            'It it not yet possible to upload signature images to our app yet so this won\'t work yet',
                                      );
                                      _shouldSetState = true;
                                      if (getJsonField(
                                            (_model.createAbsenceResultNoOtherReason
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.responseStatus.message''',
                                          ) !=
                                          'Success') {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Sorry! There as an error.'),
                                                      content:
                                                          Text(getJsonField(
                                                        (_model.createAbsenceResultNoOtherReason
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.responseStatus.message''',
                                                      ).toString()),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Ok'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                              'Report Bug'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          context.pushNamed('ReportABug');
                                        }
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }

                                    context.pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Absence submitted. You will be notified once it is approved or rejected.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You must select a date of absence.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'bdsydx61' /* Submit */,
                                ),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .subtitle2Family,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
