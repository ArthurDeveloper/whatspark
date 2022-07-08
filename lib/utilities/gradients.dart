import 'package:flutter/cupertino.dart';

const LinearGradient defaultGradient = LinearGradient(
	colors: <Color>[
		Color.fromARGB(255, 229, 0, 237),
		Color.fromARGB(255, 104, 14, 230)
	],
	stops: [
		0.2,
		1
	]
);

Shader createTextGradient({ List<Color>? colors }) {
	return LinearGradient(
  		colors: colors ?? defaultGradient.colors,
	).createShader(const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));
}
