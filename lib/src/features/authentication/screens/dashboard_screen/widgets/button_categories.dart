import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCategories extends StatelessWidget {
  const ButtonCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> buttonIcons = [
      {
        "icon": "assets/icons/Conversation.svg",
        "text": "Chat Screen",
        "press1": () {}
      },
      {
        "icon": "assets/icons/Parcel.svg",
        "text": "Add Sepcies",
        "press1": () {}
      },
      {
        "icon": "assets/icons/Cart Icon.svg",
        "text": "Explore Market",
        "press1": () {}
      },
      {"icon": "assets/icons/User.svg", "text": "Profile", "press1": () {}},
      {
        "icon": "assets/icons/Settings.svg",
        "text": "Settings",
        "press1": () {}
      },
      {
        "icon": "assets/icons/Question mark.svg",
        "text": "News Feed",
        "press1": () {}
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            buttonIcons.length,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ButtonCategoryCard(
                  icon: buttonIcons[index]['icon'],
                  text: buttonIcons[index]['text'],
                  press: buttonIcons[index]['press1'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCategoryCard extends StatelessWidget {
  const ButtonCategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFC3F9CA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: SvgPicture.asset(
                  icon,
                  // ignore: deprecated_member_use
                  color: Colors.red,
                  width: 30,
                  height: 30,
                )),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
