import 'package:flutter/material.dart';

class DashBoardSearch extends StatelessWidget {
  const DashBoardSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
            border: Border(
          // right: BorderSide(width: 5),
          left: BorderSide(width: 5),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "SEARCH...",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: Colors.grey),
            ),
            const Icon(
              Icons.mic,
              size: 20,
            ),
          ],
        ));
  }
}
