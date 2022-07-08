import 'package:flutter/material.dart';
import '../../utilities/gradients.dart';
import '../contact.dart';

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
			appBar: AppBar(
				title: const Text('WhatSpark'),
				flexibleSpace: Container(
					decoration: const BoxDecoration(
						gradient: defaultGradient
					)
				)
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