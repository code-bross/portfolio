import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const THEME_STATUS = "THEMESTATUS";
  static const FONT_SIZE = "FONTSIZE";

  // Dark Theme 상태 설정
  Future<void> setDarkTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_STATUS, value);
  }

  // Dark Theme 상태 가져오기
  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // `?? false`는 만약 값이 없으면 `false`로 설정
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  // Font size 설정 (추가적으로 구현할 수 있음)
  Future<void> setFontSize(double size) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(FONT_SIZE, size);
  }

  // Font size 가져오기
  Future<double> getFontSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // `?? 14.0`는 기본값을 `14.0`으로 설정
    return prefs.getDouble(FONT_SIZE) ?? 14.0;
  }
}
