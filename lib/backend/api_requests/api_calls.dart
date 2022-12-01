import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SocialPostsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'SocialPosts',
      apiUrl: 'https://alert.eastonsd.org/api/social',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
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
        'stags': "easd",
      },
      returnBody: true,
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
      cache: false,
    );
  }

  static dynamic navigationItems(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
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
