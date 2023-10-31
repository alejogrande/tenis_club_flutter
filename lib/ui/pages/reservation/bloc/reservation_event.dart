part of 'reservation_bloc.dart';


abstract class ReservationEvent {}

class ReservationLoadingEvent extends ReservationEvent {
//  final String aa;

//   CourtSelectionLoadingEvent(this.aa);

}

// ignore: must_be_immutable
class ReservationInitialEvent extends ReservationEvent {
  Court court;
  ReservationInitialEvent(this.court);
}

// ignore: must_be_immutable
class ReservationSelectedDateEvent extends ReservationEvent {
  Court? court;
  DateTime date;
  ReservationSelectedDateEvent(this.court, this.date);
}

class CreateReservationEvent extends ReservationEvent{
  Booking booking;
  CreateReservationEvent(this.booking);


}
