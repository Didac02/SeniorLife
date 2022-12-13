// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Icons/main_icons.dart';
import 'package:seriorlife/box_decoration.dart';
import 'package:seriorlife/data_base.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

List<int> _times = [1,5,10,15,30,45];
List<String> _measures = ['Min', 'Horas'];
int _index_time = 0; 
int _index_measure = 0;
int _actual_time = 15;

class _MedicationsState extends State<Medications> {

  _update_time() {
    setState(() {
      if (_index_time < _times.length - 1) {
        _index_time ++;
      } else { _index_time = 0; }
    });
  }

  _update_measure() {
    setState(() {
      if (_index_measure < _measures.length - 1) {
        _index_measure ++;
      } else { _index_measure = 0; }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10, bottom: 5, right: 170), child: Text('Mi medicación', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold))),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: user.medication.length,
            itemBuilder: (BuildContext context, int index) {
              // Contenedor con toda la información de las SocialNetwork cercanas al usuario
              return Container(
                height: 50, width: 110,
                margin: const EdgeInsets.all(10),
                decoration: box_decoration(),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 5),
                    child: Icon(MainIcons.pills_1, size: 45,),
                  ),
                  Text(user.medication[index].name, style: const TextStyle(color: Colors.blue, fontSize: 16, ),)
                ]),
              );
            }
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 15, bottom: 5, right: 210), child: Text('Mis alertas', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold))),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 60), 
          child: Row(children: [
            const Text('Se avisará', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(width: 10),
            Container(
              height: 35, width: 60,
              decoration: box_decoration_button(),
              child: Center(child: TextButton(onPressed: () => _update_time(), child: Text('${_times[_index_time]}', style: const TextStyle(color: Colors.white, fontSize: 16)),)),
            ),
            const SizedBox(width: 10),
            Container(
              height: 35, width: 60,
              decoration: box_decoration_button(),
              child: Center(child: TextButton(onPressed: () => _update_measure(), child: Text(_measures[_index_measure], style: const TextStyle(color: Colors.white, fontSize: 16),),)),
            ),
            const SizedBox(width: 10),
            const Text('antes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ],)
        ),
        SizedBox(
          height: 430,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: user.medication.length,
            itemBuilder: (BuildContext context, int index) {
              // Contenedor con toda la información de las SocialNetwork cercanas al usuario
              return Container(
                height: 140, width: 110,
                margin: const EdgeInsets.all(10),
                decoration: box_decoration(),
                child: Stack(children: [
                  Positioned(left:15, top:10, child: Text(user.medication[index].name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)),
                  Positioned(left:15, top:40, child: Row(children: [
                    const Text('Intervalos: ', style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('Cada ${user.medication[index].hours} horas', style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),)
                  ],)),
                  Positioned(left:15, top:60, child: Row(children: [
                    const Text('Desde: ', style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(user.medication[index].start_date, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),)
                  ],)),
                  Positioned(left:15, top:80, child: Row(children: [
                    const Text('Hasta: ', style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(user.medication[index].final_date, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),)
                  ],)),
                  Positioned(left:15, top:105, child: Row(children: [
                    const Text('Próxima toma: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('${user.medication[index].quantity} dentro de ${9-_actual_time+user.medication[index].hours}', style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),)
                  ],)),
                  Positioned(
                    left: 280, top: 25,
                    child: IconButton(
                      icon: user.medication[index].alarm_on ? const Icon(Icons.toggle_on, color: Colors.blue, size: 70,) : const Icon(Icons.toggle_off, color: Colors.black38, size: 70,), 
                      onPressed: () => setState(() { user.medication[index].alarm_on ? user.medication[index].alarm_on = false : user.medication[index].alarm_on = true; })
                    ),
                  )
                ],)
              );
            }
          ),
        ),
      ]
    );
  }
}