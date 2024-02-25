import 'package:flutter/material.dart';

class CompleteScreenLayout extends StatelessWidget {
  final Widget child;
  const CompleteScreenLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background-image.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            child: child,
          ),
        ],
      ),
    );
  }
}
