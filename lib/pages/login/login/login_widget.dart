import '/auth/auth_util.dart';
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
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
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
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(500.0, 0.0),
          end: Offset(-26.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 100.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(25.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 1.3,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 1.3,
          end: 1.0,
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(500.0, 0.0),
          end: Offset(-26.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 100.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(25.0, 0.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(0.0, -50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.2,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailAddressLoginController ??= TextEditingController();
    _model.passwordLoginController ??= TextEditingController();
    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.passwordConfirmController ??= TextEditingController();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF14181B),
        body: Container(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: 105.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable: true,
                                labelColor: Colors.white,
                                labelStyle:
                                    FlutterFlowTheme.of(context).titleMedium,
                                indicatorColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'fw22h2r7' /* Sign In */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '432nyxa1' /* Sign Up */,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 3.0,
                                                  sigmaY: 3.0,
                                                ),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .translucentBG,
                                                  elevation: 6.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(34.0, 0.0,
                                                                34.0, 20.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .emailAddressLoginController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '5uknzhia' /* Email Address */,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          24.0,
                                                                          20.0,
                                                                          24.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            maxLines: null,
                                                            validator: _model
                                                                .emailAddressLoginControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textFieldOnPageLoadAnimation1']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .passwordLoginController,
                                                            obscureText: !_model
                                                                .passwordLoginVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                't3a5dj0t' /* Password */,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          24.0,
                                                                          20.0,
                                                                          24.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    setState(
                                                                  () => _model
                                                                          .passwordLoginVisibility =
                                                                      !_model
                                                                          .passwordLoginVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.passwordLoginVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: Color(
                                                                      0xFF95A1AC),
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            validator: _model
                                                                .passwordLoginControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textFieldOnPageLoadAnimation2']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if ((_model.emailAddressLoginController
                                                                              .text ==
                                                                          null ||
                                                                      _model.emailAddressLoginController
                                                                              .text ==
                                                                          '') ||
                                                                  (_model.passwordLoginController
                                                                              .text ==
                                                                          null ||
                                                                      _model.passwordLoginController
                                                                              .text ==
                                                                          '')) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Please enter an email and password',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                                HapticFeedback
                                                                    .lightImpact();
                                                                _model.soundPlayer ??=
                                                                    AudioPlayer();
                                                                if (_model
                                                                    .soundPlayer!
                                                                    .playing) {
                                                                  await _model
                                                                      .soundPlayer!
                                                                      .stop();
                                                                }
                                                                _model
                                                                    .soundPlayer!
                                                                    .setVolume(
                                                                        1.0);
                                                                _model
                                                                    .soundPlayer!
                                                                    .setAsset(
                                                                        'assets/audios/Sad-Trombone-B1-www.fesliyanstudios.com.mp3')
                                                                    .then((_) => _model
                                                                        .soundPlayer!
                                                                        .play());
                                                              } else {
                                                                GoRouter.of(
                                                                        context)
                                                                    .prepareAuthEvent();

                                                                final user =
                                                                    await signInWithEmail(
                                                                  context,
                                                                  _model
                                                                      .emailAddressLoginController
                                                                      .text,
                                                                  _model
                                                                      .passwordLoginController
                                                                      .text,
                                                                );
                                                                if (user ==
                                                                    null) {
                                                                  return;
                                                                }

                                                                if (currentUserPhoto ==
                                                                        null ||
                                                                    currentUserPhoto ==
                                                                        '') {
                                                                  _model.gravatarHashUrl =
                                                                      await actions
                                                                          .gravatarHash(
                                                                    currentUserEmail,
                                                                  );

                                                                  final usersUpdateData =
                                                                      createUsersRecordData(
                                                                    photoUrl: _model
                                                                        .gravatarHashUrl,
                                                                  );
                                                                  await currentUserReference!
                                                                      .update(
                                                                          usersUpdateData);
                                                                }
                                                                _model.loginNotifySyncResult =
                                                                    await UsersGroup
                                                                        .notifySyncCall
                                                                        .call(
                                                                  userId:
                                                                      currentUserUid,
                                                                  jwtToken:
                                                                      currentJwtToken,
                                                                );

                                                                context.pushNamedAuth(
                                                                    'HomePage',
                                                                    mounted);
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'hy0koxex' /* Login */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 230.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Fira Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 5.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'buttonOnPageLoadAnimation1']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .isAnonymous =
                                                                    true;
                                                              });
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              final user =
                                                                  await signInAnonymously(
                                                                      context);
                                                              if (user ==
                                                                  null) {
                                                                return;
                                                              }

                                                              context
                                                                  .goNamedAuth(
                                                                      'HomePage',
                                                                      mounted);
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ldepbzep' /* Login as Guest */,
                                                            ),
                                                            icon: Icon(
                                                              Icons.person,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 230.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  Colors.white,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Fira Sans',
                                                                        color: Color(
                                                                            0xFF0F1113),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 5.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'buttonOnPageLoadAnimation2']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'ForgotPassword');
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'd59ena4o' /* Forgot Password? */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 170.0,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0x0039D2C0),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0vvoynsh' /* Or use a social account to log... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();
                                                                  final user =
                                                                      await signInWithGoogle(
                                                                          context);
                                                                  if (user ==
                                                                      null) {
                                                                    return;
                                                                  }
                                                                  if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.username,
                                                                              '') ==
                                                                          null ||
                                                                      valueOrDefault(
                                                                              currentUserDocument?.username,
                                                                              '') ==
                                                                          '') {
                                                                    if (currentUserPhoto ==
                                                                            null ||
                                                                        currentUserPhoto ==
                                                                            '') {
                                                                      _model.gravatarHashUrlGuest1 =
                                                                          await actions
                                                                              .gravatarHash(
                                                                        currentUserEmail,
                                                                      );

                                                                      final usersUpdateData =
                                                                          createUsersRecordData(
                                                                        photoUrl:
                                                                            _model.gravatarHashUrlGuest,
                                                                      );
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                    }
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .newAccount =
                                                                          true;
                                                                    });
                                                                    _model.googleSignupNotifySyncResult =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );

                                                                    context.pushNamedAuth(
                                                                        'EditProfile',
                                                                        mounted);
                                                                  } else {
                                                                    _model.googleLoginNotifySyncResult =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            5.0,
                                                                        color: Color(
                                                                            0x3314181B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .google,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (isiOS == true)
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    GoRouter.of(
                                                                            context)
                                                                        .prepareAuthEvent();
                                                                    final user =
                                                                        await signInWithApple(
                                                                            context);
                                                                    if (user ==
                                                                        null) {
                                                                      return;
                                                                    }
                                                                    if (valueOrDefault(currentUserDocument?.username, '') ==
                                                                            null ||
                                                                        valueOrDefault(currentUserDocument?.username,
                                                                                '') ==
                                                                            '') {
                                                                      if (currentUserPhoto ==
                                                                              null ||
                                                                          currentUserPhoto ==
                                                                              '') {
                                                                        _model.gravatarHashUrlGuest2 =
                                                                            await actions.gravatarHash(
                                                                          currentUserEmail,
                                                                        );

                                                                        final usersUpdateData =
                                                                            createUsersRecordData(
                                                                          photoUrl:
                                                                              _model.gravatarHashUrlGuest,
                                                                        );
                                                                        await currentUserReference!
                                                                            .update(usersUpdateData);
                                                                      }
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().newAccount =
                                                                            true;
                                                                      });
                                                                      _model.appleSignupNotifySyncResult = await UsersGroup
                                                                          .notifySyncCall
                                                                          .call(
                                                                        userId:
                                                                            currentUserUid,
                                                                        jwtToken:
                                                                            currentJwtToken,
                                                                      );

                                                                      context.pushNamedAuth(
                                                                          'EditProfile',
                                                                          mounted);
                                                                    } else {
                                                                      _model.appleLoginNotifySyncResult = await UsersGroup
                                                                          .notifySyncCall
                                                                          .call(
                                                                        userId:
                                                                            currentUserUid,
                                                                        jwtToken:
                                                                            currentJwtToken,
                                                                      );
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5.0,
                                                                          color:
                                                                              Color(0x3314181B),
                                                                          offset: Offset(
                                                                              0.0,
                                                                              2.0),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .apple,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();
                                                                  final user =
                                                                      await signInWithFacebook(
                                                                          context);
                                                                  if (user ==
                                                                      null) {
                                                                    return;
                                                                  }
                                                                  if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.username,
                                                                              '') ==
                                                                          null ||
                                                                      valueOrDefault(
                                                                              currentUserDocument?.username,
                                                                              '') ==
                                                                          '') {
                                                                    if (currentUserPhoto ==
                                                                            null ||
                                                                        currentUserPhoto ==
                                                                            '') {
                                                                      _model.gravatarHashUrlGuest3 =
                                                                          await actions
                                                                              .gravatarHash(
                                                                        currentUserEmail,
                                                                      );

                                                                      final usersUpdateData =
                                                                          createUsersRecordData(
                                                                        photoUrl:
                                                                            _model.gravatarHashUrlGuest,
                                                                      );
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                    }
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .newAccount =
                                                                          true;
                                                                    });
                                                                    _model.facebookSignupNotifySyncResult =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );

                                                                    context.pushNamedAuth(
                                                                        'EditProfile',
                                                                        mounted);
                                                                  } else {
                                                                    _model.facebookLoginNotifySyncResult =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            5.0,
                                                                        color: Color(
                                                                            0x3314181B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      GoRouter.of(
                                                                              context)
                                                                          .prepareAuthEvent();
                                                                      final user =
                                                                          await signInWithFacebook(
                                                                              context);
                                                                      if (user ==
                                                                          null) {
                                                                        return;
                                                                      }

                                                                      context.goNamedAuth(
                                                                          'HomePage',
                                                                          mounted);
                                                                    },
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .facebookF,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          24.0,
                                                                    ),
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
                                          ],
                                        ),
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
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 3.0,
                                                  sigmaY: 3.0,
                                                ),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .translucentBG,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(44.0, 0.0,
                                                                44.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .emailAddressController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '46p8zoxf' /* Email Address */,
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          24.0,
                                                                          20.0,
                                                                          24.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            maxLines: null,
                                                            validator: _model
                                                                .emailAddressControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textFieldOnPageLoadAnimation3']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .passwordController,
                                                            obscureText: !_model
                                                                .passwordVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'uvpchzqb' /* Password */,
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          24.0,
                                                                          20.0,
                                                                          24.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    setState(
                                                                  () => _model
                                                                          .passwordVisibility =
                                                                      !_model
                                                                          .passwordVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.passwordVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: Color(
                                                                      0xFF95A1AC),
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Fira Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            validator: _model
                                                                .passwordControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textFieldOnPageLoadAnimation4']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .passwordConfirmController,
                                                            obscureText: !_model
                                                                .passwordConfirmVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'cuwd3isk' /* Confirm Password */,
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          24.0,
                                                                          20.0,
                                                                          24.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    setState(
                                                                  () => _model
                                                                          .passwordConfirmVisibility =
                                                                      !_model
                                                                          .passwordConfirmVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.passwordConfirmVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: Color(
                                                                      0xFF95A1AC),
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Fira Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            validator: _model
                                                                .passwordConfirmControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textFieldOnPageLoadAnimation5']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              if (_model
                                                                      .passwordController
                                                                      .text !=
                                                                  _model
                                                                      .passwordConfirmController
                                                                      .text) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Passwords don\'t match!',
                                                                    ),
                                                                  ),
                                                                );
                                                                return;
                                                              }

                                                              final user =
                                                                  await createAccountWithEmail(
                                                                context,
                                                                _model
                                                                    .emailAddressController
                                                                    .text,
                                                                _model
                                                                    .passwordController
                                                                    .text,
                                                              );
                                                              if (user ==
                                                                  null) {
                                                                return;
                                                              }

                                                              if (currentUserPhoto ==
                                                                      null ||
                                                                  currentUserPhoto ==
                                                                      '') {
                                                                _model.gravatarHashUrlGuest =
                                                                    await actions
                                                                        .gravatarHash(
                                                                  currentUserEmail,
                                                                );

                                                                final usersUpdateData =
                                                                    createUsersRecordData(
                                                                  photoUrl: _model
                                                                      .gravatarHashUrlGuest,
                                                                );
                                                                await currentUserReference!
                                                                    .update(
                                                                        usersUpdateData);
                                                              }
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .newAccount =
                                                                    true;
                                                              });
                                                              _model.signupNotifySyncResult =
                                                                  await UsersGroup
                                                                      .notifySyncCall
                                                                      .call(
                                                                userId:
                                                                    currentUserUid,
                                                                jwtToken:
                                                                    currentJwtToken,
                                                              );

                                                              context.pushNamedAuth(
                                                                  'EditProfile',
                                                                  mounted);

                                                              setState(() {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'vlydnlyl' /* Create Account */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 230.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Fira Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'buttonOnPageLoadAnimation3']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      20.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'e0v4b1we' /* Or use a social account to cre... */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              Colors.white,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();
                                                                  final user =
                                                                      await signInWithGoogle(
                                                                          context);
                                                                  if (user ==
                                                                      null) {
                                                                    return;
                                                                  }
                                                                  if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.username,
                                                                              '') ==
                                                                          null ||
                                                                      valueOrDefault(
                                                                              currentUserDocument?.username,
                                                                              '') ==
                                                                          '') {
                                                                    if (currentUserPhoto ==
                                                                            null ||
                                                                        currentUserPhoto ==
                                                                            '') {
                                                                      _model.gravatarHashUrlGuest4 =
                                                                          await actions
                                                                              .gravatarHash(
                                                                        currentUserEmail,
                                                                      );

                                                                      final usersUpdateData =
                                                                          createUsersRecordData(
                                                                        photoUrl:
                                                                            _model.gravatarHashUrlGuest,
                                                                      );
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                    }
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .newAccount =
                                                                          true;
                                                                    });
                                                                    _model.googleSignupNotifySyncResult2 =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );

                                                                    context.pushNamedAuth(
                                                                        'EditProfile',
                                                                        mounted);
                                                                  } else {
                                                                    _model.googleLoginNotifySyncResult2 =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            5.0,
                                                                        color: Color(
                                                                            0x3314181B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .google,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (isiOS == true)
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    GoRouter.of(
                                                                            context)
                                                                        .prepareAuthEvent();
                                                                    final user =
                                                                        await signInWithApple(
                                                                            context);
                                                                    if (user ==
                                                                        null) {
                                                                      return;
                                                                    }
                                                                    if (valueOrDefault(currentUserDocument?.username, '') ==
                                                                            null ||
                                                                        valueOrDefault(currentUserDocument?.username,
                                                                                '') ==
                                                                            '') {
                                                                      if (currentUserPhoto ==
                                                                              null ||
                                                                          currentUserPhoto ==
                                                                              '') {
                                                                        _model.gravatarHashUrlGuest5 =
                                                                            await actions.gravatarHash(
                                                                          currentUserEmail,
                                                                        );

                                                                        final usersUpdateData =
                                                                            createUsersRecordData(
                                                                          photoUrl:
                                                                              _model.gravatarHashUrlGuest,
                                                                        );
                                                                        await currentUserReference!
                                                                            .update(usersUpdateData);
                                                                      }
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().newAccount =
                                                                            true;
                                                                      });
                                                                      _model.appleSignupNotifySyncResult2 = await UsersGroup
                                                                          .notifySyncCall
                                                                          .call(
                                                                        userId:
                                                                            currentUserUid,
                                                                        jwtToken:
                                                                            currentJwtToken,
                                                                      );

                                                                      context.pushNamedAuth(
                                                                          'EditProfile',
                                                                          mounted);
                                                                    } else {
                                                                      _model.appleLoginNotifySyncResult2 = await UsersGroup
                                                                          .notifySyncCall
                                                                          .call(
                                                                        userId:
                                                                            currentUserUid,
                                                                        jwtToken:
                                                                            currentJwtToken,
                                                                      );
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5.0,
                                                                          color:
                                                                              Color(0x3314181B),
                                                                          offset: Offset(
                                                                              0.0,
                                                                              2.0),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .apple,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();
                                                                  final user =
                                                                      await signInWithFacebook(
                                                                          context);
                                                                  if (user ==
                                                                      null) {
                                                                    return;
                                                                  }
                                                                  if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.username,
                                                                              '') ==
                                                                          null ||
                                                                      valueOrDefault(
                                                                              currentUserDocument?.username,
                                                                              '') ==
                                                                          '') {
                                                                    if (currentUserPhoto ==
                                                                            null ||
                                                                        currentUserPhoto ==
                                                                            '') {
                                                                      _model.gravatarHashUrlGuest6 =
                                                                          await actions
                                                                              .gravatarHash(
                                                                        currentUserEmail,
                                                                      );

                                                                      final usersUpdateData =
                                                                          createUsersRecordData(
                                                                        photoUrl:
                                                                            _model.gravatarHashUrlGuest,
                                                                      );
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                    }
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .newAccount =
                                                                          true;
                                                                    });
                                                                    _model.facebookSignupNotifySyncResult2 =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );

                                                                    context.pushNamedAuth(
                                                                        'EditProfile',
                                                                        mounted);
                                                                  } else {
                                                                    _model.facebookLoginNotifySyncResult2 =
                                                                        await UsersGroup
                                                                            .notifySyncCall
                                                                            .call(
                                                                      userId:
                                                                          currentUserUid,
                                                                      jwtToken:
                                                                          currentJwtToken,
                                                                    );
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            5.0,
                                                                        color: Color(
                                                                            0x3314181B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      GoRouter.of(
                                                                              context)
                                                                          .prepareAuthEvent();
                                                                      final user =
                                                                          await signInWithFacebook(
                                                                              context);
                                                                      if (user ==
                                                                          null) {
                                                                        return;
                                                                      }

                                                                      context.goNamedAuth(
                                                                          'HomePage',
                                                                          mounted);
                                                                    },
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .facebookF,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      20.0,
                                                                      20.0,
                                                                      20.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'zquwm76t' /* By clicking "Create Account" y... */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'TermsOfUse');
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '7q7e9rd3' /* Terms of Use */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            fontSize:
                                                                                13.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '7r5t8rbc' /* and */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                13.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'PrivacyPolicy');
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2s8cej1h' /* Privacy Policy */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Color(0xFFFF5959),
                                                                            fontSize:
                                                                                13.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                          ],
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
