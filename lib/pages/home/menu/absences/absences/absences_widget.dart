import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'absences_model.dart';
export 'absences_model.dart';

class AbsencesWidget extends StatefulWidget {
  const AbsencesWidget({Key? key}) : super(key: key);

  @override
  _AbsencesWidgetState createState() => _AbsencesWidgetState();
}

class _AbsencesWidgetState extends State<AbsencesWidget> {
  late AbsencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AbsencesModel());
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
            'wbm7jlpz' /* Absences */,
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
              child: Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      setState(() => _model.pagingController?.refresh());
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
                          AbsencesGroup.getAbsencesCall
                              .call(
                            jwtToken: currentJwtToken,
                            includeDeleted: false,
                            page: nextPageMarker.nextPageNumber,
                          )
                              .then((listViewGetAbsencesResponse) {
                            final pageItems = AbsencesGroup.getAbsencesCall
                                .absences(
                                  listViewGetAbsencesResponse.jsonBody,
                                )!
                                .map((e) => e)
                                .toList() as List;
                            final newNumItems =
                                nextPageMarker.numItems + pageItems.length;
                            _model.pagingController!.appendPage(
                              pageItems,
                              (pageItems.length > 0)
                                  ? ApiPagingParams(
                                      nextPageNumber:
                                          nextPageMarker.nextPageNumber + 1,
                                      numItems: newNumItems,
                                      lastResponse: listViewGetAbsencesResponse,
                                    )
                                  : null,
                            );
                          });
                        });
                        return _model.pagingController!;
                      }(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => EmptyListWidget(
                          text: 'You haven\'t submitted any absences yet.',
                        ),
                        itemBuilder: (context, _, absencesIndex) {
                          final absencesItem =
                              _model.pagingController!.itemList![absencesIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (absencesIndex == 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 15.0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed(
                                      'AbsenceExpanded',
                                      queryParams: {
                                        'absence': serializeParam(
                                          absencesItem,
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10.0,
                                          color: Color(0x3416202A),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  if (getJsonField(
                                                        absencesItem,
                                                        r'''$.state''',
                                                      ) ==
                                                      'WaitingForApproval')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1.5,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidClock,
                                                          color:
                                                              Color(0xFFFF8000),
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        absencesItem,
                                                        r'''$.state''',
                                                      ) ==
                                                      'Approved')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    9.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color:
                                                              Color(0xFF206B00),
                                                          size: 28.5,
                                                        ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        absencesItem,
                                                        r'''$.state''',
                                                      ) ==
                                                      'NotApproved')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    9.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.cancel,
                                                          color:
                                                              Color(0xFFA40000),
                                                          size: 28.5,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Text(
                                                  getJsonField(
                                                    absencesItem,
                                                    r'''$.studentName''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 0.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 10.0, 15.0, 10.0),
                                            child: Text(
                                              getJsonField(
                                                        absencesItem,
                                                        r'''$.reason''',
                                                      ) ==
                                                      'Other Reason'
                                                  ? getJsonField(
                                                      absencesItem,
                                                      r'''$.otherReason''',
                                                    ).toString()
                                                  : getJsonField(
                                                      absencesItem,
                                                      r'''$.reason''',
                                                    ).toString(),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 0.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 10.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'For: ${functions.formatDateTime(getJsonField(
                                                      absencesItem,
                                                      r'''$.absenceDate''',
                                                    ).toString(), 'M-d-y')}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    () {
                                                      if (getJsonField(
                                                            absencesItem,
                                                            r'''$.state''',
                                                          ) ==
                                                          'Approved') {
                                                        return 'Approved';
                                                      } else if (getJsonField(
                                                            absencesItem,
                                                            r'''$.state''',
                                                          ) ==
                                                          'NotApproved') {
                                                        return 'Rejected';
                                                      } else {
                                                        return 'Awaiting Approval';
                                                      }
                                                    }(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: () {
                                                            if (getJsonField(
                                                                  absencesItem,
                                                                  r'''$.state''',
                                                                ) ==
                                                                'Approved') {
                                                              return Color(
                                                                  0xFF206B00);
                                                            } else if (getJsonField(
                                                                  absencesItem,
                                                                  r'''$.state''',
                                                                ) ==
                                                                'NotApproved') {
                                                              return Color(
                                                                  0xFFA40000);
                                                            } else {
                                                              return Color(
                                                                  0xFFFF8000);
                                                            }
                                                          }(),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
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
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('ReportAbsence');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 40.0,
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
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '252c3uhe' /* Submit New Absence */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
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
