import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/announcement/announcement_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/follow_button/follow_button_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'building_profile_copy_model.dart';
export 'building_profile_copy_model.dart';

class BuildingProfileCopyWidget extends StatefulWidget {
  const BuildingProfileCopyWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  @override
  _BuildingProfileCopyWidgetState createState() =>
      _BuildingProfileCopyWidgetState();
}

class _BuildingProfileCopyWidgetState extends State<BuildingProfileCopyWidget> {
  late BuildingProfileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingProfileCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
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
          top: true,
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
                        '0u00k9k6' /* Easton Area High School */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'p9nuea5m' /* #eahs */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: GroupGroup.getGroupCall.call(
                        groupId: 'q6gmy78mqn777',
                        jwtToken: currentJwtToken,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        final followButtonGetGroupResponse = snapshot.data!;
                        return wrapWithModel(
                          model: _model.followButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FollowButtonWidget(
                            followState: getJsonField(
                              followButtonGetGroupResponse.jsonBody,
                              r'''$.group.followState''',
                            ).toString(),
                            id: 'q6gmy78mqn777',
                            minimized: false,
                            isGroup: true,
                          ),
                        );
                      },
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
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'xocck0do' /* Information */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'hgyzrfa1' /* Announcements */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'v6lb8rgj' /* Posts */,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
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
                                              '0nzvl92m' /* Easton Area High School
2601 W... */
                                              ,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
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
                                                content:
                                                    'https://roverlink.github.io/map.html?location=easton area high school easton pa',
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
                                                (_model.apiRequestCompleter1 ??=
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
                                                              .primary,
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
                                                              .apiRequestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted1();
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
                                                              'Keygm7_${announcementIndex}_of_${announcement.length}'),
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
                                            future: (_model
                                                        .apiRequestCompleter2 ??=
                                                    Completer<ApiCallResponse>()
                                                      ..complete(FeedGroup
                                                          .getUserTimelineCall
                                                          .call(
                                                        jwtToken:
                                                            currentJwtToken,
                                                        cultureKey:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                        page: 0,
                                                      )))
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
                                                              .primary,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final listViewGetUserTimelineResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final post = FeedGroup
                                                          .getUserTimelineCall
                                                          .posts(
                                                            listViewGetUserTimelineResponse
                                                                .jsonBody,
                                                          )
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                                  if (post.isEmpty) {
                                                    return Container(
                                                      height: 300.0,
                                                      child: EmptyListWidget(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'rb35iua8' /* This group hasn't posted anyth... */,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      setState(() => _model
                                                              .apiRequestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted2();
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
                                                              'Keykyl_${postIndex}_of_${post.length}'),
                                                          post: postItem,
                                                          allowPFPClick: true,
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
