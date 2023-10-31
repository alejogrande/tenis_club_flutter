part of '../reservation_screen.dart';

class DialogSelectionCompactFecha extends StatefulWidget {
  Court? court;
  DialogSelectionCompactFecha(
    this.court,
    {
    Key? key,
  }) : super(key: key);
  @override
  _DialogSelectionState createState() => _DialogSelectionState();
}

class _DialogSelectionState extends State<DialogSelectionCompactFecha> {

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
          firstDate: DateTime.now().add(const Duration(days: 16)),
          lastDate: DateTime(DateTime.now().year + 1, 1),
          initialDate: DateTime.now().add(const Duration(days: 16)),
          onDateChanged: (DateTime d) {
            
            reservationBloc.add(ReservationSelectedDateEvent(widget.court,d));
             Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
