import '/components/custom_app_bar/custom_app_bar_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchoolsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Model for NavbarFloating component.
  late NavbarFloatingModel navbarFloatingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    navbarFloatingModel = createModel(context, () => NavbarFloatingModel());
  }

  void dispose() {
    customAppBarModel.dispose();
    navbarFloatingModel.dispose();
  }

  /// Additional helper methods are added here.

}
