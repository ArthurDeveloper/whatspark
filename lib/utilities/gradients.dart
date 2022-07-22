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

Widget createTextWithGradient({ required Text text, LinearGradient? gradient }) {
	gradient ??= defaultGradient;
	return ShaderMask(
		blendMode: BlendMode.srcIn,
		shaderCallback: (bounds) => gradient!.createShader(
			Rect.fromLTWH(0, 0, bounds.width, bounds.height),
		),
		child: text,
    );
}
