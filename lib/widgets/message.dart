import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  	const Message(this.content, {Key? key, required this.sentBy, required this.time}) :
	super(key: key);

	final String content;
	final String sentBy;
	final String time;

  	@override
  	Widget build(BuildContext context) {
    	return Container(
			alignment: sentBy == 'You' ? Alignment.centerLeft : Alignment.centerRight,
			margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),

			child: Container(
				width: MediaQuery.of(context).size.width*0.70,
				padding: const EdgeInsets.all(7),

				decoration: BoxDecoration(
					border: Border(
						top: BorderSide(
							color: Colors.grey[300]!,
							width: 1,
						),
						bottom: BorderSide(
							color: Colors.grey[300]!,
							width: 1,
						),
						left: BorderSide(
							color: Colors.grey[300]!,
							width: 1,
						),
						right: BorderSide(
							color: Colors.grey[300]!,
							width: 1,
						),
					),
					borderRadius: BorderRadius.only(
						topLeft: const Radius.circular(10.0),
						topRight: const Radius.circular(10.0),
						bottomLeft: sentBy != 'You' ? const Radius.circular(10.0) : Radius.zero,
						bottomRight: sentBy == 'You' ? const Radius.circular(10.0) : Radius.zero
					),
				),

				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,

					children: <Widget>[
						Text(content, style: const TextStyle(fontSize: 16)),
						Container(
							alignment: Alignment.centerRight,
							child: Text(time, style: const TextStyle(fontSize: 10))
						),
					]
				)
			)
		);
  	}
}