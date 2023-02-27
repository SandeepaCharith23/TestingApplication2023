import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.height,
    required this.imagepath,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final double height;
  final String imagepath, text1, text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: height * 0.3,
          image: AssetImage(imagepath),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text1,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
