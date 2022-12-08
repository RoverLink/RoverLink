import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({Key? key}) : super(key: key);

  @override
  _ThemeWidgetState createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
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
            'kfmlfzcw' /* Theme */,
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
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0, -1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: InkWell(
                          onTap: () async {
                            setDarkModeSetting(context, ThemeMode.system);
                            setState(() {
                              FFAppState().automaticTheme = true;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FFAppState().automaticTheme == true
                                  ? FlutterFlowTheme.of(context).primaryColor
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3416202A),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'x8j2rbnw' /* Automatic */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: InkWell(
                          onTap: () async {
                            setDarkModeSetting(context, ThemeMode.dark);
                            setState(() {
                              FFAppState().automaticTheme = false;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FFAppState().automaticTheme == false
                                  ? (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground)
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3416202A),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5pqvtm93' /* Dark */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: InkWell(
                          onTap: () async {
                            setDarkModeSetting(context, ThemeMode.light);
                            setState(() {
                              FFAppState().automaticTheme = false;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FFAppState().automaticTheme == false
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground)
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3416202A),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pd2i1yqy' /* Light */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
