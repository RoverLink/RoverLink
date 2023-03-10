import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'form_submitted_model.dart';
export 'form_submitted_model.dart';

class FormSubmittedWidget extends StatefulWidget {
  const FormSubmittedWidget({Key? key}) : super(key: key);

  @override
  _FormSubmittedWidgetState createState() => _FormSubmittedWidgetState();
}

class _FormSubmittedWidgetState extends State<FormSubmittedWidget> {
  late FormSubmittedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSubmittedModel());
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, -0.35),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'sltw2h07' /* Thank You! */,
                      ),
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).title1Family,
                            fontSize: 50.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).title1Family),
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Container(
                          width: 200.0,
                          height: 150.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Lottie.asset(
                              'assets/lottie_animations/formsubmitted_lottie.json',
                              width: 100.0,
                              height: 90.0,
                              fit: BoxFit.cover,
                              repeat: false,
                              animate: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 30.0, 30.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'bxeung14' /* Your child's absence has been ... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.goNamed('HomePage');
                        },
                        text: FFLocalizations.of(context).getText(
                          'eyutm0ou' /* Continue */,
                        ),
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          elevation: 3.0,
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
            ),
          ),
        ),
      ),
    );
  }
}
