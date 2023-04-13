import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
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
import 'social_post_model.dart';
export 'social_post_model.dart';

class SocialPostWidget extends StatefulWidget {
  const SocialPostWidget({
    Key? key,
    this.post,
    bool? allowPFPClick,
  })  : this.allowPFPClick = allowPFPClick ?? true,
        super(key: key);

  final dynamic post;
  final bool allowPFPClick;

  @override
  _SocialPostWidgetState createState() => _SocialPostWidgetState();
}

class _SocialPostWidgetState extends State<SocialPostWidget> {
  late SocialPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialPostModel());
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
                      if (widget.allowPFPClick) {
                        if (getJsonField(
                              widget.post,
                              r'''$.author.userName''',
                            ) ==
                            valueOrDefault(currentUserDocument?.username, '')) {
                          context.pushNamed('YourProfile');
                        } else {
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
                        }
                      }
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
                                          '7hjo81wt' /* • */,
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
                          maxLines: 25,
                          viewMoreText: FFLocalizations.of(context).getText(
                            'zogww4od' /* Read More */,
                          ),
                          viewLessText: FFLocalizations.of(context).getText(
                            'a002w5ri' /* Read Less */,
                          ),
                          textScaleFactor: 1.1,
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
                          phoneHandler: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          'Call or Text ${FFAppState().selectedPostEntity}.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Text'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Call'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await launchUrl(Uri(
                                scheme: 'tel',
                                path: FFAppState().selectedPostEntity,
                              ));
                            } else {
                              await launchUrl(Uri(
                                scheme: 'sms',
                                path: FFAppState().selectedPostEntity,
                              ));
                            }
                          },
                          mentionHandler: () async {
                            context.pushNamed(
                              'OtherProfile',
                              queryParams: {
                                'user': serializeParam(
                                  valueOrDefault<String>(
                                    FFAppState().selectedPostEntity,
                                    'y1gz4k219j3p',
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          hashtagHandler: () async {},
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxHeight: 600.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (valueOrDefault<bool>(
                                    getJsonField(
                                          widget.post,
                                          r'''$.attachments[?(@.attachmentType=='Image')]''',
                                        ) !=
                                        null,
                                    true,
                                  ))
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: CachedNetworkImage(
                                                imageUrl: '${getJsonField(
                                                  functions.returnFirstItem(
                                                      getJsonField(
                                                    widget.post,
                                                    r'''$.attachments''',
                                                  )),
                                                  r'''$.link''',
                                                ).toString()}?width=${valueOrDefault<String>(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width
                                                      .toString(),
                                                  '480',
                                                )}',
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: '${getJsonField(
                                                functions.returnFirstItem(
                                                    getJsonField(
                                                  widget.post,
                                                  r'''$.attachments''',
                                                )),
                                                r'''$.link''',
                                              ).toString()}?width=${valueOrDefault<String>(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width
                                                    .toString(),
                                                '480',
                                              )}',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: '${getJsonField(
                                          functions
                                              .returnFirstItem(getJsonField(
                                            widget.post,
                                            r'''$.attachments''',
                                          )),
                                          r'''$.link''',
                                        ).toString()}?width=${valueOrDefault<String>(
                                          MediaQuery.of(context)
                                              .size
                                              .width
                                              .toString(),
                                          '480',
                                        )}',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: CachedNetworkImage(
                                            imageUrl: '${getJsonField(
                                              functions
                                                  .returnFirstItem(getJsonField(
                                                widget.post,
                                                r'''$.attachments''',
                                              )),
                                              r'''$.link''',
                                            ).toString()}?width=${valueOrDefault<String>(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width
                                                  .toString(),
                                              '480',
                                            )}',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    getJsonField(
                                          widget.post,
                                          r'''$.attachments[?(@.attachmentType=='Video')]''',
                                        ) !=
                                        null,
                                    true,
                                  ))
                                    FlutterFlowVideoPlayer(
                                      path: getJsonField(
                                        functions.returnFirstItem(getJsonField(
                                          widget.post,
                                          r'''$.attachments''',
                                        )),
                                        r'''$.link''',
                                      ),
                                      videoType: VideoType.network,
                                      autoPlay: false,
                                      looping: false,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                      lazyLoad: false,
                                    ),
                                ],
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
                            if (valueOrDefault<bool>(
                              getJsonField(
                                    widget.post,
                                    r'''$.attachments[?(@.attachmentType=='Image')]''',
                                  ) !=
                                  null,
                              true,
                            ))
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
                                      valueOrDefault<bool>(
                                        getJsonField(
                                              widget.post,
                                              r'''$.attachments[?(@.attachmentType=='Image')]''',
                                            ) !=
                                            null,
                                        true,
                                      )
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
