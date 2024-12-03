import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ar_event.dart';
part 'ar_state.dart';

class ArBloc extends Bloc<ArEvent, ArState> {
  ArBloc() : super(ArInitial()) {
    on<ArEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
