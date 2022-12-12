import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchoolsFollowedWidget extends StatefulWidget {
  const SchoolsFollowedWidget({Key? key}) : super(key: key);

  @override
  _SchoolsFollowedWidgetState createState() => _SchoolsFollowedWidgetState();
}

class _SchoolsFollowedWidgetState extends State<SchoolsFollowedWidget> {
  bool? subChestonToggledOff;
  bool? subChestonToggledOn;
  bool? subChestonValue;
  bool? subEahsValue;
  bool? subToggledOff;
  bool? subToggledOn;
  bool? subEamsToggledOff;
  bool? subEamsToggledOn;
  bool? subEamsValue;
  bool? subPalmerToggledOff;
  bool? subPalmerToggledOn;
  bool? subPalmerValue;
  bool? subForksToggledOff;
  bool? subForksToggledOn;
  bool? subForksValue;
  bool? subTracyToggledOff;
  bool? subTracyToggledOn;
  bool? subTracyValue;
  bool? subPaxinosaToggledOff;
  bool? subPaxinosaToggledOn;
  bool? subPaxinosaValue;
  bool? subShawneeToggledOff;
  bool? subShawneeToggledOn;
  bool? subShawneeValue;
  bool? subMarchToggledOff;
  bool? subMarchToggledOn;
  bool? subMarchValue;
  bool? subCyberToggledOff;
  bool? subCyberToggledOn;
  bool? subCyberValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: BackButtonWidget(),
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
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subEahsValue ??= FFAppState()
                                        .subscriptions
                                        .contains('eahs'),
                                    onChanged: (newValue) async {
                                      setState(() => subEahsValue = newValue!);
                                      if (newValue!) {
                                        subToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'eahs',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'eahs',
                                          true,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subEamsValue ??= FFAppState()
                                        .subscriptions
                                        .contains('eams'),
                                    onChanged: (newValue) async {
                                      setState(() => subEamsValue = newValue!);
                                      if (newValue!) {
                                        subEamsToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'eams',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subEamsToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'eams',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subPalmerValue ??= FFAppState()
                                        .subscriptions
                                        .contains('palmer'),
                                    onChanged: (newValue) async {
                                      setState(
                                          () => subPalmerValue = newValue!);
                                      if (newValue!) {
                                        subPalmerToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'palmer',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subPalmerToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'palmer',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subForksValue ??= FFAppState()
                                        .subscriptions
                                        .contains('forks'),
                                    onChanged: (newValue) async {
                                      setState(() => subForksValue = newValue!);
                                      if (newValue!) {
                                        subForksToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'forks',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subForksToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'forks',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subTracyValue ??= FFAppState()
                                        .subscriptions
                                        .contains('tracy'),
                                    onChanged: (newValue) async {
                                      setState(() => subTracyValue = newValue!);
                                      if (newValue!) {
                                        subTracyToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'tracy',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subTracyToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'tracy',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subChestonValue ??= FFAppState()
                                        .subscriptions
                                        .contains('cheston'),
                                    onChanged: (newValue) async {
                                      setState(
                                          () => subChestonValue = newValue!);
                                      if (newValue!) {
                                        subChestonToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'cheston',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subChestonToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'cheston',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subPaxinosaValue ??= FFAppState()
                                        .subscriptions
                                        .contains('paxinosa'),
                                    onChanged: (newValue) async {
                                      setState(
                                          () => subPaxinosaValue = newValue!);
                                      if (newValue!) {
                                        subPaxinosaToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'paxinosa',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subPaxinosaToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'paxinosa',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subShawneeValue ??= FFAppState()
                                        .subscriptions
                                        .contains('shawnee'),
                                    onChanged: (newValue) async {
                                      setState(
                                          () => subShawneeValue = newValue!);
                                      if (newValue!) {
                                        subShawneeToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'shawnee',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subShawneeToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'shawnee',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subMarchValue ??= FFAppState()
                                        .subscriptions
                                        .contains('march'),
                                    onChanged: (newValue) async {
                                      setState(() => subMarchValue = newValue!);
                                      if (newValue!) {
                                        subMarchToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'march',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subMarchToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'march',
                                          false,
                                        );
                                        setState(() {
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
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
                                      fontSize: 15,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Switch.adaptive(
                                    value: subCyberValue ??= FFAppState()
                                        .subscriptions
                                        .contains('cyber'),
                                    onChanged: (newValue) async {
                                      setState(() => subCyberValue = newValue!);
                                      if (newValue!) {
                                        subCyberToggledOn =
                                            await actions.setSubscription(
                                          context,
                                          'cyber',
                                          true,
                                        );
                                        setState(() {
                                          FFAppState().subscriptions =
                                              FFAppState()
                                                  .subscriptions
                                                  .toList();
                                        });

                                        setState(() {});
                                      } else {
                                        subCyberToggledOff =
                                            await actions.setSubscription(
                                          context,
                                          'cyber',
                                          false,
                                        );
                                        setState(() {
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
