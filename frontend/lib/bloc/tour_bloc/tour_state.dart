part of 'tour_bloc.dart';

@immutable
sealed class TourState {}

final class TourInitial extends TourState {}

final class ToursLoaded extends TourState {
  final List<Tour> tours;

  ToursLoaded(this.tours);
}

final class TourDetails extends TourState {
  final List<Tour> tours;
  final int currentTourIndex;

  TourDetails(this.tours, this.currentTourIndex);
}

final class TourError extends TourState {
  final String message;

  TourError(this.message);
}
