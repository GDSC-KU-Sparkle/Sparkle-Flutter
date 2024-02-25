import 'package:flutter/material.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffEBF9FF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: 3,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Text(
            "목표 달성!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Image.asset(
            "assets/images/example.png",
            height: 200,
            width: double.infinity,
          ),
        ]),
      )),
    );
  }
}
