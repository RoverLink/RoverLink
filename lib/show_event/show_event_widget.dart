import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowEventWidget extends StatefulWidget {
  const ShowEventWidget({
    Key? key,
    this.event,
  }) : super(key: key);

  final dynamic event;

  @override
  _ShowEventWidgetState createState() => _ShowEventWidgetState();
}

class _ShowEventWidgetState extends State<ShowEventWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).transparentBackground,
        automaticallyImplyLeading: false,
        leading: BackButtonWidget(),
        title: Text(
          FFLocalizations.of(context).getText(
            'z2rye3bx' /* Announcement */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 15, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                functions.formatDateTime(getJsonField(
                                  widget.event,
                                  r'''$.scheduledTime''',
                                ).toString()),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                getJsonField(
                                  widget.event,
                                  r'''$.englishSnippet''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final school = getJsonField(
                                      widget.event,
                                      r'''$.tags''',
                                    ).toList();
                                    return Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(school.length,
                                          (schoolIndex) {
                                        final schoolItem = school[schoolIndex];
                                        return FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: getJsonField(
                                            schoolItem,
                                            r'''$.abbreviation''',
                                          ).toString(),
                                          options: FFButtonOptions(
                                            height: 30,
                                            color: colorFromCssString(
                                              '#${getJsonField(
                                                schoolItem,
                                                r'''$.color''',
                                              ).toString()}',
                                              defaultColor: Colors.black,
                                            ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family,
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family),
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          showLoadingIndicator: false,
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Html(
                                data: getJsonField(
                                  widget.event,
                                  r'''$.englishContent''',
                                ).toString(),
                              ),
                            ],
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
