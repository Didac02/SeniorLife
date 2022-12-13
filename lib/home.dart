// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Doctor/doctor.dart';
import 'package:seriorlife/Health/Health.dart';
import 'package:seriorlife/Icons/main_icons.dart';
import 'package:seriorlife/Medication/medication.dart';
import 'package:seriorlife/Social/social.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> _Widgets = const[Health(), Medications(), Doctors(), Social()];
int _Widget_index = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        // Boton flotante de SOS
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 33, 150, 243),
          onPressed: () {},
          tooltip: 'SOS',
          child: const Icon(Icons.sos),
        ),
        // Posición del botón flotante de SOS
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // Barra de navegación inferior
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          // Forma del notch respecto al botón flotante de SOS
          shape: const CircularNotchedRectangle(),
          // Iconos de la barra de navegacion inferior
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 55),
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Health',
                  icon: Icon(MainIcons.heartbeat, color: _Widget_index == 0 ?Colors.blue : const Color.fromARGB(114, 33, 149, 243),),
                  onPressed: () => setState(() { _Widget_index = 0; }),
                ),
                const SizedBox(height: 5,width: 20),
                IconButton(
                  tooltip: 'Medication',
                  icon: Icon(MainIcons.pills_1, color: _Widget_index == 1 ?Colors.blue : const Color.fromARGB(114, 33, 149, 243),),
                  onPressed: () => setState(() { _Widget_index = 1; }),
                ),
                const SizedBox(height: 5,width: 20),
                IconButton(
                  tooltip: 'Doctor',
                  icon: Icon(MainIcons.user_md, color: _Widget_index == 2 ?Colors.blue : const Color.fromARGB(114, 33, 149, 243),),
                  onPressed: () => setState(() { _Widget_index = 2; }),
                ),
                const SizedBox(height: 5,width: 20),
                IconButton(
                  tooltip: 'Social',
                  icon: Icon(MainIcons.user_friends, color: _Widget_index == 3 ?Colors.blue : const Color.fromARGB(114, 33, 149, 243),),
                  onPressed: () => setState(() { _Widget_index = 3; }),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Center( child: _Widgets[_Widget_index])
        ),
      ),
    );
  }
}