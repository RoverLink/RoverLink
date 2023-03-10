import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'edit_absence_model.dart';
export 'edit_absence_model.dart';

class EditAbsenceWidget extends StatefulWidget {
  const EditAbsenceWidget({
    Key? key,
    this.absence,
  }) : super(key: key);

  final dynamic absence;

  @override
  _EditAbsenceWidgetState createState() => _EditAbsenceWidgetState();
}

class _EditAbsenceWidgetState extends State<EditAbsenceWidget> {
  late EditAbsenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAbsenceModel());

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

    _model.studentNameController ??= TextEditingController(
        text: getJsonField(
      widget.absence,
      r'''$.studentName''',
    ).toString().toString());
    _model.teacherController ??= TextEditingController(
        text: getJsonField(
      widget.absence,
      r'''$.teacher''',
    ).toString().toString());
    _model.otherReasonController ??= TextEditingController(
        text: getJsonField(
      widget.absence,
      r'''$.otherReason''',
    ).toString().toString());
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
            'wske1xcm' /* Edit Absence  */,
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
                              'mx0ft966' /* Student's Full Name */,
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
                              initialOption: _model.schoolValue ??=
                                  getJsonField(
                                widget.absence,
                                r'''$.buildingId''',
                              ).toString(),
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
                                '45v6nmvr' /* Please select a School */,
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
                              '4suk4vaz' /* Teacher */,
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
                          initialOption: _model.gradeValue ??= getJsonField(
                            widget.absence,
                            r'''$.gradeLevel''',
                          ),
                          options: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'v7awjdj5' /* Kindergarten */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ddzucuy0' /* 1st Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rjgsl238' /* 2nd Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'pebmx7ql' /* 3rd Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'y5fvsl9e' /* 4th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              '09u5yfnj' /* 5th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              '52psj84u' /* 6th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'p6je1rmf' /* 7th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'mptmih9l' /* 8th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ddq1xobj' /* 9th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ijrk6vbx' /* 10th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'tlg62173' /* 11th Grade */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cy7gc7gv' /* 12th Grade */,
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
                            'y70vu8xg' /* Please select a grade level */,
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
                                      'Update Date of Absence',
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
                                  initialDate:
                                      functions.fromJsonDate(getJsonField(
                                    widget.absence,
                                    r'''$.absenceDate''',
                                  ).toString()),
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
                          initialOption: _model.reasonValue ??= getJsonField(
                                    widget.absence,
                                    r'''$.reason''',
                                  ) ==
                                  'Other Reason'
                              ? 'Other'
                              : getJsonField(
                                  widget.absence,
                                  r'''$.reasonId''',
                                ).toString(),
                          options: _model.reasonIDs.toList(),
                          optionLabels: _model.reasons.toList(),
                          onChanged: (val) =>
                              setState(() => _model.reasonValue = val),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: FFLocalizations.of(context).getText(
                            'x80n1hiq' /* Please select a Reason */,
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
                                'y0ujfk7r' /* Reason for Absence */,
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
                              setState(() => _model.isMediaUploading = true);
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
                                _model.isMediaUploading = false;
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
                                    context, 'Failed to upload media');
                                return;
                              }
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'o4si7vip' /* Optional: Change Doctor's Note... */,
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
                            'v9g58qvj' /* Parent or Guardian Signature */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'omoachi0' /* Sign your name in the box belo... */,
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
                                    _model.doctorsNoteAttachment2 =
                                        await MediaGroup.createAttachmentCall
                                            .call(
                                      media: _model.uploadedLocalFile,
                                      jwtToken: currentJwtToken,
                                    );
                                    _shouldSetState = true;
                                    if (_model.reasonValue == 'Other') {
                                      _model.updateAbsenceResultOtherReason =
                                          await AbsencesGroup.updateAbsenceCall
                                              .call(
                                        jwtToken: currentJwtToken,
                                        studentName:
                                            _model.studentNameController.text,
                                        teacher: _model.teacherController.text,
                                        gradeLevel: _model.gradeValue,
                                        absenceDate:
                                            _model.datePicked?.toString(),
                                        reasonID: _model.reasonValue,
                                        photoAttachmentId: getJsonField(
                                          (_model.doctorsNoteAttachment2
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.attachmentId''',
                                        ).toString(),
                                        absenceId: getJsonField(
                                          widget.absence,
                                          r'''$.id''',
                                        ).toString(),
                                        otherReason:
                                            _model.otherReasonController.text,
                                      );
                                      _shouldSetState = true;
                                      if (getJsonField(
                                            (_model.updateAbsenceResultOtherReason
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
                                                        (_model.updateAbsenceResultOtherReason
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
                                      _model.updateAbsenceResultNoOtherReason =
                                          await AbsencesGroup.updateAbsenceCall
                                              .call(
                                        jwtToken: currentJwtToken,
                                        studentName:
                                            _model.studentNameController.text,
                                        teacher: _model.teacherController.text,
                                        gradeLevel: _model.gradeValue,
                                        absenceDate:
                                            _model.datePicked?.toString(),
                                        reasonID: _model.reasonValue,
                                        photoAttachmentId: getJsonField(
                                          (_model.doctorsNoteAttachment2
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.attachmentId''',
                                        ).toString(),
                                        absenceId: getJsonField(
                                          widget.absence,
                                          r'''$.id''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;
                                      if (getJsonField(
                                            (_model.updateAbsenceResultNoOtherReason
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
                                                        (_model.updateAbsenceResultNoOtherReason
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
                                          'Absence edited. You will be notified once it is approved or rejected.',
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
                                  '6nctukma' /* Edit */,
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
