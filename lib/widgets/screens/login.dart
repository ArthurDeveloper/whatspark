import 'package:flutter/material.dart';
import '../default_app_bar.dart';
import 'signup.dart';
import '../../utilities/gradients.dart';

class Login extends StatefulWidget {
    const Login({Key? key}) : super(key: key);

    @override
    State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	final TextEditingController _email = TextEditingController();
	final TextEditingController _password = TextEditingController();

	void submit() {
		final bool isValid = _formKey.currentState!.validate();
		if (isValid) {
			_formKey.currentState?.save();
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
							child: const Text('Login', style: TextStyle(fontSize: 32.0))
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
									if (value == null || value.isEmpty) {
										return 'Please enter your password';
									}
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
								const Text('Don\'t have an account?'),
								Container(
									margin: const EdgeInsets.only(left: 8.0),
									child: TextButton(
										onPressed: () {
											Navigator.push(
												context, 
												MaterialPageRoute(builder: (_) => const Signup())
											);
										}, 
										child: createTextWithGradient(
											text: const Text('SIGN UP')
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
