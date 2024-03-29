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
  static GetUserGroupMembershipsCall getUserGroupMembershipsCall =
      GetUserGroupMembershipsCall();
  static GetUserCalendarEventsCall getUserCalendarEventsCall =
      GetUserCalendarEventsCall();
}

class GetUsersCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? query = '',
    int? page,
  }) {
    final body = '''
{
  "query": "${query}",
  "page": "${page}"
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

  dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.users''',
        true,
      );
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

class GetUserGroupMembershipsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: ' GetUserGroupMemberships',
      apiUrl: '${UsersGroup.baseUrl}/${userId}/memberships',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic groups(dynamic response) => getJsonField(
        response,
        r'''$.groups''',
        true,
      );
}

class GetUserCalendarEventsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwtToken = '',
    String? startDate = '',
    bool? currentMonthOnly,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserCalendarEvents',
      apiUrl: '${UsersGroup.baseUrl}/${userId}/calendar/',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'StartDate': startDate,
        'CurrentMonthOnly': currentMonthOnly,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic events(dynamic response) => getJsonField(
        response,
        r'''$.events''',
        true,
      );
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
  dynamic buildings(dynamic response) => getJsonField(
        response,
        r'''$.buildings''',
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
  static String baseUrl = 'https://archimedes.jalex.io';
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
    String? attachmentIdsfromtoJsonList = '',
    String? text = '',
    String? feedType = 'user',
    String? feedId = '',
  }) {
    final body = '''
{
  "audience": "${audience}",
  "feedTarget": "${feedType}:${feedId}",
  "text": "${text}",
  "attachmentIds": ${attachmentIdsfromtoJsonList}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreatePost',
      apiUrl: '${PostsGroup.baseUrl}/posts/',
      callType: ApiCallType.POST,
      headers: {
        ...PostsGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.TEXT,
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
  static GetFeedCall getFeedCall = GetFeedCall();
  static GetUserTimelineCall getUserTimelineCall = GetUserTimelineCall();
}

class GetFeedCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? page,
    String? cultureKey = '',
    String? jwtToken = '',
    String? feedType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFeed',
      apiUrl: '${FeedGroup.baseUrl}/${feedType}/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...FeedGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'CultureKey': cultureKey,
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$.feed.posts''',
        true,
      );
  dynamic attachments(dynamic response) => getJsonField(
        response,
        r'''$.feed.posts[:].attachments''',
        true,
      );
  dynamic textspans(dynamic response) => getJsonField(
        response,
        r'''$.feed.posts[:].entities.textSpans''',
        true,
      );
}

class GetUserTimelineCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? cultureKey = '',
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserTimeline',
      apiUrl: '${FeedGroup.baseUrl}/timeline',
      callType: ApiCallType.GET,
      headers: {
        ...FeedGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'CultureKey': cultureKey,
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$.feed.posts''',
        true,
      );
}

/// End Feed Group Code

/// Start Follow Group Code

class FollowGroup {
  static String baseUrl = 'https://archimedes.jalex.io/follow';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Accept': 'application/json',
  };
  static FollowFeedCall followFeedCall = FollowFeedCall();
  static GetFollowsCall getFollowsCall = GetFollowsCall();
}

class FollowFeedCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? id = '',
    String? action = '',
    String? feedType = '',
  }) {
    final body = '''
{
  "id": "${id}",
  "action": "${action}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' FollowFeed',
      apiUrl: '${FollowGroup.baseUrl}/${feedType}/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...FollowGroup.headers,
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

class GetFollowsCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
    String? id = '',
    String? page = '',
    String? feedType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFollows',
      apiUrl: '${FollowGroup.baseUrl}/${feedType}/follows/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...FollowGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'Id': id,
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic follows(dynamic response) => getJsonField(
        response,
        r'''$.follows''',
        true,
      );
}

/// End Follow Group Code

/// Start Group Group Code

class GroupGroup {
  static String baseUrl = 'https://archimedes.jalex.io/group';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Content-Type': 'application/json',
  };
  static GetGroupCall getGroupCall = GetGroupCall();
  static GetGroupMembersCall getGroupMembersCall = GetGroupMembersCall();
}

class GetGroupCall {
  Future<ApiCallResponse> call({
    String? groupId = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetGroup',
      apiUrl: '${GroupGroup.baseUrl}/${groupId}',
      callType: ApiCallType.GET,
      headers: {
        ...GroupGroup.headers,
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

class GetGroupMembersCall {
  Future<ApiCallResponse> call({
    String? groupId = '',
    String? jwtToken = '',
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: ' GetGroupMembers',
      apiUrl: '${GroupGroup.baseUrl}/${groupId}/members',
      callType: ApiCallType.GET,
      headers: {
        ...GroupGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic members(dynamic response) => getJsonField(
        response,
        r'''$.members''',
        true,
      );
}

/// End Group Group Code

/// Start Calendar Group Code

class CalendarGroup {
  static String baseUrl = 'https://archimedes.jalex.io/calendar';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Host': 'archimedes.jalex.io',
    'Content-Type': 'application/json',
  };
  static GetGroupCalendarEventsCall getGroupCalendarEventsCall =
      GetGroupCalendarEventsCall();
}

class GetGroupCalendarEventsCall {
  Future<ApiCallResponse> call({
    String? groupId = '',
    String? jwtToken = '',
    String? startDate = '',
    bool? currentMonthOnly,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetGroupCalendarEvents',
      apiUrl: '${CalendarGroup.baseUrl}/group/${groupId}',
      callType: ApiCallType.GET,
      headers: {
        ...CalendarGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'StartDate': startDate,
        'CurrentMonthOnly': currentMonthOnly,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic events(dynamic response) => getJsonField(
        response,
        r'''$.events''',
        true,
      );
}

/// End Calendar Group Code

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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
