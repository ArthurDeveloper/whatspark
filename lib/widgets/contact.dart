import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact(this.name, this.email, this.phone, { Key? key }) : super(key: key);

  final String name;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
		decoration: const BoxDecoration(
			border: Border(
				bottom: BorderSide(
					color: Color.fromARGB(255, 200, 200, 200),
					width: 1.0
				)
			)
		),
		child: ListTile(
      		title: Text(name),
      		subtitle: Text(email),
      		trailing: Text(phone),
		)
	);
  }
}
