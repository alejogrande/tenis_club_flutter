part of 'court_selection_bloc.dart';


abstract class CourtSelectionState {
  get listCourts => null;

  get court => null;
  
}

class CourtSelectionInitialState extends CourtSelectionState {}

class CourtSelectionLoadingState extends CourtSelectionState {}

// ignore: must_be_immutable
class CourtSelectionSucefullState extends CourtSelectionState {
    List<Court> listCourts;
  CourtSelectionSucefullState(this.listCourts);
}

class CourtSelectionErrorState extends CourtSelectionState {}

// ignore: must_be_immutable
class CourtSelectionSelectedState extends CourtSelectionState {
  Court court;
    List<Court> listCourts;
  CourtSelectionSelectedState(this.listCourts,this.court);
}
