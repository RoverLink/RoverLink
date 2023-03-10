import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_button_white_model.dart';
export 'back_button_white_model.dart';

class BackButtonWhiteWidget extends StatefulWidget {
  const BackButtonWhiteWidget({Key? key}) : super(key: key);

  @override
  _BackButtonWhiteWidgetState createState() => _BackButtonWhiteWidgetState();
}

class _BackButtonWhiteWidgetState extends State<BackButtonWhiteWidget> {
  late BackButtonWhiteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackButtonWhiteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30.0,
      borderWidth: 1.0,
      buttonSize: 60.0,
      icon: Icon(
        Icons.chevron_left,
        color: Colors.white,
        size: 35.0,
      ),
      onPressed: () async {
        context.pop();
      },
    );
  }
}
