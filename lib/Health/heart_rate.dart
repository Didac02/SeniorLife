// ignore_for_file: non_constant_identifier_names, camel_case_types, no_leading_underscores_for_local_identifiers, unused_element, unused_local_variable, must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seriorlife/Class/HeartBeat.dart';
import 'package:seriorlife/Health/health_icons.dart';
import 'package:seriorlife/data_base.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Inicialización de variables para el grafico del muestreo del pulso.
List<Heart_beat> charData = charData;
int count = 21;

class Heart_rate extends StatelessWidget {
  Heart_rate({Key? key}) : super(key: key);
  List<int> chart_next_data = Chart_next_data;
  
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _pulse_value = ValueNotifier<int>(75);
    ChartSeriesController? _chartSeriesController;
    final myController = TextEditingController();
    Timer? _pulse_timer;
    Timer? timer;
    int pos = 0;
    int index = 0;

    // Función para indicar el color que se debe mostrar según el valor del pulso
    get_pulse_color() {
      if (_pulse_value.value >= 120 || _pulse_value.value <= 40) {return const Color.fromARGB(255, 211, 82, 73);}
      else if (_pulse_value.value >= 100 || _pulse_value.value <= 55 ) {return const Color.fromARGB(255, 255, 126, 83);}
      else {return const Color.fromARGB(255, 41, 40, 40);} 
    }

    void _updateValue(Timer _pulse_timer) {
      if (pos == user.user_heart_rate.length - 1) {pos = 0; index = 0;}
      _pulse_value.value = user.user_heart_rate[pos];
      pos ++;
    }

    _pulse_timer = Timer.periodic(const Duration(milliseconds: 1500), _updateValue);

    void _updateDataSource(Timer timer) {
      // Añadimos a la lista de valores iniciales un nuevo objeto de tipo Heart_beat que representa el nuevo dato 
      // que ha sido recopilado por el dispositivo wearable.
      chartData.add(Heart_beat(count, Chart_next_data[index]));

      if (index == (Chart_next_data.length - 2)) { index = 0; }
      if (chartData.length == 77) {
        // Elimina el primer elemento de los datos recopilados guardados en una lista de valores iniciales, con esto 
        // siempre mostramos el mismo numero de valores del pulso conservando la clara visivilidad del pulso.
        chartData.removeAt(0);
        // Actualizamos los indices usados por el grafico para el mostreo del pulso
        _chartSeriesController?.updateDataSource(addedDataIndexes: <int>[chartData.length - 1], removedDataIndexes: <int>[0]);
      }
      count = count + 1;
      index = index + 1;
    }
    // Temporizador para mostrar el valor del pulso en el grafico en un intervalo de 0,1 segundos.
    timer = Timer.periodic(const Duration(milliseconds: 90), _updateDataSource);

    return Center(
      child: Container(
        height: 130,
        width: 360,
        margin: const EdgeInsets.only(top: 0),
        // Decoracion del Container donde va a ir todo el contenido del muestreo del pulso
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
        child: 
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                children: [
                  // Constructor para mostrar el valor del pulso dinamicamente, es decir, 
                  // respecto a los diferentes valores que puede tener el pulso durante la ejecución.
                  ValueListenableBuilder<int>(
                    valueListenable: _pulse_value, 
                    builder: (BuildContext context, int value, Widget? child) {
                      // Texto para mostrar el valor numerico de la media de pulsaciones
                      return RichText(
                        text: TextSpan(
                          children: [
                            // Condicion para cambiar la forma de mostrar el valor del pulso en función de su valor
                            _pulse_value.value < 100 ? const TextSpan(text:'0', style: TextStyle(fontSize: 35, color: Colors.grey)) : const TextSpan(text: ''),
                            TextSpan(text:'$value', style: TextStyle(fontSize: 35, color: get_pulse_color())),
                            TextSpan(text: '  BPM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: get_pulse_color())),  
                          ], 
                        ),
                      );
                    }
                  ),
                  // Texto simple                  
                  const Padding(padding: EdgeInsets.only(left: 70, bottom: 30), child: Text('Ritmo cardíaco', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue))),
                  // Icono 
                  const Padding(padding: EdgeInsets.only(bottom: 30, left: 4), child: Icon(health_icons.heartbeat, size: 20, color: Colors.blue),),
                ],
              ),
            ),
            // Grafico del muestreo de las pulsaciones
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 8),
                child: 
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: const MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.none),
                      
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0)),
                  
                  series: <LineSeries<Heart_beat, int>>[  
                    LineSeries<Heart_beat, int>(
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      isVisibleInLegend: false,
                      color: const Color.fromARGB(255, 73, 130, 244),
                      dataSource: chartData,
                      xValueMapper: (Heart_beat sales, _) => sales.minute,
                      yValueMapper: (Heart_beat sales, _) => sales.value,
                    )
                  ],
                )
              ),
            ),
          ],
        )
      ),
    );
  }
}