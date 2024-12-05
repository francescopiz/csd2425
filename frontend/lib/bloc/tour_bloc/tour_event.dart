part of 'tour_bloc.dart';

@immutable
sealed class TourEvent {}

class LoadTours extends TourEvent {}

class ViewDetails extends TourEvent {
  final List<Tour> tours;
  final int currentTourIndex;

  ViewDetails(this.tours, this.currentTourIndex);
}
