// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Health/health_icons.dart';
import 'package:seriorlife/data_base.dart';

get_zeros_value() {
  if (user.steps < 10) {return '0000';}
  else if (user.steps < 100) {return '000';}
  else if (user.steps < 1000) {return '00';}
  else if (user.steps < 10000) {return '0';}
  else {return '';} 
}

get_final_string() {
  return ('${user.steps.toString().substring(0,2)}.${user.steps.toString().substring(2,user.steps.toString().length)}');
}

class Walking extends StatelessWidget {
  const Walking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 75,
        width: 360,
        margin: const EdgeInsets.only(top: 12),
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
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text:get_zeros_value(), style: const TextStyle(fontSize: 35, color: Colors.grey)), 
                    TextSpan( text: user.steps >= 10000 ? get_final_string() : ('${user.steps}'), style: const TextStyle(fontSize: 35, color: Color.fromARGB(255, 41, 40, 40))),
                  ], 
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 8, top: 12), child: Text('Pasos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 41, 40, 40)))),
              const Padding(padding: EdgeInsets.only(left: 18, bottom: 34, top: 5), child: Text('Pasos diarios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue))),
              const Padding(padding: EdgeInsets.only(bottom: 30, top: 5, left: 4), child: Icon(health_icons.shoe_prints, size: 18, color: Colors.blue),),
            ],
          ),
        ),
      ),
    );
  }
}