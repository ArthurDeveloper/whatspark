import 'dart:ui';

import 'package:flutter/material.dart';
import 'utilities/gradients.dart';

void main() {
  	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: const Home()
		);
	}
}

class Home extends StatelessWidget {
	const Home({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('WhatSpark'),
				flexibleSpace: Container(
					decoration: const BoxDecoration(
						gradient: defaultGradient
					)
				)
			),
			body: Center(
				child: Text('WhatSpark', style: TextStyle(
					foreground: Paint()..shader = createTextGradient(
						<Color>[const Color(0xffDA44bb), const Color(0xff8921aa)]
					)
				)),
			),
		);
	}
}