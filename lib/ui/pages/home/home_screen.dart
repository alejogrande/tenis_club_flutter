import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_club/data/model/home_booking_model.dart';
import 'package:tenis_club/ui/pages/home/bloc/home_bloc.dart';
import 'package:tenis_club/ui/pages/home/widgets/alerta_de_eliminado.dart';
import 'package:tenis_club/ui/pages/home/widgets/text_and_title_textfiel.dart';

import 'package:tenis_club/utils/constans.dart';

import 'package:tenis_club/utils/resources/colors.dart';
part 'widgets/card_booking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(HomeLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reservas"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                Navigator.pushNamed(context, Routes.courtSelection),
            child: const Icon(Icons.add)),
        body: BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc, // provide the local bloc instance
            builder: (context, state) {
              return state is HomeLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (state is HomeSucefullState
                      ? SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.listBooking.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardBooking(
                                        booking: state.listBooking[index],
                                        onTap: () {
                                          showDeleteConfirmationDialog(
                                            context,
                                            () {
                                              homeBloc.add(DeleteBookingEvent(
                                                  state
                                                      .listBooking[index].id!));
                                            },
                                          );
                                        });
                                  }),
                            ],
                          ),
                        )
                      : Container());
            }));
  }
}
