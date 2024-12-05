import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/Tour.dart';
import '../../services/tour_service.dart';

part 'tour_event.dart';

part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  final TourService tourService;

  TourBloc(this.tourService) : super(TourInitial()) {
    on<LoadTours>((event, emit) async {
      try {
        final tours = await TourService().getAllTours();
        emit(ToursLoaded(tours));
      } catch (e) {
        emit(TourError(e.toString()));
      }
    });
    on<ViewDetails>((event, emit) {
      emit(TourDetails(event.tours, event.currentTourIndex));
    });
  }
}
