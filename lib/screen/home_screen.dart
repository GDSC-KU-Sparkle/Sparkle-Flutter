import 'package:flutter/material.dart';
import 'package:sparkle/components/card.dart';
import 'package:sparkle/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardBottom(title: "목표"),
                      SizedBox(
                        width: 20,
                      ),
                      CardBottom(title: "심부름"),
                      SizedBox(
                        width: 20,
                      ),
                      CardBottom(title: "인벤토리")
                    ]),
              ))
        ],
      )),
    );
  }
}
