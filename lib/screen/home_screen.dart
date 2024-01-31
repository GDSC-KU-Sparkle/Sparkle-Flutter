import 'package:flutter/material.dart';
import 'package:sparkle/components/card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.532600, 127.024612);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
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
                      CardBottom(title: "목표"),
                      SizedBox(
                        width: 20,
                      ),
                      CardBottom(title: "심부름"),
                      SizedBox(
                        width: 20,
                      ),
                      CardBottom(title: "인벤토리")
                    ]),
              ))
        ],
      )),
    );
  }
}
