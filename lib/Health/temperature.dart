// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Health/health_icons.dart';
import 'package:seriorlife/data_base.dart';

class Temperature_level extends StatelessWidget {
  const Temperature_level({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 105,
        width: 173,
        margin: const EdgeInsets.only(top: 12, left: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 249, 249, 249),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 160, 161, 165),
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
          padding: const EdgeInsets.only(top: 15,bottom: 0),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 27), child: Text('Temperatura', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue))),
                Padding(padding: EdgeInsets.only( left: 4), child: Icon(health_icons.temperature_high, size:20, color: Colors.blue),)
                ],
              ),
              Row(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 42, top: 7), child: Text('${user.temperature}', style: const TextStyle(fontSize: 48, color: Color.fromARGB(255, 41, 40, 40), fontWeight: FontWeight.normal))),
                  const Padding(padding: EdgeInsets.only(left: 6, top: 24), child: Text('Cº', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 41, 40, 40)))),
                ],
              ),
            ],
          ),
        ),
    );
  }
}