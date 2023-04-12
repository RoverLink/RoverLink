import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'social_post_copy6_model.dart';
export 'social_post_copy6_model.dart';

class SocialPostCopy6Widget extends StatefulWidget {
  const SocialPostCopy6Widget({
    Key? key,
    this.post,
  }) : super(key: key);

  final dynamic post;

  @override
  _SocialPostCopy6WidgetState createState() => _SocialPostCopy6WidgetState();
}

class _SocialPostCopy6WidgetState extends State<SocialPostCopy6Widget> {
  late SocialPostCopy6Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialPostCopy6Model());
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
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: 700.0,
          ),
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
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'OtherProfile',
                        queryParams: {
                          'user': serializeParam(
                            getJsonField(
                              widget.post,
                              r'''$.author.id''',
                            ).toString(),
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: getJsonField(
                              widget.post,
                              r'''$.author.profilePhotoUrl''',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 0.0, 4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getJsonField(
                                  widget.post,
                                  r'''$.author.displayName''',
                                ).toString().maybeHandleOverflow(
                                      maxChars: 30,
                                      replacement: '…',
                                    ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Fira Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '@${getJsonField(
                                        widget.post,
                                        r'''$.author.userName''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Fira Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'eo0fd8w9' /* • */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Fira Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        dateTimeFormat(
                                          'relative',
                                          functions.fromJsonDate(getJsonField(
                                            widget.post,
                                            r'''$.createdDate''',
                                          ).toString()),
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Fira Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 8.0),
                        child: custom_widgets.PostTextViewer(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 100.0,
                          linkTextColor: FlutterFlowTheme.of(context).primary,
                          truncate: false,
                          maxLines: 10,
                          viewMoreText: FFLocalizations.of(context).getText(
                            'wkatpzex' /* Expand v */,
                          ),
                          viewLessText: FFLocalizations.of(context).getText(
                            'tlqt764i' /* Collapse ^ */,
                          ),
                          textScaleFactor: 1.2,
                          post: widget.post!,
                          urlHandler: () async {
                            await launchURL(FFAppState().selectedPostEntity);
                          },
                          emailHandler: () async {
                            await launchUrl(Uri(
                              scheme: 'mailto',
                              path: FFAppState().selectedPostEntity,
                            ));
                          },
                          phoneHandler: () async {},
                          mentionHandler: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content:
                                      Text(FFAppState().selectedPostEntity),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(
                              'OtherProfile',
                              queryParams: {
                                'user': serializeParam(
                                  FFAppState().selectedPostEntity,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          hashtagHandler: () async {},
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        getJsonField(
                              widget.post,
                              r'''$.attachments[?(@.attachmentType=='Image')]''',
                            ) !=
                            null,
                        true,
                      ))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          imageUrl: getJsonField(
                                            functions
                                                .returnFirstItem(getJsonField(
                                              widget.post,
                                              r'''$.attachments''',
                                            )),
                                            r'''$.link''',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: getJsonField(
                                          functions
                                              .returnFirstItem(getJsonField(
                                            widget.post,
                                            r'''$.attachments''',
                                          )),
                                          r'''$.link''',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: getJsonField(
                                    functions.returnFirstItem(getJsonField(
                                      widget.post,
                                      r'''$.attachments''',
                                    )),
                                    r'''$.link''',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: CachedNetworkImage(
                                      imageUrl: getJsonField(
                                        functions.returnFirstItem(getJsonField(
                                          widget.post,
                                          r'''$.attachments''',
                                        )),
                                        r'''$.link''',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.mode_comment_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  _model.imageDownload =
                                      await actions.downloadImage(
                                    getJsonField(
                                      functions.returnFirstItem(getJsonField(
                                        widget.post,
                                        r'''$.attachments''',
                                      )),
                                      r'''$.link''',
                                    ),
                                    isiOS,
                                    isAndroid,
                                    isWeb,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Image Downloaded',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.download_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) => InkWell(
                                  onTap: () async {
                                    await Share.share(
                                      getJsonField(
                                                functions.returnFirstItem(
                                                    getJsonField(
                                                  widget.post,
                                                  r'''$.attachments''',
                                                )),
                                                r'''$.link''',
                                              ) !=
                                              null
                                          ? '${getJsonField(
                                              widget.post,
                                              r'''$.text''',
                                            ).toString()} ${getJsonField(
                                              functions
                                                  .returnFirstItem(getJsonField(
                                                widget.post,
                                                r'''$.attachments''',
                                              )),
                                              r'''$.link''',
                                            ).toString()}'
                                          : getJsonField(
                                              widget.post,
                                              r'''$.text''',
                                            ).toString(),
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                  child: Icon(
                                    Icons.ios_share,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
