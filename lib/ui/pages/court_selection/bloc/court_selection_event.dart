part of 'court_selection_bloc.dart';


abstract class CourtSelectionEvent {}


class CourtSelectionLoadingEvent extends CourtSelectionEvent{
//  final String aa;

//   CourtSelectionLoadingEvent(this.aa);

}

class CourtSelectionSelectedEvent extends CourtSelectionEvent{
     Court courtSelected;
    CourtSelectionSelectedEvent(this.courtSelected);

}
