import 'package:flutter/material.dart';
import '../default_app_bar.dart';
import '../../utilities/gradients.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'login.dart';
import 'home.dart';

class Welcome extends StatelessWidget {
	const Welcome({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		// FirebaseAuth auth = FirebaseAuth.instance;
		// if (auth.currentUser != null) {
		// 	Future.delayed(Duration.zero, () {
		// 		Navigator.pushReplacement(
		// 			context,
		// 			MaterialPageRoute(builder: (context) => Home())
		// 		);
		// 	});
		// }

		return Scaffold(
			appBar: defaultAppBar('Welcome to WhatSpark!'),
			body: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
				Container(
					margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
					child: const Text('Welcome!', style: TextStyle(fontSize: 48.0)),
				),
				Container(
					margin: const EdgeInsets.only(bottom: 60.0),
					child: const Image(image: AssetImage('assets/images/logo.png'), width: 387/3, height: 387/3)
				),
				Column(
					children: <Widget>[
					TextButton(
						child: createTextWithGradient(text: const Text('CREATE YOUR ACCOUNT NOW')),
						onPressed: () {
							Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const Signup()),
							);
						}
					),
					const Text('OR'),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
						const Text('Already have an account?'),
						TextButton(
							child: createTextWithGradient(text: const Text('LOG IN')),
							onPressed: () {
								Future.delayed(Duration.zero, () {
									Navigator.push(
										context,
										MaterialPageRoute(builder: (context) => const Login()),
									);
								});
							},
						),
						],
					)
					]
				),
				]
			),
		);
	}
}