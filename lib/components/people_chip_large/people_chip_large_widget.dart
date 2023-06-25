import '/auth/firebase_auth/auth_util.dart';
import '/components/follow_icon/follow_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'people_chip_large_model.dart';
export 'people_chip_large_model.dart';

class PeopleChipLargeWidget extends StatefulWidget {
  const PeopleChipLargeWidget({
    Key? key,
    this.user,
    bool? isGroup,
  })  : this.isGroup = isGroup ?? false,
        super(key: key);

  final dynamic user;
  final bool isGroup;

  @override
  _PeopleChipLargeWidgetState createState() => _PeopleChipLargeWidgetState();
}

class _PeopleChipLargeWidgetState extends State<PeopleChipLargeWidget> {
  late PeopleChipLargeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeopleChipLargeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: AlignmentDirectional(0.0, 0.0),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (widget.isGroup) {
                context.pushNamed(
                  'GroupProfile',
                  queryParameters: {
                    'group': serializeParam(
                      getJsonField(
                        widget.user,
                        r'''$.id''',
                      ).toString(),
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              } else {
                if (getJsonField(
                      widget.user,
                      r'''$.userName''',
                    ) ==
                    valueOrDefault(currentUserDocument?.username, '')) {
                  context.pushNamed('YourProfile');
                } else {
                  context.pushNamed(
                    'OtherProfile',
                    queryParameters: {
                      'user': serializeParam(
                        getJsonField(
                          widget.user,
                          r'''$.id''',
                        ).toString(),
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }
              }
            },
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Hero(
                      tag: getJsonField(
                                widget.user,
                                r'''$.profilePhotoUrl''',
                              ) ==
                              null
                          ? 'https://www.gravatar.com/avatar/bc590g26dc27001cd24c418e9f879d11?s=80&r=g&d=identicon'
                          : getJsonField(
                              widget.user,
                              r'''$.profilePhotoUrl''',
                            ),
                      transitionOnUserGestures: true,
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: getJsonField(
                                    widget.user,
                                    r'''$.profilePhotoUrl''',
                                  ) ==
                                  null
                              ? 'https://www.gravatar.com/avatar/bc590g26dc27001cd24c418e9f879d11?s=80&r=g&d=identicon'
                              : getJsonField(
                                  widget.user,
                                  r'''$.profilePhotoUrl''',
                                ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.isGroup
                                ? getJsonField(
                                    widget.user,
                                    r'''$.name''',
                                  ).toString()
                                : getJsonField(
                                    widget.user,
                                    r'''$.displayName''',
                                  ).toString(),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            widget.isGroup
                                ? '#${getJsonField(
                                    widget.user,
                                    r'''$.slug''',
                                  ).toString()}'
                                : '@${getJsonField(
                                    widget.user,
                                    r'''$.userName''',
                                  ).toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 15.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
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
        ),
        if (getJsonField(
              widget.user,
              r'''$.userName''',
            ) !=
            valueOrDefault(currentUserDocument?.username, ''))
          Align(
            alignment: AlignmentDirectional(0.8, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => wrapWithModel(
                model: _model.followIconModel,
                updateCallback: () => setState(() {}),
                child: FollowIconWidget(
                  followState: getJsonField(
                    widget.user,
                    r'''$.followState''',
                  ).toString(),
                  id: getJsonField(
                    widget.user,
                    r'''$.id''',
                  ).toString(),
                  isGroup: widget.isGroup,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
