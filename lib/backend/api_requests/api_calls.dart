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
  };
  static GetUsersCall getUsersCall = GetUsersCall();
  static GetUserCall getUserCall = GetUserCall();
  static GetUserProfileCall getUserProfileCall = GetUserProfileCall();
  static GetUserProfileDetailedCall getUserProfileDetailedCall =
      GetUserProfileDetailedCall();
  static ChangeUsernameCall changeUsernameCall = ChangeUsernameCall();
  static NotifySyncCall notifySyncCall = NotifySyncCall();
  static ChangeDisplayNameCall changeDisplayNameCall = ChangeDisplayNameCall();
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
