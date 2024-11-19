import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';

part 'ar_event.dart';
part 'ar_state.dart';

class ArBloc extends Bloc<ArEvent, ArState> {
  ArBloc() : super(ArInitial()) {
    String platformVersion;
    on<ArEvent>((event, emit) async {
      try {
        platformVersion = await ArFlutterPlugin.platformVersion;
      } on PlatformException {
        platformVersion = 'Failed to get platform version.';
      }
      emit(ArLoading(platformVersion));
    });
  }
}
