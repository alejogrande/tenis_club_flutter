import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_club/data/datasources/local_data_sources_implements.dart';

import 'package:tenis_club/data/model/home_booking_model.dart';
import 'package:tenis_club/domain/respositories/booking_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeLoadingEvent) {
        emit(HomeLoadingState());

        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<HomeBooking> listBooking = await repository.getListHomeBooking();

        listBooking.sort((a, b) {
          int dateComparison = a.date!.compareTo(b.date!);
          if (dateComparison != 0) {
            return dateComparison;
          }
          return a.hour!.id.compareTo(b.hour!.id);
        });

        // Filtra los elementos que tienen tiempo anterior al actual
        DateTime now = DateTime.now();
        listBooking =
            listBooking.where((booking) => booking.date!.isAfter(now)).toList();

        emit(HomeSucefullState(listBooking));
      }
      if(event is DeleteBookingEvent){
         BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

             await repository.deleteBooking(id:event.id);
             add(HomeLoadingEvent());

      }

      // getListHomeBooking
    });
  }
}
