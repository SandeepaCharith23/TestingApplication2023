import 'package:flutter/material.dart';

class OnBoardScreenWidget extends StatelessWidget {
  const OnBoardScreenWidget({
    Key? key,
    required this.imagepath,
    required this.imageSizeRatio,
    required this.mainText,
    required this.subText,
    required this.count,
    required this.color,
  }) : super(key: key);

  final String imagepath;
  final double imageSizeRatio;
  final String mainText, subText, count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagepath),
            height: size.height * imageSizeRatio,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                  mainText,
                  style: TextStyle(
                    fontStyle:
                        Theme.of(context).textTheme.headlineSmall?.fontStyle,
                    fontFamily: "Lobster",
                    fontSize: 30,
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle:
                        Theme.of(context).textTheme.titleLarge?.fontStyle,
                    fontFamily: "Aboreto",
                    fontSize: 12,
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            count,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: Theme.of(context).textTheme.titleLarge?.fontStyle,
              fontFamily: "Lobster",
              fontSize: 16,
              // color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
