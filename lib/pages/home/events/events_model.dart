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

class EventsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> events = [];
  void addToEvents(dynamic item) => events.add(item);
  void removeFromEvents(dynamic item) => events.remove(item);
  void removeAtIndexFromEvents(int index) => events.removeAt(index);
  void updateEventsAtIndex(int index, Function(dynamic) updateFn) =>
      events[index] = updateFn(events[index]);

  bool loading = true;

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (GetUserCalendarEvents)] action in Calendar widget.
  ApiCallResponse? eventsresult2;
  // Model for LoadingWheel component.
  late LoadingWheelModel loadingWheelModel;
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Model for NavbarFloating component.
  late NavbarFloatingModel navbarFloatingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    loadingWheelModel = createModel(context, () => LoadingWheelModel());
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    navbarFloatingModel = createModel(context, () => NavbarFloatingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingWheelModel.dispose();
    customAppBarModel.dispose();
    navbarFloatingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
