import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Users Group Code

class UsersGroup {
  static String baseUrl = 'https://archimedes.jalex.io/users';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Accept': 'application/json',
  };
  static GetUsersCall getUsersCall = GetUsersCall();
  static GetUserCall getUserCall = GetUserCall();
  static GetUserProfileCall getUserProfileCall = GetUserProfileCall();
  static GetUserProfileDetailedCall getUserProfileDetailedCall =
      GetUserProfileDetailedCall();
  static ChangeUsernameCall changeUsernameCall = ChangeUsernameCall();
  static NotifySyncCall notifySyncCall = NotifySyncCall();
  static ChangeDisplayNameCall changeDisplayNameCall = ChangeDisplayNameCall();
  static ChangeProfilePhotoCall changeProfilePhotoCall =
      ChangeProfilePhotoCall();
  static ChangeProfilePhotoUrlCall changeProfilePhotoUrlCall =
      ChangeProfilePhotoUrlCall();
  static UsernameExistsCall usernameExistsCall = UsernameExistsCall();
}

class GetUsersCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
  }) {
    final body = '''
{
  "id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetUsers',
      apiUrl: '${UsersGroup.baseUrl}/?k=0',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class GetUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUser',
      apiUrl: '${UsersGroup.baseUrl}/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class GetUserProfileCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserProfile',
      apiUrl: '${UsersGroup.baseUrl}/${userId}/profile',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class GetUserProfileDetailedCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserProfileDetailed',
      apiUrl: '${UsersGroup.baseUrl}/${userId}/profile/detailed',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class ChangeUsernameCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
    String? username = '',
  }) {
    final body = '''
{
  "id": "${userId}",
  "username": "${username}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeUsername',
      apiUrl: '${UsersGroup.baseUrl}/${userId}/name',
      callType: ApiCallType.PUT,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class NotifySyncCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
  }) {
    final body = '''
{
  "id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' NotifySync',
      apiUrl: '${UsersGroup.baseUrl}/${userId}/sync',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeDisplayNameCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
    String? displayName = '',
  }) {
    final body = '''
{
  "id": "${userId}",
  "displayName": "${displayName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeDisplayName',
      apiUrl: '${UsersGroup.baseUrl}/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeProfilePhotoCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
    String? profilePhotoAttachmentId = '',
  }) {
    final body = '''
{
  "id": "${userId}",
  "profilePhotoAttachmentId": "${profilePhotoAttachmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeProfilePhoto',
      apiUrl: '${UsersGroup.baseUrl}/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeProfilePhotoUrlCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
    String? profilePhotoUrl = '',
  }) {
    final body = '''
{
  "id": "${userId}",
  "profilePhotoUrl": "${profilePhotoUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeProfilePhotoUrl',
      apiUrl: '${UsersGroup.baseUrl}/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UsernameExistsCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? username = '',
    bool? suggestAlternative = true,
  }) {
    final body = '''
{
  "username": "${username}",
  "suggestAlternative": ${suggestAlternative}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UsernameExists',
      apiUrl: '${UsersGroup.baseUrl}/exists',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Users Group Code

/// Start Absences Group Code

class AbsencesGroup {
  static String baseUrl = 'https://archimedes.jalex.io/absences';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Content-Type': 'application/json',
  };
  static CreateAbsenceCall createAbsenceCall = CreateAbsenceCall();
  static UpdateAbsenceCall updateAbsenceCall = UpdateAbsenceCall();
  static GetAbsenceCall getAbsenceCall = GetAbsenceCall();
  static GetAbsencesCall getAbsencesCall = GetAbsencesCall();
  static UpdateAbsenceApprovalCall updateAbsenceApprovalCall =
      UpdateAbsenceApprovalCall();
  static GetAbsenceReasonsCall getAbsenceReasonsCall = GetAbsenceReasonsCall();
}

class CreateAbsenceCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? studentName = '',
    String? buildingId = '',
    String? teacher = '',
    int? gradeLevel,
    String? absenceDate = '',
    String? reasonID = '',
    String? photoAttachmentId = '',
    String? signatureAttachmentId = '',
    String? otherReason = '',
  }) {
    final body = '''
{
  "studentName": "${studentName}",
  "buildingId": "${buildingId}",
  "teacher": "${teacher}",
  "gradeLevel": ${gradeLevel},
  "absenceDate": "${absenceDate}",
  "reasonId": "${reasonID}",
  "otherReason": "${otherReason}",
  "photoAttachmentId": "${photoAttachmentId}",
  "signatureAttachmentId": "${signatureAttachmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' CreateAbsence',
      apiUrl: '${AbsencesGroup.baseUrl}/?k=0',
      callType: ApiCallType.POST,
      headers: {
        ...AbsencesGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateAbsenceCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? studentName = '',
    String? teacher = '',
    int? gradeLevel,
    String? absenceDate = '',
    String? reasonID = '',
    String? photoAttachmentId = '',
    String? parentNote = '',
    String? absenceId = '',
    String? officeNote = '',
    String? otherReason = '',
  }) {
    final body = '''
{
  "id": "${absenceId}",
  "studentName": "${studentName}",
  "teacher": "${teacher}",
  "gradeLevel": ${gradeLevel},
  "reasonId": "${reasonID}",
  "otherReason": "${otherReason}",
  "photoAttachmentId": "${photoAttachmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateAbsence',
      apiUrl: '${AbsencesGroup.baseUrl}/${absenceId}',
      callType: ApiCallType.PUT,
      headers: {
        ...AbsencesGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAbsenceCall {
  Future<ApiCallResponse> call({
    String? absenceId = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAbsence',
      apiUrl: '${AbsencesGroup.baseUrl}/${absenceId}',
      callType: ApiCallType.GET,
      headers: {
        ...AbsencesGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class GetAbsencesCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? buildingId = '',
    bool? includeDeleted,
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAbsences',
      apiUrl: '${AbsencesGroup.baseUrl}/?k=0',
      callType: ApiCallType.GET,
      headers: {
        ...AbsencesGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'BuildingId': buildingId,
        'IncludeDeleted': includeDeleted,
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic absences(dynamic response) => getJsonField(
        response,
        r'''$.absences''',
        true,
      );
}

class UpdateAbsenceApprovalCall {
  Future<ApiCallResponse> call({
    String? absenceId = '',
    String? jwtToken = '',
    bool? approved,
  }) {
    final body = '''
{
  "id": "${absenceId}",
  "approved": ${approved}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateAbsenceApproval',
      apiUrl: '${AbsencesGroup.baseUrl}/${absenceId}',
      callType: ApiCallType.PUT,
      headers: {
        ...AbsencesGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAbsenceReasonsCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAbsenceReasons',
      apiUrl: '${AbsencesGroup.baseUrl}/reasons',
      callType: ApiCallType.GET,
      headers: {
        ...AbsencesGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic absenceReasonIDs(dynamic response) => getJsonField(
        response,
        r'''$.reasons[:].id''',
        true,
      );
  dynamic absenceReason(dynamic response) => getJsonField(
        response,
        r'''$.reasons[:].reason''',
        true,
      );
}

/// End Absences Group Code

/// Start Buildings Group Code

class BuildingsGroup {
  static String baseUrl = 'https://archimedes.jalex.io/buildings';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Content-Type': 'application/json',
  };
  static GetBuildingsCall getBuildingsCall = GetBuildingsCall();
  static GetBuildingCall getBuildingCall = GetBuildingCall();
}

class GetBuildingsCall {
  Future<ApiCallResponse> call({
    bool? includeDisabled,
    bool? includeHidden,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBuildings',
      apiUrl: '${BuildingsGroup.baseUrl}/?k=0',
      callType: ApiCallType.GET,
      headers: {
        ...BuildingsGroup.headers,
      },
      params: {
        'IncludeDisabled': includeDisabled,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic buildingNames(dynamic response) => getJsonField(
        response,
        r'''$.buildings[:].name''',
        true,
      );
  dynamic buildingIDs(dynamic response) => getJsonField(
        response,
        r'''$.buildings[:].id''',
        true,
      );
}

class GetBuildingCall {
  Future<ApiCallResponse> call({
    String? buildingId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBuilding',
      apiUrl: '${BuildingsGroup.baseUrl}/${buildingId}',
      callType: ApiCallType.GET,
      headers: {
        ...BuildingsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Buildings Group Code

/// Start Posts Group Code

class PostsGroup {
  static String baseUrl = 'archimedes.jalex.io/posts';
  static Map<String, String> headers = {
    'Host': 'archimedes.jalex.io',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static CreatePostCall createPostCall = CreatePostCall();
}

class CreatePostCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? audience = '',
    String? feedTarget = '',
    List<String>? attachmentIdsList,
    String? text = '',
  }) {
    final attachmentIds = _serializeList(attachmentIdsList);

    final body = '''
{
  "audience": "${audience}",
  "feedTarget": "${feedTarget}",
  "text": "${text}",
  "attachmentIds": "${attachmentIds}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreatePost',
      apiUrl: '${PostsGroup.baseUrl}/?k=0',
      callType: ApiCallType.POST,
      headers: {
        ...PostsGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Posts Group Code

/// Start Media Group Code

class MediaGroup {
  static String baseUrl = 'https://archimedes.jalex.io/media';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Host': 'archimedes.jalex.io',
  };
  static CreateAttachmentCall createAttachmentCall = CreateAttachmentCall();
}

class CreateAttachmentCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? media,
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateAttachment',
      apiUrl: '${MediaGroup.baseUrl}/?k=0',
      callType: ApiCallType.POST,
      headers: {
        ...MediaGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'Media': media,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Media Group Code

/// Start Announcements Group Code

class AnnouncementsGroup {
  static String baseUrl = 'https://archimedes.jalex.io/announcements';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Accept': 'application/json',
  };
  static CreateAnnouncementCall createAnnouncementCall =
      CreateAnnouncementCall();
  static GetAnnouncementCall getAnnouncementCall = GetAnnouncementCall();
  static GetAnnouncementsCall getAnnouncementsCall = GetAnnouncementsCall();
}

class CreateAnnouncementCall {
  Future<ApiCallResponse> call({
    String? groupId = '',
    String? scheduleDate = '',
    String? jwtToken = '',
    String? announcementBody = '',
  }) {
    final body = '''
{
  "groupId": "${groupId}",
  "body": "${announcementBody}",
  "scheduleDate": "${scheduleDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateAnnouncement',
      apiUrl: '${AnnouncementsGroup.baseUrl}/?k=0',
      callType: ApiCallType.POST,
      headers: {
        ...AnnouncementsGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAnnouncementCall {
  Future<ApiCallResponse> call({
    String? announcementId = '',
    bool? includeDeleted,
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAnnouncement',
      apiUrl: '${AnnouncementsGroup.baseUrl}/${announcementId}',
      callType: ApiCallType.GET,
      headers: {
        ...AnnouncementsGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAnnouncementsCall {
  Future<ApiCallResponse> call({
    String? groupId = '',
    bool? includeDeleted,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAnnouncements',
      apiUrl: '${AnnouncementsGroup.baseUrl}/?k=0',
      callType: ApiCallType.GET,
      headers: {
        ...AnnouncementsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Announcements Group Code

/// Start Feed Group Code

class FeedGroup {
  static String baseUrl = 'https://archimedes.jalex.io/feed';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Accept': 'application/json',
  };
  static GetUserFeedCall getUserFeedCall = GetUserFeedCall();
}

class GetUserFeedCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? page,
    String? cultureKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserFeed',
      apiUrl: '${FeedGroup.baseUrl}/user/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...FeedGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Feed Group Code

class SocialPostsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'SocialPosts',
      apiUrl: 'https://alert.eastonsd.org/api/social',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class CalendarCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Calendar',
      apiUrl: 'https://roverlink.github.io/json/fbla_december_events.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic events(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class NotificationsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Notifications',
      apiUrl: 'https://alert.eastonsd.org/api/notifications',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'tags': "easd",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic notifications(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class TagsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Tags',
      apiUrl: 'https://alert.eastonsd.org/api/notifications/tags',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic tags(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class NavigationItemsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Navigation Items',
      apiUrl: 'https://alert.eastonsd.org/api/NavigationItems',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic navigationItems(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class TestJWTCallCall {
  static Future<ApiCallResponse> call({
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Test JWT Call',
      apiUrl: 'https://eot2zo80jvgmzmt.m.pipedream.net',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
