import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/theme_notifier.dart';

class ThemeSwitcher extends StatelessWidget {
  	const ThemeSwitcher({Key? key}) : super(key: key);

  	@override
  	Widget build(BuildContext context) {
    	return Consumer<ThemeNotifier>(
			builder: (BuildContext context, ThemeNotifier notifier, Widget? provider) {
				return IconButton(
					icon: Icon(
						notifier.themeMode == ThemeMode.system ?
								Icons.brightness_3 : Icons.sunny,
						size: 30,
					),
					onPressed: () {
						notifier.themeMode = notifier.themeMode == ThemeMode.system ?
								ThemeMode.dark : ThemeMode.system;
					},
				);
			},
		);
  	}
}