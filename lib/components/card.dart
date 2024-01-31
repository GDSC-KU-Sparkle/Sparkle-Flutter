import 'package:flutter/material.dart';
import 'package:sparkle/utils/colors.dart';

class CardBottom extends StatelessWidget {
  final String title;
  const CardBottom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(PrimaryColor[60]!), width: 0.2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(PrimaryColor[60]!),
                spreadRadius: 1,

                offset: Offset(3, 3), // changes position of shadow
              ),
            ]),
        child: Text(title),
      ),
    );
  }
}
