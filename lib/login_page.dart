import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Ecommerse App-2023"),
        leading: const Icon(Icons.home),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              "Heading5",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Sub title1",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "BodyText1",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Click Here"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("See More Here"),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage("assets/images/appstore.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
