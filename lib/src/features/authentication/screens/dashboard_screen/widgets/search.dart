import 'package:flutter/material.dart';

class DashBoardSearch extends StatelessWidget {
  DashBoardSearch({
    Key? key,
  }) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: const BoxDecoration(
            border: Border(
          //right: BorderSide(width: 5),
          left: BorderSide(width: 5),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   "SEARCH...",
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleLarge
            //       ?.apply(color: Colors.grey),
            // ),
            Flexible(
              fit: FlexFit.loose,
              child: TextField(
                controller: _textEditingController,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Colors.grey),
                decoration: const InputDecoration(
                  hintText: "Search",
                ),
                autofillHints: const ['Search'],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    searchmethod();
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.mic,
              size: 20,
            ),
          ],
        ));
  }

  void searchmethod() {}
}
