import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

class GoalDetailScreen extends StatelessWidget {
  final String id;
  const GoalDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        color: Colors.amber,
        child: Column(children: [
          Image.asset("assets/images/example.png"),
          Container(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("목표명"),
              Text("자세한 설명 쏼라쏼라"),
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
                              fontWeight: FontWeight.w600,
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
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () {
                          context.go("/goals/10000");
                        },
                      )
                    ],
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
