import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_floating_copy_model.dart';
export 'navbar_floating_copy_model.dart';

class NavbarFloatingCopyWidget extends StatefulWidget {
  const NavbarFloatingCopyWidget({Key? key}) : super(key: key);

  @override
  _NavbarFloatingCopyWidgetState createState() =>
      _NavbarFloatingCopyWidgetState();
}

class _NavbarFloatingCopyWidgetState extends State<NavbarFloatingCopyWidget> {
  late NavbarFloatingCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarFloatingCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: AlignmentDirectional(0, 0),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: double.infinity,
              height: 70,
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Color(0x33000000),
                    offset: Offset(0, 5),
                  )
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).navbarBackground,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: FaIcon(
                                FontAwesomeIcons.home,
                                color: FFAppState().currentPage == 'Home'
                                    ? FlutterFlowTheme.of(context)
                                        .navbarActiveLink
                                    : FlutterFlowTheme.of(context).navbarLink,
                                size: 25,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                if (FFAppState().currentPage != 'Home') {
                                  FFAppState().update(() {
                                    FFAppState().currentPage = 'Home';
                                  });

                                  context.goNamed(
                                    'HomePage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 50),
                                      ),
                                    },
                                  );
                                } else {
                                  return;
                                }
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.calendar_today,
                                color: FFAppState().currentPage == 'Events'
                                    ? FlutterFlowTheme.of(context)
                                        .navbarActiveLink
                                    : FlutterFlowTheme.of(context).navbarLink,
                                size: 30,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                if (FFAppState().currentPage != 'Events') {
                                  FFAppState().update(() {
                                    FFAppState().currentPage = 'Events';
                                  });

                                  context.goNamed(
                                    'Events',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 50),
                                      ),
                                    },
                                  );
                                } else {
                                  return;
                                }
                              },
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0x00101213),
                                shape: BoxShape.circle,
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.school_rounded,
                                color: FFAppState().currentPage == 'Schools'
                                    ? FlutterFlowTheme.of(context)
                                        .navbarActiveLink
                                    : FlutterFlowTheme.of(context).navbarLink,
                                size: 30,
                              ),
                              onPressed: () async {
                                if (FFAppState().currentPage != 'Schools') {
                                  FFAppState().update(() {
                                    FFAppState().currentPage = 'Schools';
                                  });

                                  context.goNamed(
                                    'Events',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 50),
                                      ),
                                    },
                                  );
                                } else {
                                  return;
                                }
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.settings,
                                color: FFAppState().currentPage == 'Settings'
                                    ? FlutterFlowTheme.of(context)
                                        .navbarActiveLink
                                    : FlutterFlowTheme.of(context).navbarLink,
                                size: 30,
                              ),
                              onPressed: () async {
                                if (FFAppState().currentPage != 'Settings') {
                                  FFAppState().update(() {
                                    FFAppState().currentPage = 'Settings';
                                  });

                                  context.goNamed(
                                    'Settings',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 50),
                                      ),
                                    },
                                  );
                                } else {
                                  return;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 100,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () async {
                context.pushNamed('CreatePost');
              },
            ),
          ),
        ),
      ],
    );
  }
}
