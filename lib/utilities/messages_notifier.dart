import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../widgets/message.dart';

class MessagesNotifier extends ChangeNotifier {
	List<Message> _messages = [];
	List<Message> get messages => _messages;
	
	set messages(List<Message> value) {
		_messages = value;
		notifyListeners();
	}

	void loadMessages({ required String sender, required String receiver }) async {
		DatabaseReference ref = FirebaseDatabase.instance.ref('messages');
		DataSnapshot snapshot = await ref.get();

		messages = [];

		for (DataSnapshot child in snapshot.children) {
			if (
				child.child('sender').value == sender &&
				child.child('receiver').value == receiver
			) {
				addMessage(
					Message(
						child.child('content').value.toString(),
						sentBy: sender,
						time: DateTime(1970, 1, 1).toString()
					)
				);
			}
		}
	}

	void addMessage(Message message) {
		_messages.add(message);
		notifyListeners();
	}
}