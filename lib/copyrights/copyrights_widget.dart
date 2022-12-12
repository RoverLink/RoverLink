import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CopyrightsWidget extends StatefulWidget {
  const CopyrightsWidget({Key? key}) : super(key: key);

  @override
  _CopyrightsWidgetState createState() => _CopyrightsWidgetState();
}

class _CopyrightsWidgetState extends State<CopyrightsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).transparentBackground,
        automaticallyImplyLeading: false,
        leading: BackButtonWidget(),
        title: Text(
          FFLocalizations.of(context).getText(
            'dl3iivct' /* Copyright and Licensing */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title2Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowWebView(
                  url: 'https://roverlink.github.io/CopyrightAndLicensing',
                  bypass: false,
                  height: MediaQuery.of(context).size.height * 1,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
