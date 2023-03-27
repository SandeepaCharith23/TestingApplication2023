import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.imageheightratio,
    required this.imagepath,
    required this.text1,
    required this.text2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.heightbetween,
    this.textAlign,
  }) : super(key: key);

  final double imageheightratio;
  final double? heightbetween;
  final String imagepath, text1, text2;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: size.height * imageheightratio,
          image: AssetImage(imagepath),
        ),
        SizedBox(
          height: heightbetween,
        ),
        Text(
          text1,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: textAlign,
        ),
        SizedBox(
          height: heightbetween,
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
