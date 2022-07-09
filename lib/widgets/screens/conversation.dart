import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import '../default_app_bar.dart';
import '../message.dart';

class Conversation extends StatefulWidget {
	const Conversation({ Key? key }) : super(key: key);

	@override
	State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
	String contactName = 'John Doe';
	String lastTimeOnline = '1 hour ago';
	AssetImage image = const AssetImage('assets/images/profile-placeholder.png');

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: defaultAppBar(
				contactName,
				subtitle: lastTimeOnline,
				leading: Image(image: image)
			),
			body: Container(
				width: MediaQuery.of(context).size.width,
				child: ListView(
					children: const <Widget>[
						Message(
							'ajsodhaodhsadasodaosdhsaojdh',
							sentBy: 'John Doe',
							time: '00:00'
						),
						Message(
							'dbshadbvashdvhasdvhaskdvhsad',
							sentBy: 'You',
							time: '00:00'
						),
						Message(
							'ajsodhaodhsadasodaosdhsaojdh',
							sentBy: 'John Doe',
							time: '00:00'
						),
						Message(
							'dbshadbvashdvhasdvhaskdvhsad',
							sentBy: 'You',
							time: '00:00'
						),
						Message(
							'ajsodhaodhsadasodaosdhsaojdh',
							sentBy: 'John Doe',
							time: '00:00'
						),
						Message(
							'dbshadbvashdvhasdvhaskdvhsad',
							sentBy: 'You',
							time: '00:00'
						),
						Message(
							'ajsodhaodhsadasodaosdhsaojdh',
							sentBy: 'John Doe',
							time: '00:00'
						),
						Message(
							'dbshadbvashdvhasdvhaskdvhsad',
							sentBy: 'You',
							time: '00:00'
						),
						Message(
							'ajsodhaodhsadasodaosdhsaojdh',
							sentBy: 'John Doe',
							time: '00:00'
						),
						Message(
							'dbshadbvashdvhasdvhaskdvhsad',
							sentBy: 'You',
							time: '00:00'
						),
					],
				)
			),
		);
	}
}