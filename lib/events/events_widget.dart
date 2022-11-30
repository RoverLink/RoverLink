import '../backend/api_requests/api_calls.dart';
import '../components/custom_app_bar_widget.dart';
import '../components/nav_bar2_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 54, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final calendarCalendarResponse = snapshot.data!;
                          return FlutterFlowCalendar(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            iconColor: FlutterFlowTheme.of(context).grayIcon,
                            weekFormat: true,
                            weekStartsMonday: false,
                            onChange: (DateTimeRange? newSelectedDate) async {
                              calendarSelectedDay = newSelectedDate;
                              setState(() => FFAppState().selectedDate =
                                  calendarSelectedDay?.start);
                              setState(() {});
                            },
                            titleStyle: FlutterFlowTheme.of(context).subtitle1,
                            dayOfWeekStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                  lineHeight: 1.1,
                                ),
                            dateStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            selectedDateStyle: TextStyle(),
                            inactiveDateStyle: TextStyle(),
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
                                    'MMMEd', FFAppState().selectedDate),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontSize: 17,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
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
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
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
                                        listViewCalendarResponse.jsonBody,
                                      )
                                          .where((e) => functions.isSameDay(
                                              getJsonField(
                                                e,
                                                r'''$.pubDate''',
                                              ).toString(),
                                              FFAppState().selectedDate))
                                          .toList()
                                          .map((e) => e)
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: event.length,
                                        itemBuilder: (context, eventIndex) {
                                          final eventItem = event[eventIndex];
                                          return ListTile(
                                            title: Text(
                                              getJsonField(
                                                eventItem,
                                                r'''$.title''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                            subtitle: Text(
                                              'asdfasdfasdf idk',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF303030),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .transparentBackground,
                                            dense: false,
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
                child: NavBar2Widget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
