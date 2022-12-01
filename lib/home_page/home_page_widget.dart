import '../backend/api_requests/api_calls.dart';
import '../components/custom_app_bar_widget.dart';
import '../components/nav_bar1_widget.dart';
import '../components/social_post_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ApiCallResponse? apiResultbmf;
  Completer<ApiCallResponse>? _apiRequestCompleter;
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
                      FutureBuilder<ApiCallResponse>(
                        future: (_apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(SocialPostsCall.call()))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final listViewSocialPostsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final post = SocialPostsCall.posts(
                                listViewSocialPostsResponse.jsonBody,
                              ).map((e) => e).toList();
                              return RefreshIndicator(
                                onRefresh: () async {
                                  apiResultbmf = await SocialPostsCall.call();
                                  if (!(apiResultbmf?.succeeded ?? true)) {
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                  }
                                  setState(() => _apiRequestCompleter = null);
                                  await waitForApiRequestCompleter();
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
                                        if (postIndex == 0)
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 54,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF22282F),
                                            ),
                                          ),
                                        SocialPostWidget(
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

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
