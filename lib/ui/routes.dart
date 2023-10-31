
import 'package:flutter/material.dart';
import 'package:tenis_club/ui/pages/court_selection/court_selection_screen.dart';
import 'package:tenis_club/ui/pages/home/home_screen.dart';
import 'package:tenis_club/ui/pages/reservation/reservation_screen.dart';
import 'package:tenis_club/ui/pages/splash/splash_screen.dart';
import 'package:tenis_club/utils/constans.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.splash: (_) => const SplashScreen(),
  Routes.home: (_) => const HomeScreen(),
  Routes.reservation: (_) => const ReservationScreen(),
  Routes.courtSelection: (_) => const CourtSelectionScreen(),
};
