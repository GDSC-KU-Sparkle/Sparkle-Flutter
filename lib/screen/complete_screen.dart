import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

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
        child: Wrap(
          children: [
            Column(children: [
              Text(
                "목표 달성!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/example.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "케찹 심부름",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.go("/done/result");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 1,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                      color: Color(PrimaryColor[100]!),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("다음"),
                ),
              )
            ])
          ],
        ),
      )),
    );
  }
}
