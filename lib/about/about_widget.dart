import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).transparentBackground,
        automaticallyImplyLeading: false,
        leading: BackButtonWidget(),
        title: Text(
          'About',
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('TermsOfUse');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x32A40000),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Terms of  Use >',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title1Family,
                                color: FlutterFlowTheme.of(context).alternate,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).title1Family),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.65, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('PrivacyPolicy');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x32A40000),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Privacy Policy >',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title1Family,
                                color: FlutterFlowTheme.of(context).alternate,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).title1Family),
                              ),
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
    );
  }
}
