import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'container_template_model.dart';
export 'container_template_model.dart';

class ContainerTemplateWidget extends StatefulWidget {
  const ContainerTemplateWidget({Key? key}) : super(key: key);

  @override
  _ContainerTemplateWidgetState createState() =>
      _ContainerTemplateWidgetState();
}

class _ContainerTemplateWidgetState extends State<ContainerTemplateWidget> {
  late ContainerTemplateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerTemplateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        context.pushNamed('SchoolsFollowed');
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x3416202A),
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
