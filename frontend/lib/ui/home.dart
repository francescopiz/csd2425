import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/ui/poi_details.dart';
import 'package:frontend/ui/widget/simple_card.dart';

import '../bloc/tour_bloc/tour_bloc.dart';
import '../services/tour_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  late TourBloc _tourBloc;

  @override
  void initState() {
    super.initState();
    _tourBloc = TourBloc(TourService());
    _tourBloc.add(LoadTours());
  }

  @override
  void dispose() {
    _tourBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Seleziona il tuo tour',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ))),
      ),
      body: BlocBuilder<TourBloc, TourState>(
        bloc: _tourBloc,
        builder: (context, state) {
          if (state is TourInitial) {
            return Center(child: const CircularProgressIndicator());
          } else if (state is TourError) {
            return Text('Error: ${state.message}');
          } else if (state is ToursLoaded) {
            if (state.tours.isEmpty) {
              return const Text('No tours available');
            } else {
              return ListView.builder(
                itemCount: state.tours.length,
                itemBuilder: (context, index) {
                  final tour = state.tours[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PoiDetails(
                                  title: tour.pois.first.name,
                                  description: tour.pois.first.description,
                                  audioDescription:
                                      tour.pois.first.audioDescription,
                                  mediafiles: tour.pois.first.mediafiles,
                                )),
                      );
                    },
                    child: SimpleCard(
                      title: tour.name,
                    ),
                  );
                },
              );
            }
          } else {
            return const Text('Unknown state');
          }
        },
      ),
    );
  }
}
