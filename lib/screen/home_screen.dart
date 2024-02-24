import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparkle/components/card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sparkle/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.532600, 127.024612);

  @override
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
        body: Center(
          child: LoginScreen(),
        ),
      );
    }
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            buildingsEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('Seoul'),
                position: LatLng(37.532600, 127.024612),
              )
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardBottom(
                      title: "목표",
                      iconFile: "assets/icons/goal_fire.png",
                      route: "goals",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CardBottom(
                        title: "심부름", iconFile: "assets/icons/errand.png"),
                    SizedBox(
                      width: 20,
                    ),
                    CardBottom(
                        title: "인벤토리", iconFile: "assets/icons/inventory.png")
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
