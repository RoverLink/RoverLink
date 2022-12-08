import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarCopy2Widget extends StatefulWidget {
  const CustomAppBarCopy2Widget({Key? key}) : super(key: key);

  @override
  _CustomAppBarCopy2WidgetState createState() =>
      _CustomAppBarCopy2WidgetState();
}

class _CustomAppBarCopy2WidgetState extends State<CustomAppBarCopy2Widget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primaryBackground,
                    FlutterFlowTheme.of(context).translucentBG
                  ],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, -1.02),
          child: Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 20, 0, 0),
                    child: Badge(
                      badgeContent: Text(
                        FFLocalizations.of(context).getText(
                          '558saoxe' /* 12 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color: Colors.white,
                              fontSize: 12,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                      showBadge: true,
                      shape: BadgeShape.circle,
                      badgeColor: Color(0xFFDC1313),
                      elevation: 0,
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      position: BadgePosition.topEnd(),
                      animationType: BadgeAnimationType.scale,
                      toAnimate: true,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10,
                        borderWidth: 0,
                        buttonSize: 45,
                        icon: FaIcon(
                          FontAwesomeIcons.bullhorn,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0),
                        child: Badge(
                          badgeContent: Text(
                            FFLocalizations.of(context).getText(
                              'k1s3mbjb' /* 6 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.white,
                                  fontSize: 12,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          showBadge: true,
                          shape: BadgeShape.circle,
                          badgeColor: Color(0xFFDC1313),
                          elevation: 3,
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          position: BadgePosition.topEnd(),
                          animationType: BadgeAnimationType.scale,
                          toAnimate: true,
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10,
                            borderWidth: 0,
                            buttonSize: 45,
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32,
                            ),
                            onPressed: () async {
                              context.pushNamed('Notifications');
                            },
                          ),
                        ),
                      ),
                      if (currentUserPhoto != null && currentUserPhoto != '')
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(13, 20, 13, 5),
                          child: AuthUserStreamWidget(
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed('Menu');
                              },
                              child: Hero(
                                tag: currentUserPhoto,
                                transitionOnUserGestures: true,
                                child: Container(
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                          child: AuthUserStreamWidget(
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.person_outline,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 35,
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
