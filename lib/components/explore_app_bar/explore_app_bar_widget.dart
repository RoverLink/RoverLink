import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'explore_app_bar_model.dart';
export 'explore_app_bar_model.dart';

class ExploreAppBarWidget extends StatefulWidget {
  const ExploreAppBarWidget({Key? key}) : super(key: key);

  @override
  _ExploreAppBarWidgetState createState() => _ExploreAppBarWidgetState();
}

class _ExploreAppBarWidgetState extends State<ExploreAppBarWidget> {
  late ExploreAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreAppBarModel());

    _model.searchFieldController ??= TextEditingController();
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
              height: 114.0,
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
                          '9thtv05f' /* 2 */,
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
                              'em6rbqio' /* 6 */,
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
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 64.0, 10.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 40.0,
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextFormField(
                controller: _model.searchFieldController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.searchFieldController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: FFLocalizations.of(context).getText(
                    'f87s9ke8' /* Search... */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText2Family,
                        fontSize: 14.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText2Family),
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  prefixIcon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 17.0,
                  ),
                  suffixIcon: _model.searchFieldController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.searchFieldController?.clear();
                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                validator:
                    _model.searchFieldControllerValidator.asValidator(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
