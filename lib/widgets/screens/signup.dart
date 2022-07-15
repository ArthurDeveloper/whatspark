import 'package:flutter/material.dart';
import '../default_app_bar.dart';
import 'login.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../utilities/gradients.dart';
import 'home.dart';

class Signup extends StatefulWidget {
    const Signup({Key? key}) : super(key: key);

    @override
    State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	final TextEditingController _email = TextEditingController();
	final TextEditingController _password = TextEditingController();
	final TextEditingController _passwordConfirmation = TextEditingController();

	void submit() async {
		final bool isValid = _formKey.currentState!.validate();
		if (isValid) {
			DatabaseReference ref = FirebaseDatabase.instance.ref('users/');
			await ref.push().set({
				'email': _email.text,
				'password': _password.text
			});

			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => Home())
			);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: defaultAppBar('Signup'),
			body: Form(
				key: _formKey,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Container(
							margin: const EdgeInsets.only(bottom: 48.0),
							child: const Text('Signup', style: TextStyle(fontSize: 32.0))
						),
						Container(
							padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
							child: TextFormField(
								controller: _email,
								keyboardType: TextInputType.emailAddress,
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
						Container(
							padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
							child: TextFormField(
								controller: _password,
								decoration: const InputDecoration(
									hintText: 'Password',	
								),
								obscureText: true,
								validator: (String? value) {
									if(value == null || value.isEmpty) return 'Enter a password';

									if (value.length < 4 || value.length > 32) {
										return 'The password must be between 4 and 32 characters long';
									}

									return null;
								},
							),
						),
						Container(
							padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
							child: TextFormField(
								controller: _passwordConfirmation,
								decoration: const InputDecoration(
									hintText: 'Confirm password',	
								),
								obscureText: true,
								validator: (String? value) {
									if (value == null || value.isEmpty) return 'Enter a password';
									if (value != _password.text) return 'Passwords do not match';
								
									return null;
								}
							),
						),
						Container(
							margin: const EdgeInsets.only(top: 20.0),
							child: TextButton(
								onPressed: () {
									submit();
								}, 
								child: createTextWithGradient(
									text: const Text('SUBMIT')
								),
							)
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								const Text('Already have an account?'),
								Container(
									margin: const EdgeInsets.only(left: 8.0),
									child: TextButton(
										onPressed: () {
											Navigator.push(
												context, 
												MaterialPageRoute(builder: (_) => const Login())
											);
										}, 
										child: createTextWithGradient(
											text: const Text('LOGIN')
										),
									)
								)
							]
						)
					]
				),
			)
		);
	}
}
