import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar/custom_app_bar_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar_floating/navbar_floating_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().currentPage = 'Home';
      });
      if (FFAppState().newAccount == true) {
        context.pushNamed('EditProfile');
      }
    });
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                              RefreshIndicator(
                            onRefresh: () async {
                              setState(
                                  () => _model.pagingController?.refresh());
                              await _model.waitForOnePage();
                            },
                            child: PagedListView<ApiPagingParams, dynamic>(
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
                                    cultureKey: FFLocalizations.of(context)
                                        .languageCode,
                                    page: nextPageMarker.nextPageNumber,
                                  )
                                      .then((listViewGetUserTimelineResponse) {
                                    final pageItems =
                                        FeedGroup.getUserTimelineCall
                                            .posts(
                                              listViewGetUserTimelineResponse
                                                  .jsonBody,
                                            )!
                                            .map((e) => e)
                                            .toList() as List;
                                    final newNumItems =
                                        nextPageMarker.numItems +
                                            pageItems.length;
                                    _model.pagingController!.appendPage(
                                      pageItems,
                                      (pageItems.length > 0)
                                          ? ApiPagingParams(
                                              nextPageNumber: nextPageMarker
                                                      .nextPageNumber +
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
                              builderDelegate:
                                  PagedChildBuilderDelegate<dynamic>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                                noItemsFoundIndicatorBuilder: (_) =>
                                    EmptyListWidget(
                                  text: FFLocalizations.of(context).getText(
                                    '8lea1q8j' /* You haven't followed anyone ye... */,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .appbarSpacer,
                                          ),
                                        ),
                                      SocialPostWidget(
                                        key: Key(
                                            'Keyivv_${postIndex}_of_${_model.pagingController!.itemList!.length}'),
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
                      ),
                      wrapWithModel(
                        model: _model.customAppBarModel,
                        updateCallback: () => setState(() {}),
                        child: CustomAppBarWidget(),
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
