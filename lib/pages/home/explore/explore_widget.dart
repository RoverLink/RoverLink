import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/explore_app_bar/explore_app_bar_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/components/people_chip/people_chip_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'explore_model.dart';
export 'explore_model.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  @override
  _ExploreWidgetState createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().currentPage = 'Explore';
      });
    });
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Stack the listview, custom appbar, and floating navbar on top of each other
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          constraints: BoxConstraints(
                            maxWidth: 600.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .transparentBackground,
                          ),
                          child:
                              // ListView of aggregated twitter posts
                              PagedListView<ApiPagingParams, dynamic>(
                            pagingController: () {
                              if (_model.pagingController != null) {
                                return _model.pagingController!;
                              }

                              _model.pagingController = PagingController(
                                firstPageKey: ApiPagingParams(
                                  nextPageNumber: 0,
                                  numItems: 0,
                                  lastResponse: null,
                                ),
                              );
                              _model.pagingController!
                                  .addPageRequestListener((nextPageMarker) {
                                FeedGroup.getUserTimelineCall
                                    .call(
                                  jwtToken: currentJwtToken,
                                  cultureKey:
                                      FFLocalizations.of(context).languageCode,
                                  page: nextPageMarker.nextPageNumber,
                                )
                                    .then((listViewGetUserTimelineResponse) {
                                  final pageItems =
                                      (FeedGroup.getUserTimelineCall
                                                  .posts(
                                                    listViewGetUserTimelineResponse
                                                        .jsonBody,
                                                  )!
                                                  .map((e) => e)
                                                  .toList() ??
                                              [])
                                          .toList() as List;
                                  final newNumItems = nextPageMarker.numItems +
                                      pageItems.length;
                                  _model.pagingController!.appendPage(
                                    pageItems,
                                    (pageItems.length > 0)
                                        ? ApiPagingParams(
                                            nextPageNumber:
                                                nextPageMarker.nextPageNumber +
                                                    1,
                                            numItems: newNumItems,
                                            lastResponse:
                                                listViewGetUserTimelineResponse,
                                          )
                                        : null,
                                  );
                                });
                              });
                              return _model.pagingController!;
                            }(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) =>
                                  EmptyListWidget(
                                text: FFLocalizations.of(context).getText(
                                  'h832vw6v' /* Follow someone to see reccomen... */,
                                ),
                              ),
                              itemBuilder: (context, _, postIndex) {
                                final postItem = _model
                                    .pagingController!.itemList![postIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Because of the Appbar we don't want to start the posts directly underneath so on the very first post we want to introduce some spacing
                                    if (postIndex == 0)
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 114.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .appbarSpacer,
                                        ),
                                      ),
                                    if (postIndex == 0)
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: UsersGroup.getUsersCall.call(
                                            jwtToken: currentJwtToken,
                                          ),
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
                                            final columnGetUsersResponse =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'estbh1xm' /* People */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'ExplorePeople',
                                                                queryParameters:
                                                                    {
                                                                  'users':
                                                                      serializeParam(
                                                                    columnGetUsersResponse
                                                                        .jsonBody,
                                                                    ParamType
                                                                        .JSON,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '7tw0nthw' /* View All */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1.0,
                                                  height: 140.0,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final users = UsersGroup
                                                              .getUsersCall
                                                              .users(
                                                                columnGetUsersResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: users.length,
                                                        itemBuilder: (context,
                                                            usersIndex) {
                                                          final usersItem =
                                                              users[usersIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (usersIndex ==
                                                                    0)
                                                                  Container(
                                                                    width: 10.0,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                PeopleChipWidget(
                                                                  key: Key(
                                                                      'Key7vd_${usersIndex}_of_${users.length}'),
                                                                  user:
                                                                      usersItem,
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0,
                                                                10.0, 0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'v05eekcn' /* Posts */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    SocialPostWidget(
                                      key: Key(
                                          'Keyaav_${postIndex}_of_${_model.pagingController!.itemList!.length}'),
                                      post: postItem,
                                      allowPFPClick: true,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.exploreAppBarModel,
                        updateCallback: () => setState(() {}),
                        child: ExploreAppBarWidget(),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navbarFloatingModel,
                          updateCallback: () => setState(() {}),
                          child: NavbarFloatingWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
