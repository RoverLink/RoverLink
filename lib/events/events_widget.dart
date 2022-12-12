import '../backend/api_requests/api_calls.dart';
import '../components/custom_app_bar_widget.dart';
import '../components/navbar_floating_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  DateTimeRange? calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(),
          ),
          centerTitle: false,
          toolbarHeight: 0,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          constraints: BoxConstraints(
                            maxWidth: 600,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Because of the Appbar we don't want to start the posts directly underneath so on the very first post we want to introduce some spacing
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 54,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).appbarSpacer,
                                ),
                              ),
                              FutureBuilder<ApiCallResponse>(
                                future: CalendarCall.call(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final calendarCalendarResponse =
                                      snapshot.data!;
                                  return FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    iconColor:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    weekFormat: true,
                                    weekStartsMonday: false,
                                    rowHeight: 100,
                                    onChange:
                                        (DateTimeRange? newSelectedDate) async {
                                      calendarSelectedDay = newSelectedDate;
                                      setState(() {
                                        FFAppState().selectedDate =
                                            calendarSelectedDay?.start;
                                      });
                                      setState(() {});
                                    },
                                    titleStyle:
                                        FlutterFlowTheme.of(context).subtitle1,
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family),
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
                                  );
                                },
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        dateTimeFormat(
                                          'MMMEd',
                                          FFAppState().selectedDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              fontSize: 17,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: CalendarCall.call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewCalendarResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final event = CalendarCall.events(
                                                listViewCalendarResponse
                                                    .jsonBody,
                                              )
                                                  .where((e) =>
                                                      functions.isSameDay(
                                                          getJsonField(
                                                            e,
                                                            r'''$.pubDate''',
                                                          ).toString(),
                                                          FFAppState()
                                                              .selectedDate))
                                                  .toList()
                                                  .map((e) => e)
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: event.length,
                                                itemBuilder:
                                                    (context, eventIndex) {
                                                  final eventItem =
                                                      event[eventIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5,
                                                            color: Color(
                                                                0x3416202A),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 10, 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      eventItem,
                                                                      r'''$.title''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              29,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.9, 0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 18,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomAppBarWidget(),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: NavbarFloatingWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
