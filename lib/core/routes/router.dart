import 'package:eden_work_sample/app/presentation/screens/auth_screen.dart';
import 'package:eden_work_sample/app/presentation/screens/index_screen.dart';
import 'package:eden_work_sample/app/presentation/screens/order_detail_screen.dart';
import 'package:eden_work_sample/app/presentation/screens/orders_screen.dart';
import 'package:eden_work_sample/app/presentation/screens/profile_screen.dart';
import 'package:eden_work_sample/core/extensions/extentions.dart';
import 'package:eden_work_sample/core/routes/routes.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final ordersNavigatorKey = GlobalKey<NavigatorState>();
  final profileNavigatorKey = GlobalKey<NavigatorState>();

  Page<dynamic> pushPage(Widget screen) {
    if (Config.isAndroid) {
      return MaterialPage<void>(child: screen);
    }
    return CupertinoPage(child: screen);
  }

  GoRoute route({
    required String path,
    required Widget? screen,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    return GoRoute(
      path: path,
      name: path.routeName,
      pageBuilder: pageBuilder ?? (_, __) => pushPage(screen!),
      routes: routes,
    );
  }

  return GoRouter(
    initialLocation: Routes.auth,
    navigatorKey: rootNavigatorKey,
    routes: [
      route(path: Routes.auth, screen: const AuthScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return IndexScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: ordersNavigatorKey,
            routes: [
              route(
                path: Routes.orders,
                screen: const OrdersScreen(),
                routes: [
                  route(
                    path: Routes.orderDetail,
                    screen: null,
                    pageBuilder: (context, state) {
                      return pushPage(
                        OrderDetailScreen(id: state.pathParameters['id'] ?? ''),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileNavigatorKey,
            routes: [
              route(path: Routes.profile, screen: const ProfileScreen()),
            ],
          ),
        ],
      ),
    ],
  );
});
