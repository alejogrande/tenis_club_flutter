import 'package:flutter/material.dart';
import 'package:tenis_club/utils/constans.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _name;
  late TextEditingController _fecha;
  late TextEditingController _hora;
  late TextEditingController _cancha;
  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: '');
    _fecha = TextEditingController(text: '');
    _hora = TextEditingController(text: '');
    _cancha = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservas"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Routes.courtSelection),
          child: const Icon(Icons.add)),
      body: const Center(child: Text("home page")),
    );
  }
}
