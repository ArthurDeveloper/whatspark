import 'package:flutter/material.dart';
import 'widgets/screens/home.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	MyApp({Key? key}) : super(key: key);

	String colorTheme = 'light';

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
				backgroundColor: colorTheme == 'light' ?Colors.white : Colors.black,
			),
			home: Home()
		);
	}
}

