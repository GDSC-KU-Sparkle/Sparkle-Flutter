import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:sparkle/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogHelpCard extends StatefulWidget {
  const DialogHelpCard({super.key});

  @override
  State<DialogHelpCard> createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogHelpCard> {
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/icons/raise_hand_big.png",
                            width: 190,
                            height: 140,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              "도움이 필요해요!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          "도움을 요청하고 싶을 때",
                        ),
                        Text(
                          "심부름 내용이 헷갈릴 때",
                          softWrap: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            const number = "01012341234";
                            FlutterPhoneDirectCaller.callNumber(number);
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
                                "도움 요청",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                                color: Colors.grey,
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
                                "괜찮아요",
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
          color: promiseBtnActive ? Color(0xffE46962) : Color(0xffFCEEEE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: promiseBtnActive ? Color(0xffDC362E) : Color(0xffEC928E),
              spreadRadius: 1,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Image.asset("assets/icons/raise_hand.png"),
      ),
    );
  }
}
