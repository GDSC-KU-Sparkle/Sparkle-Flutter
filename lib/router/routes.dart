import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkle/screen/complete_screen.dart';
import 'package:sparkle/screen/complete_screen_layout.dart';
import 'package:sparkle/screen/errand_screen.dart';
import 'package:sparkle/screen/goal_complete_screen.dart';
import 'package:sparkle/screen/goal_detail_screen.dart';
import 'package:sparkle/screen/goal_new_screen.dart';
import 'package:sparkle/screen/goal_screen.dart';
import 'package:sparkle/screen/home_screen.dart';
import 'package:sparkle/screen/login_screen.dart';
import 'package:sparkle/screen/mypage_screen.dart';

import 'package:sparkle/utils/colors.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            appBar: AppBar(
              title: SvgPicture.asset(
                "assets/images/sparkle_appbar_logo.svg",
                width: 120,
                height: 30,
              ),
            ),
            body: navigationShell,
            bottomNavigationBar: NavigationBar(
              indicatorColor: Color(PrimaryColor[80]!),
              selectedIndex: navigationShell.currentIndex,
              destinations: <Widget>[
                NavigationDestination(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    width: 20,
                    height: 20,
                  ),
                  label: '홈',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    "assets/icons/smiling_face.svg",
                    width: 20,
                    height: 20,
                  ),
                  label: '내 정보',
                ),
              ],
              onDestinationSelected: (index) {
                navigationShell.goBranch(index,
                    initialLocation: index == navigationShell.currentIndex);
              },
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/",
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    path: "goals",
                    builder: (context, state) => GoalScreen(
                      child: GoalNewScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: "complete",
                        builder: (context, state) => GoalCompleteScreen(),
                      ),
                      GoRoute(
                          path: ":id",
                          builder: (context, state) {
                            final id = state.pathParameters['id'];
                            return GoalScreen(
                              child: GoalDetailScreen(id: id ?? ""),
                            );
                          }),
                    ],
                  ),
                  GoRoute(
                    path: "errand",
                    builder: (context, state) => ErrandScreen(),
                  ),
                  GoRoute(
                    path: "done",
                    builder: (context, state) => CompleteScreenLayout(
                      child: CompleteScreen(),
                    ),
                  ),
                ],
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/mypage",
                builder: (context, state) => MyPageScreen(),
              )
            ],
          ),
        ])
  ],
);
