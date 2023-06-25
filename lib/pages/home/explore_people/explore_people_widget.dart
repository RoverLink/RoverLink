import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/people_chip_large/people_chip_large_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'explore_people_model.dart';
export 'explore_people_model.dart';

class ExplorePeopleWidget extends StatefulWidget {
  const ExplorePeopleWidget({
    Key? key,
    this.users,
    this.query,
  }) : super(key: key);

  final dynamic users;
  final String? query;

  @override
  _ExplorePeopleWidgetState createState() => _ExplorePeopleWidgetState();
}

class _ExplorePeopleWidgetState extends State<ExplorePeopleWidget> {
  late ExplorePeopleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExplorePeopleModel());

    _model.searchFieldController ??= TextEditingController(text: widget.query);
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
              'jw8tsx2p' /* People */,
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
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final users = getJsonField(
                        widget.users,
                        r'''$.users''',
                      ).toList();
                      if (users.isEmpty) {
                        return EmptyListWidget(
                          text: widget.query != null && widget.query != ''
                              ? 'We couldn\'t find anyone named ${widget.query}.'
                              : 'We couldn\'t find anyone.',
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
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      widget.query != null && widget.query != ''
                                          ? 60.0
                                          : 12.0,
                                  decoration: BoxDecoration(),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: PeopleChipLargeWidget(
                                  key: Key(
                                      'Key49k_${usersIndex}_of_${users.length}'),
                                  user: usersItem,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  if (widget.query != null && widget.query != '')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Visibility(
                          visible: widget.query != null && widget.query != '',
                          child: TextFormField(
                            controller: _model.searchFieldController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchFieldController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            onFieldSubmitted: (_) async {
                              _model.searchResult =
                                  await UsersGroup.getUsersCall.call(
                                jwtToken: currentJwtToken,
                                query: _model.searchFieldController.text,
                              );
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                'ExplorePeople',
                                queryParameters: {
                                  'users': serializeParam(
                                    (_model.searchResult?.jsonBody ?? ''),
                                    ParamType.JSON,
                                  ),
                                  'query': serializeParam(
                                    _model.searchFieldController.text,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );

                              setState(() {});
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'o0t6wt99' /* Search... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    fontSize: 14.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              prefixIcon: Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 17.0,
                              ),
                              suffixIcon: _model
                                      .searchFieldController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.searchFieldController?.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 15.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.searchFieldControllerValidator
                                .asValidator(context),
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
