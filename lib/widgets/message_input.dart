import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/messages_notifier.dart';
import '../widgets/message.dart';


class MessageInput extends StatefulWidget {
  	const MessageInput({Key? key}) : super(key: key);

  	@override
  	State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
	TextEditingController? content;
	BorderRadius borderRadius = BorderRadius.circular(40.0);

  	@override
  	Widget build(BuildContext context) {
		return Consumer<MessagesNotifier>(
			builder: (BuildContext context, MessagesNotifier notifier, Widget? provider) {
				return Focus(
					onFocusChange: (bool hasFocus) {
						setState(() {
							if (hasFocus) {
								borderRadius = BorderRadius.circular(10.0);
							} else {
								borderRadius = BorderRadius.circular(40.0);
							}
						});
					},
					child: AnimatedContainer(
						duration: const Duration(milliseconds: 350),
						curve: Curves.easeIn,
						margin: const EdgeInsets.symmetric(horizontal: 12.0),
						decoration: BoxDecoration(
							border: Border.all(color: Colors.grey, width: 1),
							borderRadius: borderRadius,
						),

						child: TextField(
							controller: content,
							decoration: const InputDecoration(
								contentPadding: EdgeInsets.only(left: 16),
								hintText: 'Type a message...',
								border: InputBorder.none
							),
							onSubmitted: (String text) {
								notifier.addMessage(
									Message(
										text,
										sentBy: 'You',
										time: '00:00'
									)
								);

								setState(() {
									content = TextEditingController();
									borderRadius = BorderRadius.circular(40.0);
								});
							},
						)
					)
				);
			}
		);
  	}
}