import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MenuListTile extends StatelessWidget {
  final String textMain;
  final IconData leadingIcon;
  final VoidCallback trailingIconOnPressed, listTileonpress;
  final Color? textColor;
  final bool endIcon;

  const MenuListTile({
    Key? key,
    required this.textMain,
    required this.leadingIcon,
    required this.trailingIconOnPressed,
    this.textColor,
    required this.listTileonpress,
    required this.endIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? kprimaryColourInDark : kprimaryColour1;
    return ListTile(
      onTap: listTileonpress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: kprimaryColour1.withOpacity(0.1),
        ),
        child: Icon(
          leadingIcon,
          color: iconColor,
        ),
      ),
      title: Text(
        textMain,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? IconButton(
              onPressed: trailingIconOnPressed,
              icon: const Icon(
                LineAwesomeIcons.arrow_circle_right,
              ),
              color: iconColor,
            )
          : null,
    );
  }
}
