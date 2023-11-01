part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
class HomeSucefullState extends HomeState {
  List<HomeBooking> listBooking;
  HomeSucefullState(this.listBooking);
}

class HomeSucefullDeleteState extends HomeState {
  HomeSucefullDeleteState();
}

class HomeErrorState extends HomeState {}

// ignore: must_be_immutable

