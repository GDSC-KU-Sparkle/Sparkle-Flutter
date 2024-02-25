import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/utils/colors.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.go("/errand");
            },
            child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(PrimaryColor[120]!),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 3,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/inventory.png"),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "인벤토리",
                        style: TextStyle(fontSize: 20),
                      )),
                  Text("목표 달성에 필요한 재료들이에요."),
                  Text("깜빡하고 잊지 않았는지 확인해주세요."),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 1.5,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/coin.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("케찹값 2,500원"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
