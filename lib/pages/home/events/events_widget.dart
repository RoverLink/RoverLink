import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar/custom_app_bar_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/loading_wheel/loading_wheel_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'events_model.dart';
export 'events_model.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  late EventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().currentPage = 'Events';
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              actions: [],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: Container(),
              ),
              centerTitle: false,
              toolbarHeight: 0.0,
              elevation: 0.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.0,
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
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Because of the Appbar we don't want to start the posts directly underneath so on the very first post we want to introduce some spacing
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 54.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .appbarSpacer,
                                      ),
                                    ),
                                    FlutterFlowCalendar(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      weekFormat: true,
                                      weekStartsMonday: false,
                                      rowHeight: 100.0,
                                      onChange: (DateTimeRange?
                                          newSelectedDate) async {
                                        _model.calendarSelectedDay =
                                            newSelectedDate;
                                        if (!((functions.formatDateTime(
                                                    functions.toJsonDate(
                                                        _model.selectedDate),
                                                    'yyyy-MM-01') ==
                                                functions.formatDateTime(
                                                    functions.toJsonDate(_model
                                                        .calendarSelectedDay
                                                        ?.start),
                                                    'yyyy-MM-01')) &&
                                            (_model.selectedDate != null))) {
                                          setState(() {
                                            _model.loading = true;
                                          });
                                          _model.eventsresult2 =
                                              await UsersGroup
                                                  .getUserCalendarEventsCall
                                                  .call(
                                            userId: currentUserUid,
                                            jwtToken: currentJwtToken,
                                            startDate: functions.formatDateTime(
                                                functions.toJsonDate(_model
                                                    .calendarSelectedDay
                                                    ?.start),
                                                'yyyy-MM-01'),
                                            currentMonthOnly: true,
                                          );
                                          setState(() {
                                            _model.events = UsersGroup
                                                .getUserCalendarEventsCall
                                                .events(
                                                  (_model.eventsresult2
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<dynamic>();
                                            _model.loading = false;
                                          });
                                        }
                                        setState(() {
                                          _model.selectedDate =
                                              _model.calendarSelectedDay?.start;
                                        });
                                        setState(() {});
                                      },
                                      titleStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      dayOfWeekStyle: FlutterFlowTheme.of(
                                              context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                            lineHeight: 1.1,
                                          ),
                                      dateStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      selectedDateStyle: TextStyle(),
                                      inactiveDateStyle: TextStyle(),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!_model.loading)
                                              Builder(
                                                builder: (context) {
                                                  final eventslist = _model
                                                      .events
                                                      .map((e) => e)
                                                      .toList()
                                                      .where((e) =>
                                                          (_model
                                                                  .selectedDate! >=
                                                              functions.fromJsonDate(
                                                                  functions.formatDateTime(
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.startTime''',
                                                                      ).toString(),
                                                                      'yyyy-MM-ddT00:00:00.000'))) &&
                                                          (_model.selectedDate! <=
                                                              functions.fromJsonDate(functions.formatDateTime(
                                                                  getJsonField(
                                                                    e,
                                                                    r'''$.endTime''',
                                                                  ).toString(),
                                                                  'yyyy-MM-ddT00:00:00.000'))))
                                                      .toList();
                                                  if (eventslist.isEmpty) {
                                                    return Container(
                                                      height: 300.0,
                                                      child: EmptyListWidget(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'mjf6ba1a' /* There aren't any events for th... */,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        eventslist.length,
                                                    itemBuilder: (context,
                                                        eventslistIndex) {
                                                      final eventslistItem =
                                                          eventslist[
                                                              eventslistIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'ViewEvent',
                                                                    queryParameters:
                                                                        {
                                                                      'event':
                                                                          serializeParam(
                                                                        eventslistItem,
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        colorFromCssString(
                                                                      getJsonField(
                                                                        eventslistItem,
                                                                        r'''$.accentColor''',
                                                                      ).toString(),
                                                                      defaultColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                    ),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            10.0,
                                                                        color: Color(
                                                                            0x3416202A),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            35.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      eventslistItem,
                                                                                      r'''$.subject''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).titleMedium,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (false)
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'gjlh74jx' /* In: */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontSize: 16.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  Hero(
                                                                                    tag: getJsonField(
                                                                                      eventslistItem,
                                                                                      r'''$.group.profilePhotoUrl''',
                                                                                    ),
                                                                                    transitionOnUserGestures: true,
                                                                                    child: Container(
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        getJsonField(
                                                                                          eventslistItem,
                                                                                          r'''$.group.profilePhotoUrl''',
                                                                                        ),
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        '${getJsonField(
                                                                                          eventslistItem,
                                                                                          r'''$.group.name''',
                                                                                        ).toString()} #${getJsonField(
                                                                                          eventslistItem,
                                                                                          r'''$.group.slug''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  eventslistItem,
                                                                                  r'''$.description''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.8, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            23.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            if (_model.loading)
                                              wrapWithModel(
                                                model: _model.loadingWheelModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: LoadingWheelWidget(),
                                              ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 95.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 74.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      dateTimeFormat(
                                        'MMMMEEEEd',
                                        _model.selectedDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.customAppBarModel,
                            updateCallback: () => setState(() {}),
                            child: CustomAppBarWidget(),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.navbarFloatingModel,
                            updateCallback: () => setState(() {}),
                            child: NavbarFloatingWidget(),
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
    );
  }
}
