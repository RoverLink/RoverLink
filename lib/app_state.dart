import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';

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
    _username = await secureStorage.getString('ff_username') ?? _username;
  }

  late FlutterSecureStorage secureStorage;

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(946702800000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _selectedDate = _value;
  }

  void deleteSelectedDate() {
    notifyListeners();
    secureStorage.delete(key: 'ff_selectedDate');
  }

  bool _viewedOnboarding = false;
  bool get viewedOnboarding => _viewedOnboarding;
  set viewedOnboarding(bool _value) {
    notifyListeners();

    _viewedOnboarding = _value;
    secureStorage.setBool('ff_viewedOnboarding', _value);
  }

  void deleteViewedOnboarding() {
    notifyListeners();
    secureStorage.delete(key: 'ff_viewedOnboarding');
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String _value) {
    notifyListeners();

    _currentPage = _value;
  }

  void deleteCurrentPage() {
    notifyListeners();
    secureStorage.delete(key: 'ff_currentPage');
  }

  bool _newAccount = false;
  bool get newAccount => _newAccount;
  set newAccount(bool _value) {
    notifyListeners();

    _newAccount = _value;
  }

  void deleteNewAccount() {
    notifyListeners();
    secureStorage.delete(key: 'ff_newAccount');
  }

  List<String> _subscriptions = ['easd'];
  List<String> get subscriptions => _subscriptions;
  set subscriptions(List<String> _value) {
    notifyListeners();

    _subscriptions = _value;
    secureStorage.setStringList('ff_subscriptions', _value);
  }

  void deleteSubscriptions() {
    notifyListeners();
    secureStorage.delete(key: 'ff_subscriptions');
  }

  void addToSubscriptions(String _value) {
    notifyListeners();
    _subscriptions.add(_value);
    secureStorage.setStringList('ff_subscriptions', _subscriptions);
  }

  void removeFromSubscriptions(String _value) {
    notifyListeners();
    _subscriptions.remove(_value);
    secureStorage.setStringList('ff_subscriptions', _subscriptions);
  }

  bool _automaticTheme = true;
  bool get automaticTheme => _automaticTheme;
  set automaticTheme(bool _value) {
    notifyListeners();

    _automaticTheme = _value;
    secureStorage.setBool('ff_automaticTheme', _value);
  }

  void deleteAutomaticTheme() {
    notifyListeners();
    secureStorage.delete(key: 'ff_automaticTheme');
  }

  bool _isAnonymous = false;
  bool get isAnonymous => _isAnonymous;
  set isAnonymous(bool _value) {
    notifyListeners();

    _isAnonymous = _value;
    secureStorage.setBool('ff_isAnonymous', _value);
  }

  void deleteIsAnonymous() {
    notifyListeners();
    secureStorage.delete(key: 'ff_isAnonymous');
  }

  String _profilePicture = '';
  String get profilePicture => _profilePicture;
  set profilePicture(String _value) {
    notifyListeners();

    _profilePicture = _value;
  }

  void deleteProfilePicture() {
    notifyListeners();
    secureStorage.delete(key: 'ff_profilePicture');
  }

  String _username = '';
  String get username => _username;
  set username(String _value) {
    notifyListeners();

    _username = _value;
    secureStorage.setString('ff_username', _value);
  }

  void deleteUsername() {
    notifyListeners();
    secureStorage.delete(key: 'ff_username');
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
