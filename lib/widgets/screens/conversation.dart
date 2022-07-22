import 'package:flutter/material.dart';
import '../default_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utilities/messages_notifier.dart';
import '../message_input.dart';

class Conversation extends StatefulWidget {
	const Conversation({ Key? key }) : super(key: key);

	@override
	State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
	String contactName = 'John Doe';
	String lastTimeOnline = '1 hour ago';
	String imagePath = 'assets/images/profile-placeholder.png';
	bool loadedMessages = false;

	@override
	Widget build(BuildContext context) {

		return ChangeNotifierProvider(
			create: (_) => MessagesNotifier(),
			builder: (BuildContext context, Widget? provider) {
				return Consumer<MessagesNotifier>(
					builder: (BuildContext context, MessagesNotifier notifier, Widget? provider) {
						FirebaseAuth auth = FirebaseAuth.instance;
						notifier.loadMessages(
							sender: auth.currentUser!.displayName ?? 'John Doe',
							receiver: contactName
						);

						return Scaffold(
							appBar: defaultAppBar(
								contactName,
								subtitle: lastTimeOnline,
								leading: Container(
									margin: const EdgeInsets.only(left: 16),
									child: Image.asset(imagePath, scale: 1.5)
								),
							),
							body: SizedBox(
								width: MediaQuery.of(context).size.width,
								child: Column(
									children: <Widget>[
										Expanded(
											child: ListView(
												children: notifier.messages
											)
										),

										MessageInput(contactName: 'John Doe'),
									]
								)
							)
						);
					},
				);
			}
		);
	}
}