import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_club/data/datasources/local_data_sources_implements.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/domain/respositories/booking_repository.dart';

part 'court_selection_event.dart';
part 'court_selection_state.dart';

class CourtSelectionBloc
    extends Bloc<CourtSelectionEvent, CourtSelectionState> {
  CourtSelectionBloc() : super(CourtSelectionInitialState()) {
    on<CourtSelectionEvent>((event, emit) async {
      if (event is CourtSelectionLoadingEvent) {
        emit(CourtSelectionLoadingState());

        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<Court> listCourts = await repository.getCourts();

        emit(CourtSelectionSucefullState(listCourts));
      } else if (event is CourtSelectionSelectedEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<Court> listCourts = await repository.getCourts();

        emit(CourtSelectionSelectedState(listCourts, event.courtSelected));
      }
    });
  }
}
