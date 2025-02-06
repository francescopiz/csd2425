/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/tour_bloc/tour_bloc.dart';
import 'package:frontend/services/services.dart';
import 'package:frontend/ui/widget/custom_bottombar.dart';
import 'bloc/ar_bloc/ar_bloc.dart';
import 'bloc/quiz_bloc/quiz_bloc.dart';

class Landsight extends StatelessWidget {
  const Landsight({super.key});

  @override
  Widget build(BuildContext context) {
    final services = Services.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ArBloc()),
        BlocProvider(create: (_) => TourBloc(services.tourService)),
        BlocProvider(create: (_) => QuizBloc()),
      ],
      child: MaterialApp(
        navigatorObservers: [services.routeObserver],
        navigatorKey: services.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: services.isFirstLaunch ? '/onBoardingPage' : '/home',
        theme: ThemeData(
          primaryColor: Colors.orange,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.orange,
            ),
            titleTextStyle: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            labelStyle: TextStyle(color: Colors.orange),
          ),
          /*floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),*/
          iconTheme: const IconThemeData(color: Colors.orange),
          cardTheme: CardTheme(
            color: Colors.orange.withOpacity(0.8),
            shadowColor: Colors.orange,
            elevation: 3,
          ),
        ),
        routes: {
          '/home': (context) => const CustomBottomBarWidget(),
          '/onBoardingPage': (context) => const CustomBottomBarWidget(),
        },
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/tour_bloc/tour_bloc.dart';
import 'package:frontend/services/services.dart';
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
  var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.orangeAccent);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    services = Services.of(context);
    initialRoute = services.isFirstLaunch? '/onBoardingPage' : '/home';
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
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
        ),
        /*ThemeData(
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
        ),*/
        routes: {
          '/home': (context) => const CustomBottomBarWidget(),
          '/onBoardingPage': (context) => const CustomBottomBarWidget(),
        },
      ),
    );
  }
}