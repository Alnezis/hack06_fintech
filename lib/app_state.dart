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
    _darkTheme = prefs.getBool('ff_darkTheme') ?? _darkTheme;
  }

  SharedPreferences prefs;

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool _value) {
    _darkTheme = _value;
    prefs.setBool('ff_darkTheme', _value);
  }

  bool productgroupselected = true;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
