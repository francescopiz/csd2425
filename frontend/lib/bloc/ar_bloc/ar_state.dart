part of 'ar_bloc.dart';

@immutable
sealed class ArState {}

final class ArInitial extends ArState {
  ArCoreController? augmentedRealityCoreController;
}

final class ArSphere extends ArState {
  final ArCoreController controller;
  ArSphere(this.controller);
}
