import 'package:flutter/material.dart';
import '../default_app_bar.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

	final TextEditingController _name = TextEditingController();
	final TextEditingController _email = TextEditingController();
	final TextEditingController _password = TextEditingController();
	final TextEditingController _passwordConfirmation = TextEditingController();

	void submit(BuildContext context) async {
		final bool isValid = _formKey.currentState!.validate();
		if (isValid) {
			DatabaseReference ref = FirebaseDatabase.instance.ref('users');
			DataSnapshot snapshot = await ref.get();

			for (DataSnapshot child in snapshot.children) {
				if (child.child('email').value.toString() == _email.text) {
					SnackBar snackBar = const SnackBar(
						content: Text('Email already exists', style: TextStyle(color: Colors.white),),
						backgroundColor: Colors.red,
					);
					
					Future.delayed(Duration.zero, () {
						ScaffoldMessenger.of(context).showSnackBar(snackBar);
					});

					return;
				}
			}

			await ref.push().set({
				'name': _name.text,
				'email': _email.text,
				'password': _password.text
			});

			try {
				FirebaseAuth auth = FirebaseAuth.instance;
				await auth.createUserWithEmailAndPassword(
					email: _email.text,
					password: _password.text
				);
				
				auth.currentUser!.updateDisplayName(_name.text);

				Future.delayed(Duration.zero, () {
					Navigator.pushReplacement(
						context,
						MaterialPageRoute(builder: (context) => Home())
					);
				});
			} catch (e) {
				FirebaseAuthException error = e as FirebaseAuthException;
				print(error.message);

				if (error.code == 'email-already-in-use') {
					SnackBar snackBar = const SnackBar(
						content: Text('Email already exists', style: TextStyle(color: Colors.white),),
						backgroundColor: Colors.red,
					);
					
					Future.delayed(Duration.zero, () {
						ScaffoldMessenger.of(context).showSnackBar(snackBar);
					});
				} else {
					SnackBar snackBar = const SnackBar(
						content: Text('Something went wrong', style: TextStyle(color: Colors.white),),
						backgroundColor: Colors.red,
					);
					
					Future.delayed(Duration.zero, () {
						ScaffoldMessenger.of(context).showSnackBar(snackBar);
					});
				}
			}
		}
	}

	@override
	Widget build(BuildContext context) {
		FirebaseAuth auth = FirebaseAuth.instance;
		if (auth.currentUser != null) {
			Future.delayed(Duration.zero, () {
				Navigator.pushReplacement(
					context,
					MaterialPageRoute(
						builder: (context) => Home()
					)
				);
			});
		}

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
								controller: _name,
								keyboardType: TextInputType.emailAddress,
								decoration: const InputDecoration(
									hintText: 'User name',
								),
								validator: (String? value) {
									if (value == null || value.isEmpty) {
										return 'Please enter your user name';
									}

									if (value.length < 3) {
										return 'User name must be at least 3 characters long';
									}

									if (value.length > 20) {
										return 'User name must be at most 20 characters long';
									}

									return null;
								},
							),
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

									if (value.length < 6 || value.length > 32) {
										return 'The password must be between 6 and 32 characters long';
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
								onPressed: () async {
									submit(context);
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
