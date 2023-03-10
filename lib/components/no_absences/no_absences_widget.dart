import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_absences_model.dart';
export 'no_absences_model.dart';

class NoAbsencesWidget extends StatefulWidget {
  const NoAbsencesWidget({Key? key}) : super(key: key);

  @override
  _NoAbsencesWidgetState createState() => _NoAbsencesWidgetState();
}

class _NoAbsencesWidgetState extends State<NoAbsencesWidget> {
  late NoAbsencesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoAbsencesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.announcement,
                color: FlutterFlowTheme.of(context).lineColor,
                size: 300.0,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'c9tfy1xl' /* You haven't submitted any abse... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
