import '../backend/api_requests/api_calls.dart';
import '../components/custom_app_bar_widget.dart';
import '../components/nav_bar1_widget.dart';
import '../components/social_post_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ApiCallResponse? apiResultbmf;
  PagingController<ApiPagingParams, dynamic>? _pagingController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 54,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            RefreshIndicator(
                              onRefresh: () async {
                                apiResultbmf = await SocialPostsCall.call();
                                if (!(apiResultbmf?.succeeded ?? true)) {
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                }
                                setState(() => _pagingController?.refresh());
                                await waitForOnePage();
                              },
                              child: PagedListView<ApiPagingParams, dynamic>(
                                pagingController: () {
                                  if (_pagingController != null) {
                                    return _pagingController!;
                                  }

                                  _pagingController = PagingController(
                                    firstPageKey: ApiPagingParams(
                                      nextPageNumber: 0,
                                      numItems: 0,
                                      lastResponse: null,
                                    ),
                                  );
                                  _pagingController!
                                      .addPageRequestListener((nextPageMarker) {
                                    SocialPostsCall.call()
                                        .then((listViewSocialPostsResponse) {
                                      final pageItems = SocialPostsCall.posts(
                                        listViewSocialPostsResponse.jsonBody,
                                      ).map((e) => e).toList() as List;
                                      final newNumItems =
                                          nextPageMarker.numItems +
                                              pageItems.length;
                                      _pagingController!.appendPage(
                                        pageItems,
                                        (pageItems.length > 0)
                                            ? ApiPagingParams(
                                                nextPageNumber: nextPageMarker
                                                        .nextPageNumber +
                                                    1,
                                                numItems: newNumItems,
                                                lastResponse:
                                                    listViewSocialPostsResponse,
                                              )
                                            : null,
                                      );
                                    });
                                  });
                                  return _pagingController!;
                                }(),
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<dynamic>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, postIndex) {
                                    final postItem =
                                        _pagingController!.itemList![postIndex];
                                    return SocialPostWidget(
                                      key: Key('SocialPost_${postIndex}'),
                                      post: postItem,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomAppBarWidget(),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: NavBar1Widget(),
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

  Future waitForOnePage({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (_pagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
