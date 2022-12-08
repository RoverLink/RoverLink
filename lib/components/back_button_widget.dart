import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BackButtonWidget extends StatefulWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  _BackButtonWidgetState createState() => _BackButtonWidgetState();
}

class _BackButtonWidgetState extends State<BackButtonWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30,
      borderWidth: 1,
      buttonSize: 60,
      icon: Icon(
        Icons.chevron_left,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 35,
      ),
      onPressed: () async {
        context.pop();
      },
    );
  }
}
