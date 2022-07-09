import 'package:flutter/material.dart';
import '../utilities/gradients.dart';

AppBar defaultAppBar(String title, { String? subtitle }) {
	return AppBar(
		title: Column(
			children: <Widget>[
				Text(title),
				if(subtitle != null)
					Container(
						margin: const EdgeInsets.only(right: 12),
						child: Text(
							subtitle, 
							style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
						)
					),
			]
		),
		flexibleSpace: Container(
			decoration: const BoxDecoration(
				gradient: defaultGradient
			)
		)
	);
}