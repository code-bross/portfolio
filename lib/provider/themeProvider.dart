import 'package:flutter/cupertino.dart';
import 'package:folio/provider/themePreference.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemePreference darkThemePref = ThemePreference();
  final ScrollController scrollController = ScrollController();

  // Getter returns the ScrollController to control the scroll position
  ScrollController get scrollControllerInstance => scrollController;

  // Setter to change the scroll position using an integer (the offset)
  set scrollPosition(int position) {
    scrollController.animateTo(
      position == 0 ? 100 : 0, // example of conditional scrolling
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  // App theme
  bool _lightTheme = false;
  bool get lightTheme => _lightTheme;

  set lightTheme(bool value) {
    _lightTheme = value;
    // setDarkTheme is asynchronous, so calling the async method
    _updateTheme(value);
    notifyListeners();
  }

  // Update the theme asynchronously
  Future<void> _updateTheme(bool value) async {
    await darkThemePref.setDarkTheme(value);
  }
}
