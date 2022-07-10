import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utilities/theme_notifier.dart';
import 'widgets/screens/home.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	MyApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (_) => ThemeNotifier(),
			builder: (BuildContext context, Widget? provider) {
			 	return Consumer<ThemeNotifier>(
					builder: (BuildContext context, ThemeNotifier notifier, Widget? provider) {
						return MaterialApp(
							debugShowCheckedModeBanner: false,
							title: 'Flutter Demo',
							theme: notifier.themeMode == ThemeMode.system ?
									ThemeData.light() : ThemeData.dark(),
							home: Home(),
						);
					},
				);
			},
		);
	}
}

