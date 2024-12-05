part of 'poi_details_bloc.dart';

@immutable
sealed class PoiDetailsEvent {}

final class NextPageEvent extends PoiDetailsEvent {
  final int currentPage;

  NextPageEvent(this.currentPage);
}

final class PreviousPageEvent extends PoiDetailsEvent {
  final int currentPage;

  PreviousPageEvent(this.currentPage);
}