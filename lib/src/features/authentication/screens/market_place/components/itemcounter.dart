import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int numberofItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
              onPressed: () {
                setState(() {
                  numberofItems++;
                });
              },
              child: const Icon(Icons.add)),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultpaddingSize / 2),
          child: Text(
            numberofItems.toString().padLeft(2, '0'),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
              onPressed: () {
                if (numberofItems > 1) {
                  setState(() {
                    numberofItems--;
                  });
                }
              },
              child: const Icon(Icons.remove)),
        ),
      ],
    );
  }
}
