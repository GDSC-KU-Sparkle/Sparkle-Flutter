import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sparkle/components/card.dart';
import 'package:sparkle/components/dialogHelpCard.dart';
import 'package:sparkle/components/dialogPromiseCard.dart';

class ErrandScreen extends StatefulWidget {
  const ErrandScreen({super.key});

  @override
  State<ErrandScreen> createState() => _ErrandScreenState();
}

class _ErrandScreenState extends State<ErrandScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    timerTest();

    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {
          currentLocation = newLoc;
        });
      },
    );
  }

  void timerTest() {
    Timer(Duration(milliseconds: 700), () {
      print("reassemble");
    });
  }

  // static const LatLng sourceLocation = LatLng(37.51148310935, 127.06033711446);
  static const LatLng destination = LatLng(37.510257428761, 127.04391561527);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? Center(child: Text("Loading"))
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 13.5,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId("currentLocation"),
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                    ),
                    const Marker(
                      markerId: MarkerId("destination"),
                      position: destination,
                    ),
                  },
                  onMapCreated: (mapController) {
                    _controller.complete(mapController);
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DialogPromiseCard(),
                              DialogHelpCard(),
                            ]),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CardBottom(
                              title: "목표",
                              iconFile: "assets/icons/goal_fire.png",
                              route: "goals",
                              clickable: false,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardBottom(
                              title: "심부름",
                              iconFile: "assets/icons/errand.png",
                              isActive: true,
                              isActiveText: "심부름 중",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardBottom(
                                title: "인벤토리",
                                iconFile: "assets/icons/inventory.png")
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
