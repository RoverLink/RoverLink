import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'signing_out_model.dart';
export 'signing_out_model.dart';

class SigningOutWidget extends StatefulWidget {
  const SigningOutWidget({Key? key}) : super(key: key);

  @override
  _SigningOutWidgetState createState() => _SigningOutWidgetState();
}

class _SigningOutWidgetState extends State<SigningOutWidget>
    with TickerProviderStateMixin {
  late SigningOutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 5,
          offset: Offset(0.0, 0.0),
          rotation: 0.035,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0.8,
          end: 1.5,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 3000.ms,
          begin: 1.0,
          end: 0.6,
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 3000.ms,
          begin: 0.0,
          end: 0.01,
        ),
      ],
    ),
    'cardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SigningOutModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 4000));
      FFAppState().update(() {
        FFAppState().currentPage = '';
        FFAppState().isAnonymous = false;
      });
      GoRouter.of(context).prepareAuthEvent();
      await signOut();

      context.goNamedAuth(
        'Onboarding',
        mounted,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.leftToRight,
          ),
        },
      );
    });
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF430000),
                          FlutterFlowTheme.of(context).black600
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'k3xhf8py' /* Logging Out... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title1Family,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).title1Family),
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            color: Color(0x00101213),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00101213),
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFF94A6B8),
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'cardOnPageLoadAnimation']!),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00101213),
                                  ),
                                  child: Lottie.asset(
                                    'assets/lottie_animations/thank_you2_lottie.json',
                                    width:
                                        MediaQuery.of(context).size.width * 2.5,
                                    height: 150.0,
                                    fit: BoxFit.contain,
                                    repeat: false,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
