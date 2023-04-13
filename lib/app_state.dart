import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _viewedOnboarding =
        await secureStorage.getBool('ff_viewedOnboarding') ?? _viewedOnboarding;
    _subscriptions =
        await secureStorage.getStringList('ff_subscriptions') ?? _subscriptions;
    _automaticTheme =
        await secureStorage.getBool('ff_automaticTheme') ?? _automaticTheme;
    _isAnonymous =
        await secureStorage.getBool('ff_isAnonymous') ?? _isAnonymous;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _viewedOnboarding = false;
  bool get viewedOnboarding => _viewedOnboarding;
  set viewedOnboarding(bool _value) {
    _viewedOnboarding = _value;
    secureStorage.setBool('ff_viewedOnboarding', _value);
  }

  void deleteViewedOnboarding() {
    secureStorage.delete(key: 'ff_viewedOnboarding');
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String _value) {
    _currentPage = _value;
  }

  bool _newAccount = false;
  bool get newAccount => _newAccount;
  set newAccount(bool _value) {
    _newAccount = _value;
  }

  List<String> _subscriptions = ['easd'];
  List<String> get subscriptions => _subscriptions;
  set subscriptions(List<String> _value) {
    _subscriptions = _value;
    secureStorage.setStringList('ff_subscriptions', _value);
  }

  void deleteSubscriptions() {
    secureStorage.delete(key: 'ff_subscriptions');
  }

  void addToSubscriptions(String _value) {
    _subscriptions.add(_value);
    secureStorage.setStringList('ff_subscriptions', _subscriptions);
  }

  void removeFromSubscriptions(String _value) {
    _subscriptions.remove(_value);
    secureStorage.setStringList('ff_subscriptions', _subscriptions);
  }

  void removeAtIndexFromSubscriptions(int _index) {
    _subscriptions.removeAt(_index);
    secureStorage.setStringList('ff_subscriptions', _subscriptions);
  }

  bool _automaticTheme = true;
  bool get automaticTheme => _automaticTheme;
  set automaticTheme(bool _value) {
    _automaticTheme = _value;
    secureStorage.setBool('ff_automaticTheme', _value);
  }

  void deleteAutomaticTheme() {
    secureStorage.delete(key: 'ff_automaticTheme');
  }

  bool _isAnonymous = false;
  bool get isAnonymous => _isAnonymous;
  set isAnonymous(bool _value) {
    _isAnonymous = _value;
    secureStorage.setBool('ff_isAnonymous', _value);
  }

  void deleteIsAnonymous() {
    secureStorage.delete(key: 'ff_isAnonymous');
  }

  dynamic _editProfileTemp;
  dynamic get editProfileTemp => _editProfileTemp;
  set editProfileTemp(dynamic _value) {
    _editProfileTemp = _value;
  }

  String _selectedPostEntity = '';
  String get selectedPostEntity => _selectedPostEntity;
  set selectedPostEntity(String _value) {
    _selectedPostEntity = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
