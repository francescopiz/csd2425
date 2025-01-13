part of 'ar_bloc.dart';

@immutable
sealed class ArEvent {}

final class ArInitialEvent extends ArEvent {}

final class ArSphereEvent extends ArEvent {
  final ArCoreController controller;
  ArSphereEvent(this.controller);
}