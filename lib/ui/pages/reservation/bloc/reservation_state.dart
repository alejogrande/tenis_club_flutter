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
    Court court;
    
  ReservationInitialState(this.court);
  
}
class ReservationLoadingState extends ReservationState {}

class ReservationReadyState extends ReservationState {}

class ReservationSelectedDateState extends ReservationState {
  DateTime date;
  Court? court;
  List<Hour> listHours;
  
  
  ReservationSelectedDateState(this.court,this.date,this.listHours);
}

class ReservationSelectedHourState extends ReservationState {
  DateTime date;
  Court? court;
  List<Hour> listHours;
  String? icon;
  String? grade;
  ReservationSelectedHourState(this.court,this.date,this.listHours,this.icon,this.grade);
}


