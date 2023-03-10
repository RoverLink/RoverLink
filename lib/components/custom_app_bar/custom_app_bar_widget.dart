import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_app_bar_model.dart';
export 'custom_app_bar_model.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  late CustomAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomAppBarModel());
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
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 54.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primaryBackground,
                    FlutterFlowTheme.of(context).translucentBG
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, -1.02),
          child: Container(
            width: double.infinity,
            height: 54.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
                    child: badges.Badge(
                      badgeContent: Text(
                        FFLocalizations.of(context).getText(
                          'd6o0mmr4' /* 2 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color: Colors.white,
                              fontSize: 12.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                      showBadge: false,
                      shape: badges.BadgeShape.circle,
                      badgeColor: Color(0xFFDC1313),
                      elevation: 3.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      position: badges.BadgePosition.topEnd(),
                      animationType: badges.BadgeAnimationType.scale,
                      toAnimate: true,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 0.0,
                        buttonSize: 45.0,
                        icon: FaIcon(
                          FontAwesomeIcons.bullhorn,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Announcements');
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 8.0, 0.0),
                        child: badges.Badge(
                          badgeContent: Text(
                            FFLocalizations.of(context).getText(
                              'avox4qrx' /* 6 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          showBadge: false,
                          shape: badges.BadgeShape.circle,
                          badgeColor: Color(0xFFDC1313),
                          elevation: 3.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          position: badges.BadgePosition.topEnd(),
                          animationType: badges.BadgeAnimationType.scale,
                          toAnimate: true,
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10.0,
                            borderWidth: 0.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('Notifications');
                            },
                          ),
                        ),
                      ),
                      if (currentUserPhoto != null && currentUserPhoto != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 20.0, 13.0, 5.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              onTap: () async {
                                context.pushNamed('Menu');
                              },
                              child: Hero(
                                tag: currentUserPhoto,
                                transitionOnUserGestures: true,
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    currentUserPhoto,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (currentUserPhoto == null || currentUserPhoto == '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.person_outline,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 35.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Menu');
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
