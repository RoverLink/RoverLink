import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'your_profile_model.dart';
export 'your_profile_model.dart';

class YourProfileWidget extends StatefulWidget {
  const YourProfileWidget({Key? key}) : super(key: key);

  @override
  _YourProfileWidgetState createState() => _YourProfileWidgetState();
}

class _YourProfileWidgetState extends State<YourProfileWidget> {
  late YourProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().newAccount == true) {
        context.pushNamed('EditProfile');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 35.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: AuthUserStreamWidget(
          builder: (context) => Text(
            currentUserDisplayName,
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: FlutterFlowTheme.of(context).title2Family,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap()
                      .containsKey(FlutterFlowTheme.of(context).title2Family),
                ),
          ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.mode_edit,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 25.0,
            ),
            onPressed: () async {
              context.pushNamed('EditProfile');
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Hero(
                          tag: currentUserPhoto,
                          transitionOnUserGestures: true,
                          child: Container(
                            width: 130.0,
                            height: 130.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: currentUserPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        '@${valueOrDefault(currentUserDocument?.username, '')}',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 17.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Text(
                      currentUserEmail,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 17.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(20.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 2.0, 4.0, 2.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'f3lrbddq' /* Student */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 12.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'h2m279q1' /* Your Posts */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontSize: 20.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Container(
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
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'c6d9mukv' /* You haven't posted anything ye... */,
                                ),
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                            ),
                          ],
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
    );
  }
}
