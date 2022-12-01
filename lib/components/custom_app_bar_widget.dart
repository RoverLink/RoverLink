import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
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
          alignment: AlignmentDirectional(0, -1.01),
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
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: Badge(
                      badgeContent: Text(
                        '6',
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
                      elevation: 3,
                      padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
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
                          size: 25,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Badge(
                          badgeContent: Text(
                            '6',
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
                          padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
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
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Notifications');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('Menu');
                          },
                          child: Hero(
                            tag: 'PFP',
                            transitionOnUserGestures: true,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/face-holding-back-tears_1f979.png',
                                fit: BoxFit.cover,
                              ),
                            ),
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
