import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparkle/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final IdController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement initState
    IdController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  setLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
  }

  printLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLogin') ?? false;
    print(isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: IdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                  hintText: 'Enter ID'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: PasswordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password'),
              obscureText: true,
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Color(PrimaryColor[70]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              if (IdController.text == "test" &&
                  PasswordController.text == "1234") {
                setLoginStatus();
                print("로그인 성공");
                printLoginStatus();
                context.go("/");
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("로그인 실패"),
                      content: Text("아이디와 비밀번호를 확인해주세요"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("확인"),
                        )
                      ],
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
