import 'package:flutter/material.dart';
import '../utilities/gradients.dart';

AppBar defaultAppBar(String title, { String? subtitle, Widget? leading, List<Widget>? actions }) {
	return AppBar(
		title: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Text(title),
				if(subtitle != null)
					Text(
						subtitle,
						style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
					),
			]
		),
		flexibleSpace: Container(
			decoration: const BoxDecoration(
				gradient: defaultGradient
			)
		),
		leading: leading,
		actions: actions,
	);
}