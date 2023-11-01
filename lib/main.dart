
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_club/config/themes/themes.dart';
import 'package:tenis_club/ui/pages/court_selection/bloc/court_selection_bloc.dart';
import 'package:tenis_club/ui/pages/home/bloc/home_bloc.dart';
import 'package:tenis_club/ui/pages/reservation/bloc/reservation_bloc.dart';
import 'package:tenis_club/ui/routes.dart';
import 'package:tenis_club/utils/constans.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
     BlocProvider(create: (_) => ReservationBloc()),
     BlocProvider(create: (_) => HomeBloc()),
    BlocProvider(create: (_) => CourtSelectionBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalDatabase.viewCourts();
    // DBSqlLite().createDatabase();
    return MaterialApp(
      title: 'Agendamientos',
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      routes: appRoutes,
      initialRoute: Routes.splash,
      themeMode: ThemeMode.light,
    );
  }
}