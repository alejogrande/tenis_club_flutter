part of 'reservation_bloc.dart';


abstract class ReservationState {
  // Court _court;
  // get court => null;

  get date =>  DateTime.now();

  Court? get court => null;

  get listHours => null;

  get grade => null;

  String? get icon => null;

  
}

class ReservationInitial extends ReservationState {

}
class ReservationInitialState extends ReservationState {
    @override
  Court court;
    
  ReservationInitialState(this.court);
  
}
class ReservationLoadingState extends ReservationState {}

class ReservationReadyState extends ReservationState {}

class ReservationSelectedDateState extends ReservationState {
  @override
  DateTime date;
  @override
  Court? court;
  @override
  List<Hour> listHours;
  
  
  ReservationSelectedDateState(this.court,this.date,this.listHours);
}

class ReservationSelectedHourState extends ReservationState {
  @override
  DateTime date;
  @override
  Court? court;
  @override
  List<Hour> listHours;
  @override
  String? icon;
  @override
  String? grade;
  ReservationSelectedHourState(this.court,this.date,this.listHours,this.icon,this.grade);
}


