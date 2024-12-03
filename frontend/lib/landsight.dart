import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/services/services.dart';
import 'package:frontend/ui/home.dart';

import 'bloc/ar_bloc/ar_bloc.dart';


class Landsight extends StatefulWidget {
  const Landsight({super.key});

  @override
  State<Landsight> createState() => _LandsightState();
}

class _LandsightState extends State<Landsight> {
  late Services services;
  late String initialRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    services = Services.of(context);
    initialRoute = '/home';
    //initialRoute = services.isFirstLaunch? '/onBoardingPage' : '/home';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArBloc()),
      ],
      child: MaterialApp(
        navigatorObservers: [services.routeObserver],
        navigatorKey: services.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        theme: ThemeData(
          //colore sfondo
          scaffoldBackgroundColor: Colors.white70,
          //colore principale
          primaryColor: Colors.blueGrey,
          //colore secondario
          secondaryHeaderColor: Colors.black12,
          //fontFamily: 'SofiaSansExtraCondensed',
        ),
        routes: {
          '/home': (context) => const Home(),
          //'/onBoardingPage': (context) => const OnboardingPage(),
          //'/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}