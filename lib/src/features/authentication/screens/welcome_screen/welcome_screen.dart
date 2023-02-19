import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_path.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    var height = mediaquery.size.height;

    var brightness = mediaquery.platformBrightness;

    final isDarkModeActivated = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkModeActivated
          ? kBackgroundColorinDarkMode
          : kBackgroundColorinLightMode,
      body: Padding(
        padding: const EdgeInsets.all(kDefaultpaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(welcomeScreenImage1),
              height: height * 0.6,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  welcomeScreenText01,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  welcomeScreenText02,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      login.toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      signUp.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
