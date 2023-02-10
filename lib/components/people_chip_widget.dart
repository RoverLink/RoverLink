import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'people_chip_model.dart';
export 'people_chip_model.dart';

class PeopleChipWidget extends StatefulWidget {
  const PeopleChipWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  final dynamic post;

  @override
  _PeopleChipWidgetState createState() => _PeopleChipWidgetState();
}

class _PeopleChipWidgetState extends State<PeopleChipWidget> {
  late PeopleChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeopleChipModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 85,
      height: 120,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: getJsonField(
                  widget.post,
                  r'''$.authorProfileImage''',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              getJsonField(
                widget.post,
                r'''$.author''',
              ).toString().maybeHandleOverflow(
                    maxChars: 8,
                    replacement: '…',
                  ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Fira Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).subtitle1Family),
                  ),
            ),
            Text(
              '@${getJsonField(
                widget.post,
                r'''$.authorScreenName''',
              ).toString()}'
                  .maybeHandleOverflow(
                maxChars: 7,
                replacement: '…',
              ),
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Fira Sans',
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText2Family),
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  '0trp5c09' /* Follow */,
                ),
                options: FFButtonOptions(
                  height: 20,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        color: Colors.white,
                        fontSize: 14,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
