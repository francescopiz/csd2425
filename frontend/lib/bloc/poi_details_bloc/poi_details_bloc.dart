import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/Mediafile.dart';

part 'poi_details_event.dart';

part 'poi_details_state.dart';

class PoiDetailsBloc extends Bloc<PoiDetailsEvent, PoiDetailsState> {
  PoiDetailsBloc() : super(PoiDetailsInitial()) {
    /*on<NextPageEvent>((event, emit) {
      if (state.currentPage < 4) {
        // Replace 4 with the actual length of mediafiles
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    });
    on<PreviousPageEvent>((event, emit) {
      if (state.currentPage > 0) {
        emit(state.copyWith(currentPage: state.currentPage - 1));
      }
    });*/
  }
}
