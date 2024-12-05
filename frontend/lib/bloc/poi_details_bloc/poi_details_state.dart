part of 'poi_details_bloc.dart';

@immutable
sealed class PoiDetailsState {}

final class PoiDetailsInitial extends PoiDetailsState {}

final class PoiDetailsLoading extends PoiDetailsState {}

final class PoiDetailsLoaded extends PoiDetailsState {
  final List<Mediafile> mediafiles;
  final int currentPage;

  PoiDetailsLoaded(this.mediafiles, this.currentPage);
}

final class PoiDetailsError extends PoiDetailsState {
  final String message;

  PoiDetailsError(this.message);
}

final class PoiDetailsEmpty extends PoiDetailsState {}
