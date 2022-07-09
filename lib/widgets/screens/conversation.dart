import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import '../default_app_bar.dart';

class Conversation extends StatefulWidget {
	const Conversation({ Key? key }) : super(key: key);

	@override
	State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
	String contactName = 'John Doe';
	String lastTimeOnline = '1 hour ago';

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: defaultAppBar(contactName, subtitle: lastTimeOnline),
			body: Column(
				children: const <Widget>[
					Center(
						child: Text('Conversation'),
					)
				],
			),
		);
	}
}