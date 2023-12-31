import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_club/data/datasources/local_data_sources_implements.dart';
import 'package:tenis_club/data/model/booking_model.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/data/model/hour_model.dart';
import 'package:tenis_club/data/model/weather_model.dart' as w;
import 'package:tenis_club/data/model/weather_model.dart';
import 'package:tenis_club/domain/respositories/booking_repository.dart';
import 'package:tenis_club/domain/respositories/http_repository.dart';
import 'package:tenis_club/utils/utils.dart';
import 'package:tenis_club/utils/validators/validators.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationEvent>((event, emit) async {
      if (event is ReservationInitialEvent) {
        emit(ReservationInitialState(event.court));
      } else if (event is ReservationLoadingEvent) {
        emit(ReservationLoadingState());
      } else if (event is ReservationSelectedDateEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<Hour> listHours = await repository.getHours();
        List<Booking> listBookings = await repository.getBooking();
        Court court = event.court!;
        DateTime date = event.date;

        List<Booking> matchingBookings = listBookings
            .where((booking) =>
                booking.idCourt == court.id && booking.date == date)
            .toList();

        bool hasExceededLimit = matchingBookings.length >= 3;

        for (var hour in listHours) {
          if (hasExceededLimit) {
            hour.visible = false;
          } else {
            bool isBooked =
                matchingBookings.any((booking) => booking.idHour == hour.id);
            hour.visible = !isBooked;
          }
        }

        emit(ReservationSelectedDateState(event.court, event.date, listHours));
      } else if (event is ReservationSelectedHourEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());
        List<Hour> listHours = await repository.getHours();

        List<Booking> listBookings = await repository.getBooking();
        Court court = event.court!;
        DateTime date = event.date;

        w.Weather? response = await HttpService.getWeather(
            Utils.formatDateTimeService(event.date));
        String hour = await repository.getHourbyId(event.idHour);

        List<Booking> matchingBookings = listBookings
            .where((booking) =>
                booking.idCourt == court.id && booking.date == date)
            .toList();

        bool hasExceededLimit = matchingBookings.length >= 3;

        for (var hour in listHours) {
          if (hasExceededLimit) {
            hour.visible = false;
          } else {
            bool isBooked =
                matchingBookings.any((booking) => booking.idHour == hour.id);
            hour.visible = !isBooked;
          }
        }
        ListElement? element =
            findWeatherByDateAndTimeRange(response!, event.date, hour);
        String? icon =
            "https://openweathermap.org/img/wn/${element?.weather?[0].icon}@2x.png";

        emit(ReservationSelectedHourState(event.court, event.date, listHours,
            icon, element!.main!.tempMax.toString()));
      } else if (event is CreateReservationEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        await repository.setBooking(event.booking);

        emit(ReservationReadyState());
      }
    });
  }
}
