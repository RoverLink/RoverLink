import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _viewedOnboarding =
        prefs.getBool('ff_viewedOnboarding') ?? _viewedOnboarding;
  }

  late SharedPreferences prefs;

  DateTime? selectedDate = DateTime.fromMillisecondsSinceEpoch(946702800000);

  bool _viewedOnboarding = false;
  bool get viewedOnboarding => _viewedOnboarding;
  set viewedOnboarding(bool _value) {
    _viewedOnboarding = _value;
    prefs.setBool('ff_viewedOnboarding', _value);
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
