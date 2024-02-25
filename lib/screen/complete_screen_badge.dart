import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

class CompleteScreenBadge extends StatefulWidget {
  const CompleteScreenBadge({super.key});

  @override
  State<CompleteScreenBadge> createState() => _CompleteScreenBadgeState();
}

class _CompleteScreenBadgeState extends State<CompleteScreenBadge> {
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
                "뱃지 획득!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/route_angel.png",
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text("길찾기 요정")),
                    Text("올바른 경로를 통한 미션 수행 3회 달성!"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                  context.go("/mypage");
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ])
          ],
        ),
      )),
    );
  }
}
