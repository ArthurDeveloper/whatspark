import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utilities/theme_notifier.dart';
import 'widgets/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'widgets/screens/login.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform,
	);

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
							title: 'WhatSpark',
							theme: notifier.themeMode == ThemeMode.system ?
									ThemeData.light() : ThemeData.dark(),
							darkTheme: ThemeData.dark(),
							home: const Login(),
						);
					},
				);
			},
		);
	}
}

