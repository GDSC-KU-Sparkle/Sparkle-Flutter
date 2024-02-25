import 'package:flutter/material.dart';
import 'package:sparkle/utils/colors.dart';

class DialogPromiseCard extends StatefulWidget {
  const DialogPromiseCard({super.key});

  @override
  State<DialogPromiseCard> createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogPromiseCard> {
  bool promiseBtnActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          promiseBtnActive = true;
        });
        showDialog(
          barrierColor: Colors.transparent,
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              content: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(PrimaryColor[120]!),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0.5,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/icons/promise_big.png",
                            width: 190,
                            height: 140,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              "약속해요!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text("1. 지름길로 가지 않기"),
                        Text(
                          "2. 공사장 근처는 지정된 통로로 가기",
                          softWrap: true,
                        ),
                        Text(
                          "3. 가게에서 계산 이후 카드 챙기기",
                          softWrap: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              promiseBtnActive = false;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 0.5,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                "확인",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: promiseBtnActive
              ? Color(PrimaryColor[60]!)
              : Color(PrimaryColor[80]!),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(PrimaryColor[40]!),
              spreadRadius: 1,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Image.asset("assets/icons/promise.png"),
      ),
    );
  }
}
