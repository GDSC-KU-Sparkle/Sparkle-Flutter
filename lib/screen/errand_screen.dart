import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sparkle/components/card.dart';
import 'package:sparkle/components/dialogHelpCard.dart';
import 'package:sparkle/components/dialogPromiseCard.dart';
import 'package:sparkle/utils/colors.dart';

class ErrandScreen extends StatefulWidget {
  const ErrandScreen({super.key});

  @override
  State<ErrandScreen> createState() => _ErrandScreenState();
}

class _ErrandScreenState extends State<ErrandScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

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
      setState(() {});
    });
  }

  static const LatLng sourceLocation = LatLng(37.51148310935, 127.06033711446);
  static const LatLng destination = LatLng(37.510257428761, 127.04391561527);

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    timerTest();
    addCustomIcon();
    print("init state ");

    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/Location_marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return currentLocation == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Stack(
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
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue,
                      ),
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
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            // barrierColor: Colors.transparent,
                            barrierDismissible: false,
                            builder: (context) => Dialog(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "심부름을 완료했습니다!",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              "결과 보러 가볼까요?",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            context.go("/done");
                                          },
                                          child: Text("확인"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(PrimaryColor[100]!),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(PrimaryColor[20]!),
                              spreadRadius: 1,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Text("완료",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            )),
                      )),
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
