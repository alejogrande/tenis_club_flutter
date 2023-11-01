import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_club/data/datasources/local_data_sources_implements.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/domain/respositories/booking_repository.dart';
import 'package:tenis_club/ui/pages/court_selection/bloc/court_selection_bloc.dart';
import 'package:tenis_club/ui/pages/reservation/bloc/reservation_bloc.dart';
import 'package:tenis_club/ui/widgets/custom_elevated_button.dart';
import 'package:tenis_club/utils/constans.dart';
import 'package:tenis_club/utils/resources/colors.dart';

part 'widgets/card_court.dart';

class CourtSelectionScreen extends StatefulWidget {
  const CourtSelectionScreen({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _CourtSelectionScreenState createState() => _CourtSelectionScreenState();
}

class _CourtSelectionScreenState extends State<CourtSelectionScreen> {
  late CourtSelectionBloc courtBloc;
  late ReservationBloc reservationBloc;

  @override
  void initState() {
    super.initState();
    
    courtBloc = BlocProvider.of<CourtSelectionBloc>(context);
    reservationBloc= BlocProvider.of<ReservationBloc>(context);
    courtBloc.add(CourtSelectionLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    // BookingRepository repository =
    //     BookingRepository(LocalDataSourceImplement());
    // var a;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Selección de cancha"),
        ),
        body: BlocBuilder<CourtSelectionBloc, CourtSelectionState>(
            bloc: courtBloc, // provide the local bloc instance
            builder: (context, state) {
              return state is CourtSelectionLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (state is CourtSelectionSucefullState ||
                          state is CourtSelectionSelectedState)
                      ? SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.listCourts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardCourt(
                                        court: state.listCourts[index],
                                        selected: state.court?.id ==
                                                state.listCourts[index].id
                                            ? true
                                            : false,
                                        onTap: () {
                                          courtBloc.add(
                                              CourtSelectionSelectedEvent(
                                                  state.listCourts[index]));
                                          // print(state.listCourts[index].name.toString())
                                        });
                                  }),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: state is CourtSelectionSelectedState
                                    ? CustomElevatedButton(
                                        onTap: () {
                                          reservationBloc
                                              .add(ReservationInitialEvent(state.court));
                                          Navigator.pushNamed(
                                              context, Routes.reservation);
                                        },
                                        label: "Seleccionar",
                                      )
                                    : const CustomElevatedButton(
                                        color: AppColors.disabledButton,
                                        label: "Seleccionar",
                                      ),
                              )
                            ],
                          ),
                        )
                      : Container();
            }));
  }
}
