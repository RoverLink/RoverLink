import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/people_chip_large/people_chip_large_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'following_model.dart';
export 'following_model.dart';

class FollowingWidget extends StatefulWidget {
  const FollowingWidget({Key? key}) : super(key: key);

  @override
  _FollowingWidgetState createState() => _FollowingWidgetState();
}

class _FollowingWidgetState extends State<FollowingWidget> {
  late FollowingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowingModel());
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: wrapWithModel(
            model: _model.backButtonModel,
            updateCallback: () => setState(() {}),
            child: BackButtonWidget(),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'klt9t08p' /* Following */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: FlutterFlowTheme.of(context).primary,
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'ewyoxm39' /* People */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'd9refqz4' /* Groups */,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          constraints: BoxConstraints(
                            maxWidth: 600.0,
                          ),
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: FollowGroup.getFollowsCall.call(
                              jwtToken: currentJwtToken,
                              id: currentUserUid,
                              feedType: 'user',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final listViewGetFollowsResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final users = FollowGroup.getFollowsCall
                                          .follows(
                                            listViewGetFollowsResponse.jsonBody,
                                          )
                                          ?.map((e) => e)
                                          .toList()
                                          ?.toList() ??
                                      [];
                                  if (users.isEmpty) {
                                    return EmptyListWidget(
                                      text: FFLocalizations.of(context).getText(
                                        'bfxvopxw' /* You haven't followed anyone ye... */,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: users.length,
                                    itemBuilder: (context, usersIndex) {
                                      final usersItem = users[usersIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (usersIndex == 0)
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: PeopleChipLargeWidget(
                                              key: Key(
                                                  'Keyege_${usersIndex}_of_${users.length}'),
                                              user: usersItem,
                                              isGroup: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          constraints: BoxConstraints(
                            maxWidth: 600.0,
                          ),
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: FollowGroup.getFollowsCall.call(
                              jwtToken: currentJwtToken,
                              id: currentUserUid,
                              feedType: 'group',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final listViewGetFollowsResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final groups = FollowGroup.getFollowsCall
                                          .follows(
                                            listViewGetFollowsResponse.jsonBody,
                                          )
                                          ?.map((e) => e)
                                          .toList()
                                          ?.toList() ??
                                      [];
                                  if (groups.isEmpty) {
                                    return EmptyListWidget(
                                      text: FFLocalizations.of(context).getText(
                                        'azg71tso' /* You haven't followed any group... */,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: groups.length,
                                    itemBuilder: (context, groupsIndex) {
                                      final groupsItem = groups[groupsIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (groupsIndex == 0)
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: PeopleChipLargeWidget(
                                              key: Key(
                                                  'Keyq30_${groupsIndex}_of_${groups.length}'),
                                              user: groupsItem,
                                              isGroup: true,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
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
    );
  }
}
