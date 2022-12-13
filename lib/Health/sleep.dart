// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:seriorlife/Health/health_icons.dart';
import 'package:seriorlife/Health/sleep_chart.dart';

class Sleeping_time extends StatelessWidget {
  const Sleeping_time({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 270,
        margin: const EdgeInsets.only(top: 12),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 115),
              child: Row(
                children: const [
                  Text('Horas de sueño', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                  Padding(padding: EdgeInsets.only( left: 4), child: Icon(health_icons.bed, size: 18, color: Colors.blue),)
                ],
              ),
            ),
            const Sleep_chart(),
          ],
        )
      ),
    );
  }
}