import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparkle/screen/login_screen.dart';
import 'package:sparkle/utils/colors.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  bool isLogin = false;
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLogin') ?? false;
    if (isLoggedIn) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLogin) {
      return Scaffold(
        appBar: AppBar(
          title: Text(isLogin.toString()),
        ),
        body: Center(
          child: LoginScreen(),
        ),
      );
    }
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -120,
          child: Image.asset(
            "assets/images/background-image-small.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Image.asset("assets/images/profile-test.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "김민재",
                style: TextStyle(fontSize: 30),
              ),
              Divider(content: "주간 활동"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("3"),
                      Text("달성한 목표"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("3"),
                      Text("주간 심부름"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("3"),
                      Text("걸은 거리 "),
                    ],
                  ),
                ],
              ),
              Divider(
                content: "업적 뱃지",
              ),

              // Expanded(

              //   child: GridView.builder(
              //     itemCount: 10,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 3,
              //         crossAxisSpacing: 10,
              //         mainAxisSpacing: 10),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         color: Colors.amber,
              //         alignment: Alignment.center,
              //         child: Text("$index"),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
          // child: Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Column(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(top: 60),
          //         child: Image.asset("assets/images/profile-test.png"),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //         "김민재",
          //         style: TextStyle(fontSize: 30),
          //       ),
          //       Divider(content: "주간 활동"),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Column(
          //             children: [
          //               Text("3"),
          //               Text("달성한 목표"),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Text("3"),
          //               Text("주간 심부름"),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Text("3"),
          //               Text("걸은 거리 "),
          //             ],
          //           ),
          //         ],
          //       ),
          //       Divider(
          //         content: "업적 뱃지",
          //       ),
          //       Expanded(
          //         child: GridView.builder(
          //           itemCount: 10,
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 3,
          //               crossAxisSpacing: 10,
          //               mainAxisSpacing: 10),
          //           itemBuilder: (context, index) {
          //             return Container(
          //               color: Colors.amber,
          //               alignment: Alignment.center,
          //               child: Text("$index"),
          //             );
          //           },
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ]),
    );
  }
}

class Divider extends StatelessWidget {
  final String content;
  const Divider({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: width * 0.3,
            height: 3,
            color: Color(PrimaryColor[80]!),
          ),
          Container(
              width: width * 0.2,
              alignment: Alignment.center,
              child: Text(
                content,
                style: TextStyle(
                  color: Color(PrimaryColor[70]!),
                ),
              )),
          Container(
            width: width * 0.3,
            height: 3,
            color: Color(PrimaryColor[80]!),
          )
        ],
      ),
    );
  }
}
