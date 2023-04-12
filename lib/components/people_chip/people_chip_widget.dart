import '/components/follow_button/follow_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'people_chip_model.dart';
export 'people_chip_model.dart';

class PeopleChipWidget extends StatefulWidget {
  const PeopleChipWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final dynamic user;

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: InkWell(
        onTap: () async {
          context.pushNamed(
            'OtherProfile',
            queryParams: {
              'user': serializeParam(
                getJsonField(
                  widget.user,
                  r'''$.id''',
                ).toString(),
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 85.0,
            height: 120.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0x3416202A),
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: getJsonField(
                      widget.user,
                      r'''$.profilePhotoUrl''',
                    ),
                    transitionOnUserGestures: true,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: getJsonField(
                          widget.user,
                          r'''$.profilePhotoUrl''',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    getJsonField(
                      widget.user,
                      r'''$.displayName''',
                    ).toString().maybeHandleOverflow(
                          maxChars: 8,
                          replacement: '…',
                        ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Fira Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                  Text(
                    '@${getJsonField(
                      widget.user,
                      r'''$.userName''',
                    ).toString()}'
                        .maybeHandleOverflow(
                      maxChars: 7,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Fira Sans',
                          color: Color(0xFF57636C),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.followButtonModel,
                      updateCallback: () => setState(() {}),
                      child: FollowButtonWidget(
                        followState: getJsonField(
                          widget.user,
                          r'''$.followState''',
                        ).toString(),
                        minimized: true,
                        id: getJsonField(
                          widget.user,
                          r'''$.id''',
                        ).toString(),
                        isGroup: false,
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
