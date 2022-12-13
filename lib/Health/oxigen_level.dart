// ignore_for_file: non_constant_identifier_names, unused_element, camel_case_types, no_leading_underscores_for_local_identifiers, unused_field, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seriorlife/Health/health_icons.dart';
import 'package:seriorlife/data_base.dart';

class Oxigen_level extends StatelessWidget {
  const Oxigen_level({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _oxigen_value = ValueNotifier<int>(85);
    int pos = 0;
    Timer? _oxigen_timer;

    // Función para indicar el color que se debe mostrar según el valor del pulso
    get_oxigen_color() {
      if (_oxigen_value.value <= 40) {return const Color.fromARGB(255, 211, 82, 73);}
      else if (_oxigen_value.value <= 60 ) {return const Color.fromARGB(255, 255, 126, 83);}
      else {return const Color.fromARGB(255, 41, 40, 40);} 
    }

    void _updateValue(Timer _oxigen_timer) {
      if (pos == user.oxigen_level.length - 1) {pos = 0;}
      _oxigen_value.value = user.oxigen_level[pos];
      pos ++;
    }

    _oxigen_timer = Timer.periodic(const Duration(milliseconds: 1500), _updateValue);

    return Container(
      height: 105,
      width: 173,
      margin: const EdgeInsets.only(top: 12, left: 15),
      // Decoracion del Container donde va a ir todo el contenido del muestreo del porcentaje del nivel de oxigeno en sangre.
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 249, 249, 249),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 160, 161, 165),//Color.fromARGB(255, 182, 207, 249),
            offset: Offset(2,2),
            blurRadius: 10,
            spreadRadius: 1
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4,-4),
            blurRadius: 15,
            spreadRadius: 1
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 10),
        child: Column(
          children: [
            Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 15), child: Text('Nivel de oxigeno', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue))),
                // Icono 
                Padding(padding: EdgeInsets.only( left: 4), child: Icon(health_icons.health, size: 18, color: Colors.blue),)
              ],
            ),
            ValueListenableBuilder<int>(
              valueListenable: _oxigen_value, 
              builder: (BuildContext context, int value, Widget? child) {
                // Texto para mostrar el valor numerico de la media de pulsaciones
                return Row(
                  children: [
                    // Texto para mostrar el valor numerico del porcentaje del nivel de oxigeno en sangre.
                    Padding(padding: const EdgeInsets.only(left: 15, top: 10), child: Text('$value%', style: TextStyle(fontSize: 38, color: get_oxigen_color(), fontWeight: FontWeight.normal))),
                    Padding(padding: const EdgeInsets.only(left: 8, top: 24, bottom: 0), child: Text('SpO2', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: get_oxigen_color()))),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}