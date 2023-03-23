import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'schools_followed_model.dart';
export 'schools_followed_model.dart';

class SchoolsFollowedWidget extends StatefulWidget {
  const SchoolsFollowedWidget({Key? key}) : super(key: key);

  @override
  _SchoolsFollowedWidgetState createState() => _SchoolsFollowedWidgetState();
}

class _SchoolsFollowedWidgetState extends State<SchoolsFollowedWidget> {
  late SchoolsFollowedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchoolsFollowedModel());
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
            'fuyx7927' /* Schools */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: FlutterFlowTheme.of(context).primaryText,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title2Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm9qxt4fu' /* Easton Area High School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subEahsValue ??= FFAppState()
                                        .subscriptions
                                        .contains('eahs'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subEahsValue = newValue!);
                                      if (newValue!) {
                                        _model.subToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'eahs',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'eahs',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'vlqitd1o' /* Easton Area Middle School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subEamsValue ??= FFAppState()
                                        .subscriptions
                                        .contains('eams'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subEamsValue = newValue!);
                                      if (newValue!) {
                                        _model.subEamsToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'eams',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subEamsToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'eams',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wc8rlbyt' /* Palmer Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subPalmerValue ??=
                                        FFAppState()
                                            .subscriptions
                                            .contains('palmer'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subPalmerValue = newValue!);
                                      if (newValue!) {
                                        _model.subPalmerToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'palmer',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subPalmerToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'palmer',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '04c1x7v4' /* Forks Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subForksValue ??= FFAppState()
                                        .subscriptions
                                        .contains('forks'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subForksValue = newValue!);
                                      if (newValue!) {
                                        _model.subForksToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'forks',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subForksToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'forks',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '0bn319g5' /* Tracy Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subTracyValue ??= FFAppState()
                                        .subscriptions
                                        .contains('tracy'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subTracyValue = newValue!);
                                      if (newValue!) {
                                        _model.subTracyToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'tracy',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subTracyToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'tracy',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'hdkpi7im' /* Cheston Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subChestonValue ??=
                                        FFAppState()
                                            .subscriptions
                                            .contains('cheston'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subChestonValue = newValue!);
                                      if (newValue!) {
                                        _model.subChestonToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'cheston',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subChestonToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'cheston',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'jf9llyjv' /* Paxinosa Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subPaxinosaValue ??=
                                        FFAppState()
                                            .subscriptions
                                            .contains('paxinosa'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subPaxinosaValue = newValue!);
                                      if (newValue!) {
                                        _model.subPaxinosaToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'paxinosa',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subPaxinosaToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'paxinosa',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'aggkinoa' /* Shawnee Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subShawneeValue ??=
                                        FFAppState()
                                            .subscriptions
                                            .contains('shawnee'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subShawneeValue = newValue!);
                                      if (newValue!) {
                                        _model.subShawneeToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'shawnee',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subShawneeToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'shawnee',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '5s7gnv81' /* March Elementary School */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subMarchValue ??= FFAppState()
                                        .subscriptions
                                        .contains('march'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subMarchValue = newValue!);
                                      if (newValue!) {
                                        _model.subMarchToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'march',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subMarchToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'march',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x3416202A),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'dcfvvtq2' /* Easton Cyber Academy */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.subCyberValue ??= FFAppState()
                                        .subscriptions
                                        .contains('cyber'),
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.subCyberValue = newValue!);
                                      if (newValue!) {
                                        _model.subCyberToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'cyber',
                                          true,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        _model.subCyberToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'cyber',
                                          false,
                                        );
                                        FFAppState().update(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
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
      ),
    );
  }
}
