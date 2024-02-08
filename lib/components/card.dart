import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparkle/utils/colors.dart';

class CardBottom extends StatelessWidget {
  final String title;
  final String iconFile;
  const CardBottom({super.key, required this.title, required this.iconFile});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontFamily: "Galmuri11"),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                iconFile,
                width: 40,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
