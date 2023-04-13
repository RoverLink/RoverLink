import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/loading_wheel/loading_wheel_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'create_post_model.dart';
export 'create_post_model.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  _CreatePostWidgetState createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget>
    with TickerProviderStateMixin {
  late CreatePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().newAccount == true) {
        context.pushNamed('EditProfile');
      }
    });

    _model.textController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

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
            'dcie39sd' /* Create Post */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).headlineMediumFamily),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                ),
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    color: Color(0x3416202A),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Hero(
                                              tag: currentUserPhoto,
                                              transitionOnUserGestures: true,
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: currentUserPhoto,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 0.0, 4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    currentUserDisplayName
                                                        .maybeHandleOverflow(
                                                      maxChars: 30,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          '@${valueOrDefault(currentUserDocument?.username, '')}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.95, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: CircularPercentIndicator(
                                                  percent: _model.progressBar,
                                                  radius: 15.0,
                                                  lineWidth: 3.0,
                                                  animation: false,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 18.0, 5.0, 0.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 0),
                                                () async {
                                                  setState(() {
                                                    _model.progressBar = functions
                                                        .calculateMessageCompletion(
                                                            _model
                                                                .textController
                                                                .text,
                                                            280);
                                                  });
                                                  if (functions.stringLength(
                                                          _model.textController
                                                              .text) >
                                                      280) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Posts can only contain 280 characters.',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'i3nhkyw9' /* Type here... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0, 0.0,
                                                            15.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxHeight: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      if ((_model.uploadedImageID
                                                                  .length >
                                                              0) &&
                                                          !_model.uploading &&
                                                          (_model.uploadedVideos
                                                                  .length ==
                                                              0))
                                                        custom_widgets
                                                            .DisplayUploadedImage(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 200.0,
                                                          isCircle: false,
                                                          defaultImageUrl: null,
                                                          image: _model
                                                              .uploadedLocalFile1,
                                                        ),
                                                      if ((_model.uploadedImageID
                                                                  .length >
                                                              0) &&
                                                          !_model.uploading &&
                                                          (_model.uploadedVideos
                                                                  .length >
                                                              0))
                                                        FlutterFlowVideoPlayer(
                                                          path: _model
                                                              .uploadedVideos
                                                              .first,
                                                          videoType:
                                                              VideoType.network,
                                                          autoPlay: false,
                                                          looping: true,
                                                          showControls: true,
                                                          allowFullScreen: true,
                                                          allowPlaybackSpeedMenu:
                                                              false,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_model.uploading)
                          wrapWithModel(
                            model: _model.loadingWheelModel,
                            updateCallback: () => setState(() {}),
                            child: LoadingWheelWidget(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 30.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.format_bold,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 32.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.format_italic,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 32.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.format_underline,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 32.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.strikethrough_s,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 32.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation1']!,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 160.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                      child: Text(
                        (_model.datePicked != null) && _model.useDate
                            ? 'Posting at ${functions.formatDateTime(functions.toJsonDate(_model.datePicked), 'M-d-y h:mm a')}'
                            : 'No Scheduled Post Time',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: getCurrentTimestamp,
                              lastDate: DateTime(2050),
                            );

                            TimeOfDay? _datePickedTime;
                            if (_datePickedDate != null) {
                              _datePickedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(getCurrentTimestamp),
                              );
                            }

                            if (_datePickedDate != null &&
                                _datePickedTime != null) {
                              setState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                  _datePickedTime!.hour,
                                  _datePickedTime.minute,
                                );
                              });
                            }
                            setState(() {
                              _model.useDate = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Color(0x3416202A),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 5.0, 20.0, 5.0),
                              child: Text(
                                (_model.datePicked != null) && _model.useDate
                                    ? 'Edit'
                                    : 'Schedule',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        if ((_model.datePicked != null) && _model.useDate)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  _model.useDate = false;
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation2']!,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height:
                    _model.group != null && _model.group != '' ? 400.0 : 350.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4d1fcn94' /* Visibility */,
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            _model.visibility = 'Public';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.visibility == 'Public'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x3416202A),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 10.0, 30.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'q8bywbon' /* Public */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: _model.visibility == 'Public'
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            _model.visibility = 'Organization';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.visibility == 'Organization'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x3416202A),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 10.0, 30.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'a0rsaf9e' /* Organization Only */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: _model.visibility == 'Organization'
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_model.group != null && _model.group != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              _model.visibility = 'Group';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _model.visibility == 'Group'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Color(0x3416202A),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2hdow91z' /* Group Only */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: _model.visibility == 'Group'
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            _model.visibility = 'Friends';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.visibility == 'Friends'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x3416202A),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 10.0, 30.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'yppanxc5' /* Friends Only */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: _model.visibility == 'Friends'
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            _model.visibility = 'OnlyMe';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.visibility == 'OnlyMe'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x3416202A),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 10.0, 30.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3gaqvias' /* Private */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: _model.visibility == 'OnlyMe'
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation3']!,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '8mkwna5p' /* Group */,
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                        child: PagedListView<ApiPagingParams, dynamic>(
                          pagingController: () {
                            if (_model.pagingController != null) {
                              return _model.pagingController!;
                            }

                            _model.pagingController = PagingController(
                              firstPageKey: ApiPagingParams(
                                nextPageNumber: 0,
                                numItems: 0,
                                lastResponse: null,
                              ),
                            );
                            _model.pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              UsersGroup.getUserGroupMembershipsCall
                                  .call(
                                userId: currentUserUid,
                                jwtToken: currentJwtToken,
                                page: nextPageMarker.nextPageNumber,
                              )
                                  .then(
                                      (listViewGetUserGroupMembershipsResponse) {
                                final pageItems =
                                    UsersGroup.getUserGroupMembershipsCall
                                        .groups(
                                          listViewGetUserGroupMembershipsResponse
                                              .jsonBody,
                                        )!
                                        .map((e) => e)
                                        .toList() as List;
                                final newNumItems =
                                    nextPageMarker.numItems + pageItems.length;
                                _model.pagingController!.appendPage(
                                  pageItems,
                                  (pageItems.length > 0)
                                      ? ApiPagingParams(
                                          nextPageNumber:
                                              nextPageMarker.nextPageNumber + 1,
                                          numItems: newNumItems,
                                          lastResponse:
                                              listViewGetUserGroupMembershipsResponse,
                                        )
                                      : null,
                                );
                              });
                            });
                            return _model.pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) => Container(
                              height: 300.0,
                              child: EmptyListWidget(
                                text: FFLocalizations.of(context).getText(
                                  '42m375k1' /* You can't post to any groups. */,
                                ),
                              ),
                            ),
                            itemBuilder: (context, _, groupsIndex) {
                              final groupsItem = _model
                                  .pagingController!.itemList![groupsIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (groupsIndex == 0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 10.0),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _model.group = null;
                                            _model.groupName = null;
                                            _model.groupPFP =
                                                'https://roverlink.github.io/img/empty.png';
                                          });
                                          if (_model.visibility == 'Group') {
                                            setState(() {
                                              _model.visibility = 'Public';
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: _model.group == null ||
                                                    _model.group == ''
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color: Color(0x3416202A),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 8.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.dnd_forwardslash,
                                                  color: _model.group == null ||
                                                          _model.group == ''
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  size: 44.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'c3b7y3y3' /* No Group */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: _model.group ==
                                                                              null ||
                                                                          _model.group ==
                                                                              ''
                                                                      ? Colors
                                                                          .white
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 10.0),
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          _model.group = getJsonField(
                                            groupsItem,
                                            r'''$.id''',
                                          ).toString();
                                          _model.groupName = getJsonField(
                                            groupsItem,
                                            r'''$.name''',
                                          ).toString();
                                          _model.groupPFP = getJsonField(
                                                    groupsItem,
                                                    r'''$.profilePhotoUrl''',
                                                  ) ==
                                                  null
                                              ? 'https://www.gravatar.com/avatar/bc590g26dc27001cd24c418e9f879d11?s=80&r=g&d=identicon'
                                              : getJsonField(
                                                  groupsItem,
                                                  r'''$.profilePhotoUrl''',
                                                );
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: _model.group ==
                                                  getJsonField(
                                                    groupsItem,
                                                    r'''$.id''',
                                                  )
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              color: Color(0x3416202A),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 44.0,
                                                height: 44.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: getJsonField(
                                                            groupsItem,
                                                            r'''$.profilePhotoUrl''',
                                                          ) ==
                                                          null
                                                      ? 'https://www.gravatar.com/avatar/bc590g26dc27001cd24c418e9f879d11?s=80&r=g&d=identicon'
                                                      : getJsonField(
                                                          groupsItem,
                                                          r'''$.profilePhotoUrl''',
                                                        ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        groupsItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: _model
                                                                            .group ==
                                                                        getJsonField(
                                                                          groupsItem,
                                                                          r'''$.id''',
                                                                        )
                                                                    ? Colors
                                                                        .white
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    Text(
                                                      '@${getJsonField(
                                                        groupsItem,
                                                        r'''$.slug''',
                                                      ).toString()}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: _model
                                                                            .group ==
                                                                        getJsonField(
                                                                          groupsItem,
                                                                          r'''$.id''',
                                                                        )
                                                                    ? Color(
                                                                        0xFFB8C0C6)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                fontSize: 15.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation4']!,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 32.0,
                        ),
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            maxWidth: 2048.00,
                            maxHeight: 2048.00,
                            allowPhoto: true,
                            includeDimensions: true,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            pickerFontFamily: 'Fira Sans',
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading1 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                      ))
                                  .toList();
                            } finally {
                              _model.isDataUploading1 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile1 =
                                    selectedUploadedFiles.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          setState(() {
                            _model.uploading = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Uploading Image...',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                          _model.uploadPostAttachment =
                              await MediaGroup.createAttachmentCall.call(
                            media: _model.uploadedLocalFile1,
                            jwtToken: currentJwtToken,
                          );
                          if (getJsonField(
                                (_model.uploadPostAttachment?.jsonBody ?? ''),
                                r'''$.responseStatus.message''',
                              ) ==
                              'Success') {
                            setState(() {
                              _model.uploadedImageID = [];
                              _model.uploadedVideos = [];
                            });
                            setState(() {
                              _model.addToUploadedImageID(getJsonField(
                                (_model.uploadPostAttachment?.jsonBody ?? ''),
                                r'''$.attachmentId''',
                              ).toString());
                            });
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'There was a problem uploading your image. Make sure you uploaded a supported format.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            );
                          }

                          setState(() {
                            _model.uploading = false;
                          });

                          setState(() {});
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.video_call,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 32.0,
                      ),
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: false,
                          allowVideo: true,
                          includeDimensions: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textColor: FlutterFlowTheme.of(context).secondaryText,
                          pickerFontFamily: 'Fira Sans',
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading2 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading2 = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile2 =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        setState(() {
                          _model.uploading = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Uploading Video...',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                        _model.uploadPostAttachment2 =
                            await MediaGroup.createAttachmentCall.call(
                          media: _model.uploadedLocalFile2,
                          jwtToken: currentJwtToken,
                        );
                        if (getJsonField(
                              (_model.uploadPostAttachment2?.jsonBody ?? ''),
                              r'''$.responseStatus.message''',
                            ) ==
                            'Success') {
                          setState(() {
                            _model.uploadedImageID = [];
                            _model.uploadedVideos = [];
                          });
                          setState(() {
                            _model.addToUploadedImageID(getJsonField(
                              (_model.uploadPostAttachment2?.jsonBody ?? ''),
                              r'''$.attachmentId''',
                            ).toString());
                            _model.addToUploadedVideos(getJsonField(
                              (_model.uploadPostAttachment2?.jsonBody ?? ''),
                              r'''$.mediaUrl''',
                            ));
                          });
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'There was a problem uploading your video. Make sure you uploaded a supported format.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                        }

                        setState(() {
                          _model.uploading = false;
                        });

                        setState(() {});
                      },
                    ),
                    if (false)
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.text_fields,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 32.0,
                        ),
                        onPressed: () async {
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation4'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation4']!
                                .controller
                                .stop();
                          }
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation3'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation3']!
                                .controller
                                .stop();
                          }
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation2'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation2']!
                                .controller
                                .stop();
                          }
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation1'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation1']!
                                .controller
                                .stop();
                          }
                          if (_model.currentlyExpanded == 'Formatting') {
                            setState(() {
                              _model.currentlyExpanded = 'Nothing';
                            });
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation1'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation1']!
                                  .controller
                                  .reverse();
                            }
                          } else {
                            setState(() {
                              _model.currentlyExpanded = 'Formatting';
                            });
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation4'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation4']!
                                  .controller
                                  .reverse();
                            }
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation3'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation3']!
                                  .controller
                                  .reverse();
                            }
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation2'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation2']!
                                  .controller
                                  .reverse();
                            }
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation1'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          }
                        },
                      ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .stop();
                                    }
                                    if (_model.currentlyExpanded ==
                                        'Visibility') {
                                      setState(() {
                                        _model.currentlyExpanded = 'Nothing';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    } else {
                                      setState(() {
                                        _model.currentlyExpanded = 'Visibility';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.language_sharp,
                                    color: _model.visibility == 'Public'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0x00000000),
                                    size: 32.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .stop();
                                    }
                                    if (_model.currentlyExpanded ==
                                        'Visibility') {
                                      setState(() {
                                        _model.currentlyExpanded = 'Nothing';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    } else {
                                      setState(() {
                                        _model.currentlyExpanded = 'Visibility';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.business,
                                    color: _model.visibility == 'Organization'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0x00000000),
                                    size: 32.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .stop();
                                    }
                                    if (_model.currentlyExpanded ==
                                        'Visibility') {
                                      setState(() {
                                        _model.currentlyExpanded = 'Nothing';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    } else {
                                      setState(() {
                                        _model.currentlyExpanded = 'Visibility';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.emoji_people,
                                    color: _model.visibility == 'Friends'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0x00000000),
                                    size: 32.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .stop();
                                    }
                                    if (_model.currentlyExpanded ==
                                        'Visibility') {
                                      setState(() {
                                        _model.currentlyExpanded = 'Nothing';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    } else {
                                      setState(() {
                                        _model.currentlyExpanded = 'Visibility';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.person,
                                    color: _model.visibility == 'OnlyMe'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0x00000000),
                                    size: 32.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .stop();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .stop();
                                    }
                                    if (_model.currentlyExpanded ==
                                        'Visibility') {
                                      setState(() {
                                        _model.currentlyExpanded = 'Nothing';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    } else {
                                      setState(() {
                                        _model.currentlyExpanded = 'Visibility';
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.group,
                                    color: _model.visibility == 'Group'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0x00000000),
                                    size: 32.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                if (_model.group == null || _model.group == '')
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      Icons.group_add,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32.0,
                                    ),
                                    onPressed: () async {
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .stop();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .stop();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .stop();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .stop();
                                      }
                                      if (_model.currentlyExpanded == 'Group') {
                                        setState(() {
                                          _model.currentlyExpanded = 'Nothing';
                                        });
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation4'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation4']!
                                              .controller
                                              .reverse();
                                        }
                                      } else {
                                        setState(() {
                                          _model.currentlyExpanded = 'Group';
                                        });
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation3'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation3']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation4'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation4']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      }
                                    },
                                  ),
                                if (_model.group != null && _model.group != '')
                                  InkWell(
                                    onTap: () async {
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .stop();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .stop();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .stop();
                                      }
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .stop();
                                      }
                                      if (_model.currentlyExpanded == 'Group') {
                                        setState(() {
                                          _model.currentlyExpanded = 'Nothing';
                                        });
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation4'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation4']!
                                              .controller
                                              .reverse();
                                        }
                                      } else {
                                        setState(() {
                                          _model.currentlyExpanded = 'Group';
                                        });
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation3'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation3']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation4'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation4']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 35.0,
                                      height: 35.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        _model.groupPFP,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.schedule_send,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32.0,
                              ),
                              onPressed: () async {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation4'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation4']!
                                      .controller
                                      .stop();
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation3']!
                                      .controller
                                      .stop();
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation2']!
                                      .controller
                                      .stop();
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation1']!
                                      .controller
                                      .stop();
                                }
                                if (_model.currentlyExpanded == 'Send') {
                                  setState(() {
                                    _model.currentlyExpanded = 'Nothing';
                                  });
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .reverse();
                                  }
                                } else {
                                  setState(() {
                                    _model.currentlyExpanded = 'Send';
                                  });
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation4'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation4']!
                                        .controller
                                        .reverse();
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation3'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation3']!
                                        .controller
                                        .reverse();
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation1']!
                                        .controller
                                        .reverse();
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (_model.uploading) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please wait for your files to finish uploading.',
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
                                if (!((_model.textController.text != null &&
                                        _model.textController.text != '') ||
                                    (_model.uploadedImageID.length > 0))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'You must have either text or an image.',
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
                                if (functions.stringLength(
                                        _model.textController.text) >
                                    280) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Posts can only contain 280 characters.',
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
                                if (!((_model.datePicked != null) &&
                                        _model.useDate
                                    ? (_model.datePicked! > getCurrentTimestamp)
                                    : true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'The scheduled post time has already passed.',
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
                                _model.createPostResult =
                                    await PostsGroup.createPostCall.call(
                                  jwtToken: currentJwtToken,
                                  audience: _model.visibility,
                                  text: _model.textController.text,
                                  feedType:
                                      _model.group != null && _model.group != ''
                                          ? 'group'
                                          : 'user',
                                  feedId:
                                      _model.group != null && _model.group != ''
                                          ? _model.group
                                          : currentUserUid,
                                  attachmentIdsfromtoJsonList:
                                      functions.toJsonList(
                                          _model.uploadedImageID.toList()),
                                );
                                _shouldSetState = true;
                                if (getJsonField(
                                      (_model.createPostResult?.jsonBody ?? ''),
                                      r'''$.responseStatus.message''',
                                    ) ==
                                    'Success') {
                                  context.safePop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        () {
                                          if ((_model.datePicked != null) &&
                                              _model.useDate &&
                                              (_model.group == null ||
                                                  _model.group == '')) {
                                            return 'Your post will be posted at ${functions.formatDateTime(functions.toJsonDate(_model.datePicked), 'M-d-y h:mm a')}.';
                                          } else if ((_model.datePicked !=
                                                  null) &&
                                              _model.useDate &&
                                              (_model.group != null &&
                                                  _model.group != '')) {
                                            return 'Your post will be posted to ${_model.groupName} at ${functions.formatDateTime(functions.toJsonDate(_model.datePicked), 'M-d-y h:mm a')}.';
                                          } else if (_model.group != null &&
                                              _model.group != '') {
                                            return 'Your post has been posted to ${_model.groupName}.';
                                          } else {
                                            return 'Your post has been posted.';
                                          }
                                        }(),
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
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Sorry! There was an error.'),
                                                content: Text(getJsonField(
                                                  (_model.createPostResult
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
                                                    child: Text('Report Bug'),
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

                                if (_shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'pvh8cex1' /* Post */,
                              ),
                              options: FFButtonOptions(
                                width: 60.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Fira Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 5.0,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
