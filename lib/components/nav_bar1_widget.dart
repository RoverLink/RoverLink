import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({Key? key}) : super(key: key);

  @override
  _NavBar1WidgetState createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      alignment: AlignmentDirectional(0, 0),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 70,
                    icon: Icon(
                      Icons.home_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 40,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 70,
                        fillColor: FlutterFlowTheme.of(context).primaryColor,
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          print('MiddleButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 70,
                    icon: FaIcon(
                      FontAwesomeIcons.solidCalendar,
                      color: Color(0xFF9299A1),
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pushNamed('NewCalendar');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
