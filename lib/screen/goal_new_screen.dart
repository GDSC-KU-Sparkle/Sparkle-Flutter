import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

class GoalNewScreen extends StatelessWidget {
  const GoalNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(PrimaryColor[70]!),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 1,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "새로운 목표",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  context.go("/goals");
                },
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 1,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "완료한 목표",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onTap: () {
                  context.go("/goals/complete");
                },
              ),
            ],
          ),
          Container(
            height: 5,
            margin: EdgeInsets.symmetric(vertical: 15),
            color: Color(
              PrimaryColor[50]!,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 3,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "케합 심부름",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("예상 시간 50분 - 60분"),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87,
                                spreadRadius: 3,
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Text(
                            "시작",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(PrimaryColor[70]!),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87,
                                spreadRadius: 3,
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Text(
                            "자세히",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
