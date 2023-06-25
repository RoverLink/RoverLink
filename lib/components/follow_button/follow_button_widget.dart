import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'follow_button_model.dart';
export 'follow_button_model.dart';

class FollowButtonWidget extends StatefulWidget {
  const FollowButtonWidget({
    Key? key,
    this.followState,
    this.id,
    bool? minimized,
    bool? isGroup,
  })  : this.minimized = minimized ?? false,
        this.isGroup = isGroup ?? false,
        super(key: key);

  final String? followState;
  final String? id;
  final bool minimized;
  final bool isGroup;

  @override
  _FollowButtonWidgetState createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  late FollowButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () async {
        var _shouldSetState = false;
        if (FFAppState().isAnonymous) {
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text(
                        'Following is not available when signed in as a guest'),
                    content: Text('Please try again once your logged in'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Log Out'),
                      ),
                    ],
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            context.pushNamed('SigningOut');
          }
          if (_shouldSetState) setState(() {});
          return;
        }
        if (((_model.newFollowState != null && _model.newFollowState != ''
                    ? _model.newFollowState
                    : widget.followState) ==
                'NotFollowed') ||
            ((_model.newFollowState != null && _model.newFollowState != ''
                    ? _model.newFollowState
                    : widget.followState) ==
                'Followed')) {
          _model.followResult = await FollowGroup.followFeedCall.call(
            jwtToken: currentJwtToken,
            id: widget.id,
            action:
                (_model.newFollowState != null && _model.newFollowState != ''
                            ? _model.newFollowState
                            : widget.followState) ==
                        'NotFollowed'
                    ? 'Follow'
                    : 'Unfollow',
            feedType: widget.isGroup ? 'group' : 'user',
          );
          _shouldSetState = true;
          if (getJsonField(
                (_model.followResult?.jsonBody ?? ''),
                r'''$.responseStatus.message''',
              ) ==
              'Success') {
            setState(() {
              _model.newFollowState =
                  (_model.newFollowState != null && _model.newFollowState != ''
                              ? _model.newFollowState
                              : widget.followState) ==
                          'NotFollowed'
                      ? 'Followed'
                      : 'NotFollowed';
            });
          } else {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Sorry! There was an error.'),
                      content: Text(getJsonField(
                        (_model.followResult?.jsonBody ?? ''),
                        r'''$.responseStatus.message''',
                      ).toString()),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Ok'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Report Bug'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              context.pushNamed('ReportABug');
            }
            if (_shouldSetState) setState(() {});
            return;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.isGroup
                    ? 'This group dosen\'t allow following.'
                    : 'This person dosen\'t allow following.',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          );
        }

        if (_shouldSetState) setState(() {});
      },
      text: () {
        if ((_model.newFollowState != null && _model.newFollowState != ''
                ? _model.newFollowState
                : widget.followState) ==
            'NotFollowed') {
          return 'Follow';
        } else if ((_model.newFollowState != null && _model.newFollowState != ''
                ? _model.newFollowState
                : widget.followState) ==
            'Followed') {
          return 'Unfollow';
        } else {
          return 'Disabled';
        }
      }(),
      options: FFButtonOptions(
        height: widget.minimized ? 20.0 : 28.0,
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: () {
          if ((_model.newFollowState != null && _model.newFollowState != ''
                  ? _model.newFollowState
                  : widget.followState) ==
              'NotFollowed') {
            return FlutterFlowTheme.of(context).primary;
          } else if ((_model.newFollowState != null &&
                      _model.newFollowState != ''
                  ? _model.newFollowState
                  : widget.followState) ==
              'Followed') {
            return FlutterFlowTheme.of(context).secondaryBackground;
          } else {
            return Color(0xFF420000);
          }
        }(),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color:
                  (_model.newFollowState != null && _model.newFollowState != ''
                              ? _model.newFollowState
                              : widget.followState) ==
                          'NotFollowed'
                      ? Colors.white
                      : FlutterFlowTheme.of(context).secondaryText,
              fontSize: widget.minimized ? 10.0 : 16.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        elevation: 2.0,
        borderRadius: BorderRadius.circular(15.0),
      ),
      showLoadingIndicator: false,
    );
  }
}
