import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/follow_button/follow_button_widget.dart';
import '/components/social_post/social_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'other_profile_model.dart';
export 'other_profile_model.dart';

class OtherProfileWidget extends StatefulWidget {
  const OtherProfileWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final String? user;

  @override
  _OtherProfileWidgetState createState() => _OtherProfileWidgetState();
}

class _OtherProfileWidgetState extends State<OtherProfileWidget> {
  late OtherProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherProfileModel());
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
      future: UsersGroup.getUserProfileCall.call(
        userId: widget.user,
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
        final otherProfileGetUserProfileResponse = snapshot.data!;
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
                  otherProfileGetUserProfileResponse.jsonBody,
                  r'''$.profile.displayName''',
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Hero(
                              tag: getJsonField(
                                otherProfileGetUserProfileResponse.jsonBody,
                                r'''$.profile.profilePhotoUrl''',
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
                                  imageUrl: getJsonField(
                                    otherProfileGetUserProfileResponse.jsonBody,
                                    r'''$.profile.profilePhotoUrl''',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            '@${getJsonField(
                              otherProfileGetUserProfileResponse.jsonBody,
                              r'''$.profile.userName''',
                            ).toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 17.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.followButtonModel,
                            updateCallback: () => setState(() {}),
                            child: FollowButtonWidget(
                              followState: getJsonField(
                                otherProfileGetUserProfileResponse.jsonBody,
                                r'''$.profile.followState''',
                              ).toString(),
                              minimized: false,
                              id: getJsonField(
                                otherProfileGetUserProfileResponse.jsonBody,
                                r'''$.profile.id''',
                              ).toString(),
                              isGroup: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qjaixdvc' /* Posts */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: FeedGroup.getFeedCall.call(
                            id: widget.user,
                            cultureKey:
                                FFLocalizations.of(context).languageCode,
                            jwtToken: currentJwtToken,
                            feedType: 'user',
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: LinearProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }
                            final listViewGetFeedResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final profilePost = FeedGroup.getFeedCall
                                        .posts(
                                          listViewGetFeedResponse.jsonBody,
                                        )
                                        ?.map((e) => e)
                                        .toList()
                                        ?.toList() ??
                                    [];
                                if (profilePost.isEmpty) {
                                  return Container(
                                    height: 300.0,
                                    child: EmptyListWidget(
                                      text: FFLocalizations.of(context).getText(
                                        '08qpza5x' /* This person hasn't posted anyt... */,
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: profilePost.length,
                                  itemBuilder: (context, profilePostIndex) {
                                    final profilePostItem =
                                        profilePost[profilePostIndex];
                                    return SocialPostWidget(
                                      key: Key(
                                          'Keyyi1_${profilePostIndex}_of_${profilePost.length}'),
                                      post: profilePostItem,
                                      allowPFPClick: false,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
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
