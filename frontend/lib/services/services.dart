import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ServicesProvider extends InheritedWidget {
  final Services services;

  const ServicesProvider(
      {super.key, required this.services, required super.child});

  @override
  bool updateShouldNotify(covariant ServicesProvider oldWidget) {
    return services != oldWidget.services;
  }
}

class Services {
  final RouteObserver<PageRoute> routeObserver;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isFirstLaunch;

  Services(this.routeObserver, this.navigatorKey, this.isFirstLaunch);

  static Services of(BuildContext context) {
    final ServicesProvider? provider =
    context.dependOnInheritedWidgetOfExactType<ServicesProvider>();
    if (provider == null) {
      throw Exception('No ServicesProvider found in context');
    }
    return provider.services;
  }

  static Future<Services> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    var routeObserver = RouteObserver<PageRoute>();

    var navigatorKey = GlobalKey<NavigatorState>();

    //controllo se sia la prima volta che l'app viene avviata
    /*final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool("first_1.0.0") ?? true;

    return Services(routeObserver, navigatorKey, isFirstLaunch);*/
    return Services(routeObserver, navigatorKey, false);

  }
}