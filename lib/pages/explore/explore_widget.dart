import '/backend/api_requests/api_calls.dart';
import '/components/explore_app_bar/explore_app_bar_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/components/people_chip/people_chip_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());
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
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
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
                            FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(SocialPostsCall.call()))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final listViewSocialPostsResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final post = SocialPostsCall.posts(
                                      listViewSocialPostsResponse.jsonBody,
                                    )?.map((e) => e).toList()?.toList() ??
                                    [];
                                return RefreshIndicator(
                                  onRefresh: () async {
                                    _model.apiResultbmf =
                                        await SocialPostsCall.call();
                                    if (!(_model.apiResultbmf?.succeeded ??
                                        true)) {
                                      await Future.delayed(
                                          const Duration(milliseconds: 1000));
                                    }
                                    setState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleter();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: post.length,
                                    itemBuilder: (context, postIndex) {
                                      final postItem = post[postIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Because of the Appbar we don't want to start the posts directly underneath so on the very first post we want to introduce some spacing
                                          if (postIndex == 0)
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 114.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .appbarSpacer,
                                              ),
                                            ),
                                          if (postIndex == 0)
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
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
                                                                      10.0),
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
                                                                .subtitle2,
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
                                                                        10.0),
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
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                PeopleChipWidget(
                                                              key: Key(
                                                                  'Keylvk_${postIndex}_of_${post.length}'),
                                                              post: postItem,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                PeopleChipWidget(
                                                              key: Key(
                                                                  'Keyjm9_${postIndex}_of_${post.length}'),
                                                              post: postItem,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                PeopleChipWidget(
                                                              key: Key(
                                                                  'Keylkj_${postIndex}_of_${post.length}'),
                                                              post: postItem,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                PeopleChipWidget(
                                                              key: Key(
                                                                  'Keyds3_${postIndex}_of_${post.length}'),
                                                              post: postItem,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                PeopleChipWidget(
                                                              key: Key(
                                                                  'Keyzg4_${postIndex}_of_${post.length}'),
                                                              post: postItem,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
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
                                                          'v05eekcn' /* Posts */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          SocialPostWidget(
                                            key: Key(
                                                'Keyaav_${postIndex}_of_${post.length}'),
                                            post: postItem,
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
    );
  }
}
