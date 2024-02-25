import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

class GoalDetailScreen extends StatelessWidget {
  final String id;
  const GoalDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height - 300,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: 3,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/example.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Text("목표명"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 80,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "자세한 설명 쏼라쏼라 쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라자세한 설명 쏼라쏼라 쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라자세한 설명 쏼라쏼라 쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라자세한 설명 쏼라쏼라 쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라자세한 설명 쏼라쏼라 쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라쏼라 ",
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("예상 시간 50분 - 60분"),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87,
                                        spreadRadius: 3,
                                        offset: Offset(
                                            1, 1), // changes position of shadow
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
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("심부름 시작"),
                                          content: Text("심부름을 시작하시겠습니까?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("취소")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  context.go("/errand");
                                                },
                                                child: Text("확인")),
                                          ],
                                        );
                                      });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87,
                                        spreadRadius: 3,
                                        offset: Offset(
                                            1, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "나중에",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  context.pop();
                                },
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
