import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchoolsFollowedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for subEahs widget.
  bool? subEahsValue;
  // Stores action output result for [Custom Action - setSubscription] action in subEahs widget.
  bool? subToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subEahs widget.
  bool? subToggledOff;
  // State field(s) for subEams widget.
  bool? subEamsValue;
  // Stores action output result for [Custom Action - setSubscription] action in subEams widget.
  bool? subEamsToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subEams widget.
  bool? subEamsToggledOff;
  // State field(s) for subPalmer widget.
  bool? subPalmerValue;
  // Stores action output result for [Custom Action - setSubscription] action in subPalmer widget.
  bool? subPalmerToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subPalmer widget.
  bool? subPalmerToggledOff;
  // State field(s) for subForks widget.
  bool? subForksValue;
  // Stores action output result for [Custom Action - setSubscription] action in subForks widget.
  bool? subForksToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subForks widget.
  bool? subForksToggledOff;
  // State field(s) for subTracy widget.
  bool? subTracyValue;
  // Stores action output result for [Custom Action - setSubscription] action in subTracy widget.
  bool? subTracyToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subTracy widget.
  bool? subTracyToggledOff;
  // State field(s) for subCheston widget.
  bool? subChestonValue;
  // Stores action output result for [Custom Action - setSubscription] action in subCheston widget.
  bool? subChestonToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subCheston widget.
  bool? subChestonToggledOff;
  // State field(s) for subPaxinosa widget.
  bool? subPaxinosaValue;
  // Stores action output result for [Custom Action - setSubscription] action in subPaxinosa widget.
  bool? subPaxinosaToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subPaxinosa widget.
  bool? subPaxinosaToggledOff;
  // State field(s) for subShawnee widget.
  bool? subShawneeValue;
  // Stores action output result for [Custom Action - setSubscription] action in subShawnee widget.
  bool? subShawneeToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subShawnee widget.
  bool? subShawneeToggledOff;
  // State field(s) for subMarch widget.
  bool? subMarchValue;
  // Stores action output result for [Custom Action - setSubscription] action in subMarch widget.
  bool? subMarchToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subMarch widget.
  bool? subMarchToggledOff;
  // State field(s) for subCyber widget.
  bool? subCyberValue;
  // Stores action output result for [Custom Action - setSubscription] action in subCyber widget.
  bool? subCyberToggledOn;
  // Stores action output result for [Custom Action - setSubscription] action in subCyber widget.
  bool? subCyberToggledOff;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
