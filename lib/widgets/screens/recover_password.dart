import 'package:flutter/material.dart';
import '../../utilities/gradients.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../default_app_bar.dart';

class RecoverPassword extends StatefulWidget {
	const RecoverPassword({Key? key}) : super(key: key);

	@override
	State<StatefulWidget> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
	final GlobalKey<FormState> _formKey =  GlobalKey<FormState>(); 
	final TextEditingController _email = TextEditingController();

	bool sent = false;

	void submit(BuildContext context) {
		final bool isValid = _formKey.currentState!.validate();
		if (isValid) {
			_formKey.currentState?.save();
			FirebaseAuth auth = FirebaseAuth.instance;
			auth.sendPasswordResetEmail(email: _email.text);

			ScaffoldMessenger.of(context).showSnackBar(
				const SnackBar(
					content: Text('Email sent (If you don\'t see it, check the spam box)'),
				)
			);

			setState(() => sent = true);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: defaultAppBar('Recover Password'),
			body: Form(
				key: _formKey,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						const Text('Recover your password', style: TextStyle(fontSize: 32)),
						Container(
							margin: const EdgeInsets.only(top: 48.0),
							padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 40.0),
							child: TextFormField(
								controller: _email,
								decoration: const InputDecoration(
									hintText: 'Email',
								),
								validator: (String? value) {
									if (value == null || value.isEmpty) {
										return 'Please enter your email';
									}

									final RegExp emailRegex = RegExp('[a-zA-Z0-9.!#\$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\$');
									if (emailRegex.matchAsPrefix(value.trim()) == null) {
										return 'Please enter a valid email';
									}

									return null;
								},
							),
						),
						TextButton(
							child: createTextWithGradient(
								text: Text(sent ?  'Resend Email' : 'Recover Password')
							),
							onPressed: () {
								submit(context);
							},
						)
					]
				)
			)
		);
	}
}