import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_wheel_model.dart';
export 'loading_wheel_model.dart';

class LoadingWheelWidget extends StatefulWidget {
  const LoadingWheelWidget({Key? key}) : super(key: key);

  @override
  _LoadingWheelWidgetState createState() => _LoadingWheelWidgetState();
}

class _LoadingWheelWidgetState extends State<LoadingWheelWidget> {
  late LoadingWheelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingWheelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        FlutterFlowWebView(
          url:
              'https://roverlink.github.io/loading.html?darkMode=${(Theme.of(context).brightness == Brightness.dark).toString()}',
          bypass: false,
          width: 73.0,
          height: 73.0,
          verticalScroll: false,
          horizontalScroll: false,
        ),
        Container(
          width: 73.0,
          height: 73.0,
          decoration: BoxDecoration(),
        ),
      ],
    );
  }
}
