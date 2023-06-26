import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/explore_app_bar/explore_app_bar_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/components/people_chip/people_chip_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ExploreModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  PagingController<ApiPagingParams, dynamic>? pagingController;
  // Model for ExploreAppBar component.
  late ExploreAppBarModel exploreAppBarModel;
  // Model for NavbarFloating component.
  late NavbarFloatingModel navbarFloatingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    exploreAppBarModel = createModel(context, () => ExploreAppBarModel());
    navbarFloatingModel = createModel(context, () => NavbarFloatingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    exploreAppBarModel.dispose();
    navbarFloatingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
