import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome.dart';
import '../contact.dart';
import '../default_app_bar.dart';
import '../theme_switcher.dart';

class Home extends StatelessWidget {
	Home({Key? key}) : super(key: key);

	final List<Contact> contacts = [
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
		const Contact('Lorem', 'ipsum@gmail.com', '1 (123) 456-7890'),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: defaultAppBar('WhatSpark', automaticallyImplyLeading: false,
			 	actions: <Widget>[
					const ThemeSwitcher(),
					IconButton(
						icon: const Icon(Icons.logout),
						onPressed: () {
							FirebaseAuth auth = FirebaseAuth.instance;
							auth.signOut();
							Future.delayed(Duration.zero, () {
								Navigator.pushReplacement(
									context,
									MaterialPageRoute(builder: (context) => const Welcome())
								);	
							});
						},
					)
				]
			),
			body: Center(
				child: Column(
          			children: <Widget>[
              			Container(
							margin: const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 20.0),
							alignment: Alignment.topLeft,
							child: const Text(
								'CONTACTS',
								style: TextStyle(
									fontWeight: FontWeight.w700,
								),
							),
						),
						Expanded(
							child: ListView(
								children: contacts,
							)
						)
					],
        		),
			),
		);
	}
}
