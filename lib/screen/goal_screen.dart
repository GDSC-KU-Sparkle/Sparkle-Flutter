import 'package:flutter/material.dart';
import 'package:sparkle/components/card.dart';

class GoalScreen extends StatelessWidget {
  final Widget child;
  const GoalScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background-image.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            child: child,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardBottom(
                      title: "목표 선택",
                      iconFile: "assets/icons/goal_fire.png",
                      isActive: true,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CardBottom(
                        title: "심부름", iconFile: "assets/icons/errand.png"),
                    SizedBox(
                      width: 20,
                    ),
                    CardBottom(
                        title: "인벤토리", iconFile: "assets/icons/inventory.png")
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
