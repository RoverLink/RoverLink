import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/loading_wheel/loading_wheel_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreatePostModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String currentlyExpanded = 'Nothing';

  List<String> uploadedImageID = [];
  void addToUploadedImageID(String item) => uploadedImageID.add(item);
  void removeFromUploadedImageID(String item) => uploadedImageID.remove(item);
  void removeAtIndexFromUploadedImageID(int index) =>
      uploadedImageID.removeAt(index);

  String visibility = 'Public';

  bool useDate = false;

  String? group;

  String? groupName;

  String groupPFP = 'https://roverlink.github.io/img/empty.png';

  double progressBar = 0.0;

  bool uploading = false;

  List<String> uploadedVideos = [];
  void addToUploadedVideos(String item) => uploadedVideos.add(item);
  void removeFromUploadedVideos(String item) => uploadedVideos.remove(item);
  void removeAtIndexFromUploadedVideos(int index) =>
      uploadedVideos.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for LoadingWheel component.
  late LoadingWheelModel loadingWheelModel;
  DateTime? datePicked;
  // State field(s) for ListView widget.
  PagingController<ApiPagingParams, dynamic>? pagingController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (CreateAttachment)] action in IconButton widget.
  ApiCallResponse? uploadPostAttachment;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (CreateAttachment)] action in IconButton widget.
  ApiCallResponse? uploadPostAttachment2;
  // Stores action output result for [Backend Call - API (CreatePost)] action in Button widget.
  ApiCallResponse? createPostResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    loadingWheelModel = createModel(context, () => LoadingWheelModel());
  }

  void dispose() {
    backButtonModel.dispose();
    textController?.dispose();
    loadingWheelModel.dispose();
  }

  /// Additional helper methods are added here.

}
