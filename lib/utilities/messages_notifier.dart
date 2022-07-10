import 'package:flutter/material.dart';
import '../widgets/message.dart';

class MessagesNotifier extends ChangeNotifier {
	List<Message> _messages = [
		const Message(
			'ajsodhaodhsadasodaosdhsaojdh',
			sentBy: 'John Doe',
			time: '00:00'
		),
		const Message(
			'dbshadbvashdvhasdvhaskdvhsad',
			sentBy: 'You',
			time: '00:00'
		),
		const Message(
			'ajsodhaodhsadasodaosdhsaojdh',
			sentBy: 'John Doe',
			time: '00:00'
		),
		const Message(
			'dbshadbvashdvhasdvhaskdvhsad',
			sentBy: 'You',
			time: '00:00'
		),
		const Message(
			'ajsodhaodhsadasodaosdhsaojdh',
			sentBy: 'John Doe',
			time: '00:00'
		),
		const Message(
			'dbshadbvashdvhasdvhaskdvhsad',
			sentBy: 'You',
			time: '00:00'
		),
		const Message(
			'ajsodhaodhsadasodaosdhsaojdh',
			sentBy: 'John Doe',
			time: '00:00'
		),
		const Message(
			'dbshadbvashdvhasdvhaskdvhsad',
			sentBy: 'You',
			time: '00:00'
		),
		const Message(
			'ajsodhaodhsadasodaosdhsaojdh',
			sentBy: 'John Doe',
			time: '00:00'
		),
		const Message(
			'dbshadbvashdvhasdvhaskdvhsad',
			sentBy: 'You',
			time: '00:00'
		),
	];
	List<Message> get messages => _messages;
	
	set messages(List<Message> value) {
		_messages = value;
		notifyListeners();
	}

	void addMessage(Message message) {
		_messages.add(message);
		notifyListeners();
	}
}