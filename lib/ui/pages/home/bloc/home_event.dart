part of 'home_bloc.dart';


sealed class HomeEvent {}

class HomeLoadingEvent extends HomeEvent{
//  final String aa;

//   CourtSelectionLoadingEvent(this.aa);

}

class DeleteBookingEvent extends HomeEvent{
     int id;
    DeleteBookingEvent(this.id);

}