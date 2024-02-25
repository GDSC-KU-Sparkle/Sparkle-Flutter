import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

class CompleteScreenResult extends StatefulWidget {
  const CompleteScreenResult({super.key});

  @override
  State<CompleteScreenResult> createState() => _CompleteScreenResultState();
}

class _CompleteScreenResultState extends State<CompleteScreenResult> {
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
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/distance.png",
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "2.3",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Galmuri9"),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "km",
                                style: TextStyle(fontFamily: "Galmuri9"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("걸은 거리",
                              style: TextStyle(
                                fontFamily: "Galmuri9",
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(children: [
                      Image.asset(
                        "assets/icons/time.png",
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "54",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Galmuri9"),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "분",
                            style: TextStyle(fontFamily: "Galmuri9"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("걸은 시간",
                          style: TextStyle(
                            fontFamily: "Galmuri9",
                          )),
                    ])
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.go("/done/badge");
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
