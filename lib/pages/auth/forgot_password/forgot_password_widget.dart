import '/auth/auth_util.dart';
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
import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget>
    with TickerProviderStateMixin {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(-500.0, 0.0),
          end: Offset(25.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 100.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(-25.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

    _model.emailAddressForgotPasswordController ??= TextEditingController();
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
      backgroundColor: Color(0xFF14181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF14181B),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/stock.jpg',
                  ).image,
                ),
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0x990F1113),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    constraints: BoxConstraints(
                      maxWidth: 600.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Hero(
                                      tag: 'RoverLinkLogo',
                                      transitionOnUserGestures: true,
                                      child: Image.asset(
                                        'assets/images/RoverLink_hiwte.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 105.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .translucentBG,
                                        elevation: 6.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  34.0, 40.0, 34.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'r9qondpm' /* We will send you an email with... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .emailAddressForgotPasswordController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'c86nuu8p' /* Email Address */,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                24.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                  maxLines: null,
                                                  validator: _model
                                                      .emailAddressForgotPasswordControllerValidator
                                                      .asValidator(context),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textFieldOnPageLoadAnimation']!),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (_model
                                                        .emailAddressForgotPasswordController
                                                        .text
                                                        .isEmpty) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Email required!',
                                                          ),
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                    await resetPassword(
                                                      email: _model
                                                          .emailAddressForgotPasswordController
                                                          .text,
                                                      context: context,
                                                    );

                                                    context.pushNamed('Login');
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'wt8fom27' /* Send Link */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 270.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2Family),
                                                            ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
            wrapWithModel(
              model: _model.backButtonWhiteModel,
              updateCallback: () => setState(() {}),
              child: BackButtonWhiteWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
