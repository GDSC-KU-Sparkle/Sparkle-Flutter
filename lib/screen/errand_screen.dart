import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sparkle/components/card.dart';
import 'package:sparkle/utils/colors.dart';

class ErrandScreen extends StatefulWidget {
  const ErrandScreen({super.key});

  @override
  State<ErrandScreen> createState() => _ErrandScreenState();
}

class _ErrandScreenState extends State<ErrandScreen> {
  bool promiseBtnActive = false;
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
                        child: Row(children: [
                          GestureDetector(
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                "assets/icons/promise_big.png",
                                                width: 190,
                                                height: 140,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: Center(
                                                  child: Text(
                                                    "약속해요!",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    promiseBtnActive = false;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                          fontWeight:
                                                              FontWeight.w700,
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
                          ),
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
