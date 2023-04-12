// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/* I commented out this action until we get it working

Future<bool> errorMessage(dynamic? result) async {
  if (getJsonField(
        (result?.jsonBody ?? ''),
        r'''$.responseStatus.message''',
      ) ==
      'Success') {
    return true;
  } else {
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Sorry! There was an error.'),
              content: Text(getJsonField(
                (result?.jsonBody ?? ''),
                r'''$.responseStatus.message''',
              ).toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text('Ok'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Report Bug'),
                ),
              ],
            );
          },
        ) ??
        false;
    if (confirmDialogResponse) {
      context.pushNamed('ReportABug');
    } else {
      return false;
    }
  }

  return false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

*/
