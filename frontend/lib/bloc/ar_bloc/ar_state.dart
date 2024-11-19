part of 'ar_bloc.dart';

@immutable
sealed class ArState {}

final class ArInitial extends ArState {}

final class ArLoading extends ArState {
  final String platformVersion;

  ArLoading(this.platformVersion);

  List<Object> get props => [platformVersion];
}
