import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
	ThemeMode _themeMode = ThemeMode.system;
	ThemeMode get themeMode => _themeMode;
	
	set themeMode(ThemeMode value) {
		_themeMode = value;
		notifyListeners();
	}
}