import 'package:flutter/material.dart';

class ForgetPasswordBanner extends StatelessWidget {
  const ForgetPasswordBanner({
    Key? key,
    required this.icon1,
    required this.forgetPasswordBanner1text01,
    required this.forgetPasswordBanner1text02,
    required this.pressedmethod,
  }) : super(key: key);

  final IconData icon1;
  final VoidCallback pressedmethod;
  final String forgetPasswordBanner1text01, forgetPasswordBanner1text02;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressedmethod,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon1,
              size: 60.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forgetPasswordBanner1text01,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    forgetPasswordBanner1text02,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
