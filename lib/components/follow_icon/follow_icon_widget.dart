import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'follow_icon_model.dart';
export 'follow_icon_model.dart';

class FollowIconWidget extends StatefulWidget {
  const FollowIconWidget({
    Key? key,
    this.followState,
    this.id,
    bool? isGroup,
  })  : this.isGroup = isGroup ?? false,
        super(key: key);

  final String? followState;
  final String? id;
  final bool isGroup;

  @override
  _FollowIconWidgetState createState() => _FollowIconWidgetState();
}

class _FollowIconWidgetState extends State<FollowIconWidget> {
  late FollowIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowIconModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        var _shouldSetState = false;
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
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          if ((_model.newFollowState != null && _model.newFollowState != ''
                  ? _model.newFollowState
                  : widget.followState) ==
              'Followed')
            Icon(
              Icons.remove_circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
          if (!(((_model.newFollowState != null && _model.newFollowState != ''
                      ? _model.newFollowState
                      : widget.followState) ==
                  'NotFollowed') ||
              ((_model.newFollowState != null && _model.newFollowState != ''
                      ? _model.newFollowState
                      : widget.followState) ==
                  'Followed')))
            Icon(
              Icons.cancel,
              color: Color(0xFF420000),
              size: 30.0,
            ),
          if ((_model.newFollowState != null && _model.newFollowState != ''
                  ? _model.newFollowState
                  : widget.followState) ==
              'NotFollowed')
            Icon(
              Icons.add_circle,
              color: FlutterFlowTheme.of(context).primary,
              size: 30.0,
            ),
        ],
      ),
    );
  }
}
