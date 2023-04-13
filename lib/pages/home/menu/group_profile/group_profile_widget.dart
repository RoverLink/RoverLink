import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/follow_button/follow_button_widget.dart';
import '/components/people_chip_large/people_chip_large_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'group_profile_model.dart';
export 'group_profile_model.dart';

class GroupProfileWidget extends StatefulWidget {
  const GroupProfileWidget({
    Key? key,
    this.group,
  }) : super(key: key);

  final String? group;

  @override
  _GroupProfileWidgetState createState() => _GroupProfileWidgetState();
}

class _GroupProfileWidgetState extends State<GroupProfileWidget> {
  late GroupProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupProfileModel());
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

    return FutureBuilder<ApiCallResponse>(
      future: GroupGroup.getGroupCall.call(
        groupId: widget.group,
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
        final groupProfileGetGroupResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
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
              title: Text(
                getJsonField(
                  groupProfileGetGroupResponse.jsonBody,
                  r'''$.group.name''',
                ).toString(),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
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
                      Stack(
                        children: [
                          Builder(builder: (_) {
                            final child = Image.network(
                              getJsonField(
                                        groupProfileGetGroupResponse.jsonBody,
                                        r'''$.group.profileCoverUrl''',
                                      ) ==
                                      null
                                  ? getJsonField(
                                      groupProfileGetGroupResponse.jsonBody,
                                      r'''$.group.profilePhotoUrl''',
                                    )
                                  : getJsonField(
                                      groupProfileGetGroupResponse.jsonBody,
                                      r'''$.group.profileCoverUrl''',
                                    ),
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                            );
                            if (getJsonField(
                                  groupProfileGetGroupResponse.jsonBody,
                                  r'''$.group.profileCoverUrl''',
                                ) ==
                                null) {
                              return ClipRect(
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: child,
                                ),
                              );
                            }
                            return child;
                          }),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Container(
                                width: 138.0,
                                height: 138.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      getJsonField(
                                        groupProfileGetGroupResponse.jsonBody,
                                        r'''$.group.profilePhotoUrl''',
                                      ),
                                      'https://em-content.zobj.net/thumbs/320/microsoft/319/loudly-crying-face_1f62d.png',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: Container(
                                      width: 130.0,
                                      height: 130.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          getJsonField(
                                            groupProfileGetGroupResponse
                                                .jsonBody,
                                            r'''$.group.profilePhotoUrl''',
                                          ),
                                          'https://em-content.zobj.net/thumbs/320/microsoft/319/loudly-crying-face_1f62d.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          '#${getJsonField(
                            groupProfileGetGroupResponse.jsonBody,
                            r'''$.group.slug''',
                          ).toString()}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 17.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.followButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FollowButtonWidget(
                            followState: getJsonField(
                              groupProfileGetGroupResponse.jsonBody,
                              r'''$.group.followState''',
                            ).toString(),
                            minimized: false,
                            id: getJsonField(
                              groupProfileGetGroupResponse.jsonBody,
                              r'''$.group.id''',
                            ).toString(),
                            isGroup: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: DefaultTabController(
                            length: 4,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                                        '9jbvbomx' /* Information */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'l5yaqxof' /* Announcements */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '8dv3lm20' /* Posts */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'iu0vowae' /* Members */,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                (getJsonField(
                                                              groupProfileGetGroupResponse
                                                                  .jsonBody,
                                                              r'''$.group.description''',
                                                            ) !=
                                                            null) &&
                                                        (getJsonField(
                                                              groupProfileGetGroupResponse
                                                                  .jsonBody,
                                                              r'''$.group.description''',
                                                            ) !=
                                                            '') &&
                                                        (getJsonField(
                                                              groupProfileGetGroupResponse
                                                                  .jsonBody,
                                                              r'''$.group.description''',
                                                            ) !=
                                                            null)
                                                    ? getJsonField(
                                                        groupProfileGetGroupResponse
                                                            .jsonBody,
                                                        r'''$.group.description''',
                                                      ).toString()
                                                    : 'This group doesn\'t have a description yet.',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 100.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.emptyListModel,
                                          updateCallback: () => setState(() {}),
                                          child: EmptyListWidget(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '574c022r' /* This group hasn't made any ann... */,
                                            ),
                                          ),
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter2 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(FeedGroup
                                                      .getFeedCall
                                                      .call(
                                                    id: widget.group,
                                                    cultureKey:
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                    jwtToken: currentJwtToken,
                                                    feedType: 'group',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewGetFeedResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final post = FeedGroup.getFeedCall
                                                      .posts(
                                                        listViewGetFeedResponse
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
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '0epdog56' /* This group hasn't posted anyth... */,
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
                                                          'Keyvro_${postIndex}_of_${post.length}'),
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
                                      FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(GroupGroup
                                                      .getGroupMembersCall
                                                      .call(
                                                    groupId: widget.group,
                                                    jwtToken: currentJwtToken,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewGetGroupMembersResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final members =
                                                  GroupGroup.getGroupMembersCall
                                                          .members(
                                                            listViewGetGroupMembersResponse
                                                                .jsonBody,
                                                          )
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                              if (members.isEmpty) {
                                                return Container(
                                                  height: 300.0,
                                                  child: EmptyListWidget(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      's2lwebya' /* There are no members in this g... */,
                                                    ),
                                                  ),
                                                );
                                              }
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
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: members.length,
                                                  itemBuilder:
                                                      (context, membersIndex) {
                                                    final membersItem =
                                                        members[membersIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (membersIndex == 0)
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1.0,
                                                            height: 12.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child:
                                                              PeopleChipLargeWidget(
                                                            key: Key(
                                                                'Key6ml_${membersIndex}_of_${members.length}'),
                                                            user: membersItem,
                                                            isGroup: false,
                                                          ),
                                                        ),
                                                      ],
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
      },
    );
  }
}
