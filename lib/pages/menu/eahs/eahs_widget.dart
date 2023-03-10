import '/backend/api_requests/api_calls.dart';
import '/components/announcement/announcement_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eahs_model.dart';
export 'eahs_model.dart';

class EahsWidget extends StatefulWidget {
  const EahsWidget({Key? key}) : super(key: key);

  @override
  _EahsWidgetState createState() => _EahsWidgetState();
}

class _EahsWidgetState extends State<EahsWidget> {
  late EahsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EahsModel());
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Visibility(
            visible: FFAppState().newAccount == false,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'SchoolBanner',
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: Image.asset(
                  'assets/images/EAHS.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'bct7slbk' /* Easton Area High School */,
                      ),
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'kew24zs0' /* #eahs */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x3416202A),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          'yw0df01t' /* Follow */,
                        ),
                        options: FFButtonOptions(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle2Family,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w900,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .subtitle2Family),
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '313i98wx' /* Information */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'ze5elsd7' /* Announcements */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'sxuum9rm' /* Posts */,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'z2acb03f' /* Easton Area High School
2601 W... */
                                              ,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2Family,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: FlutterFlowWebView(
                                                url:
                                                    'https://roverlink.github.io/maps/eahs.html',
                                                bypass: false,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0,
                                                verticalScroll: true,
                                                horizontalScroll: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FutureBuilder<ApiCallResponse>(
                                            future:
                                                (_model.apiRequestCompleter2 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(
                                                              NotificationsCall
                                                                  .call()))
                                                    .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final listViewNotificationsResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final announcement =
                                                      NotificationsCall
                                                                  .notifications(
                                                            listViewNotificationsResponse
                                                                .jsonBody,
                                                          )
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      setState(() => _model
                                                              .apiRequestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleter2();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          announcement.length,
                                                      itemBuilder: (context,
                                                          announcementIndex) {
                                                        final announcementItem =
                                                            announcement[
                                                                announcementIndex];
                                                        return AnnouncementWidget(
                                                          key: Key(
                                                              'Keyhzm_${announcementIndex}_of_${announcement.length}'),
                                                          announcement:
                                                              announcementItem,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FutureBuilder<ApiCallResponse>(
                                            future:
                                                (_model.apiRequestCompleter1 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(
                                                              SocialPostsCall
                                                                  .call()))
                                                    .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final listViewSocialPostsResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final post =
                                                      SocialPostsCall.posts(
                                                            listViewSocialPostsResponse
                                                                .jsonBody,
                                                          )
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      setState(() => _model
                                                              .apiRequestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleter1();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: post.length,
                                                      itemBuilder:
                                                          (context, postIndex) {
                                                        final postItem =
                                                            post[postIndex];
                                                        return SocialPostWidget(
                                                          key: Key(
                                                              'Keyj9n_${postIndex}_of_${post.length}'),
                                                          post: postItem,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
