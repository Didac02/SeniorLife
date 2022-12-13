// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Sleep_time {
  final String day;
  final double hours;
  final Color color;

  Sleep_time(this.day, this.hours, this.color);
}

get_color(value){
  if (value < 5) {return Color.fromHex(code: '#BFD7ED');}
  else if (value < 7) {return Color.fromHex(code: '#60A3D9');}
  else { return Color.fromHex(code: '#055C9D');}
}

final List<double> sleep_values = <double>[4,6.5,7,7,6.7,8,9];

final List<Sleep_time> sleep_data = <Sleep_time>[
    Sleep_time('Lun', sleep_values[0], get_color(sleep_values[0])),Sleep_time('Mar', sleep_values[1], get_color(sleep_values[1])),
    Sleep_time('Mie', sleep_values[2], get_color(sleep_values[2])),Sleep_time('Jue', sleep_values[3], get_color(sleep_values[3])),
    Sleep_time('Vie', sleep_values[4], get_color(sleep_values[4])),Sleep_time('Sab', sleep_values[5], get_color(sleep_values[5])),
    Sleep_time('Dom', sleep_values[6], get_color(sleep_values[6])),
  ];

class Sleep_chart extends StatelessWidget {
  const Sleep_chart({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Sleep_time, String>> series = [
      charts.Series(
        id: 'Hours of sleep',
        data: sleep_data,
        domainFn: (Sleep_time series, _) => series.day,
        measureFn: (Sleep_time series, _) => series.hours,
        colorFn: (Sleep_time series, _) => series.color
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: SizedBox(
          height: 200,
          width: 330,
          child:BarChart(series, animate: true,),
        ),
      ),
    );
  }
}
