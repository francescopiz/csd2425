import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/tour_bloc/tour_bloc.dart';
import 'package:frontend/services/services.dart';
import 'package:frontend/ui/ar_screen.dart';
import 'package:frontend/ui/ar_test.dart';
import 'package:frontend/ui/widget/custom_bottombar.dart';

import 'bloc/ar_bloc/ar_bloc.dart';
import 'bloc/quiz_bloc/quiz_bloc.dart';

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
        BlocProvider(create: (context) => TourBloc(services.tourService)),
        BlocProvider(create: (context) => QuizBloc()),
      ],
      child: MaterialApp(
        navigatorObservers: [services.routeObserver],
        navigatorKey: services.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.orange),
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.orange,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        routes: {
          '/home': (context) => const CustomBottomBarWidget(),
          //'/onBoardingPage': (context) => const OnboardingPage(),
        },
      ),
    );
  }
}
