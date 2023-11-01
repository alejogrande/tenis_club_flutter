part of '../reservation_screen.dart';

class DialogSelectionCompactFecha extends StatefulWidget {
  final Court? court;
  const DialogSelectionCompactFecha(
    this.court,
    {
    Key? key,
  }) : super(key: key);
  @override
  DialogSelectionState createState() => DialogSelectionState();
}

class DialogSelectionState extends State<DialogSelectionCompactFecha> {

  late ReservationBloc reservationBloc;
  @override
  Widget build(BuildContext context) {
    reservationBloc = BlocProvider.of<ReservationBloc>(context);
    return AlertDialog(
      title: const Text("Seleccione Fecha"),
      content: SizedBox(
        width: 300,
        height: 300,
        child: CalendarDatePicker(
          firstDate: DateTime.now().add(const Duration(days: 1)),
          lastDate: DateTime.now().add(const Duration(days: 4)),
          initialDate: DateTime.now().add(const Duration(days: 1)),
          onDateChanged: (DateTime d) {
            
            reservationBloc.add(ReservationSelectedDateEvent(widget.court,d));
            setState(() {
              
            });
             Navigator.pop(context);
             
             
          },
        ),
      ),
    );
  }
}
