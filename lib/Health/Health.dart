// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Health/heart_rate.dart';
import 'package:seriorlife/Health/oxigen_level.dart';
import 'package:seriorlife/Health/sleep.dart';
import 'package:seriorlife/Health/temperature.dart';
import 'package:seriorlife/Health/walk.dart';
import 'package:seriorlife/User/user.dart';
import 'package:seriorlife/data_base.dart';


class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 0, bottom: 10),
          child: Row(
            children: [
              Text('Bienvenido/a\n${user.name} ${user.surname}', 
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 28,
                    fontWeight: FontWeight.w500
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 90,),
                child: IconButton(
                    tooltip: 'User',
                    icon: const Icon(Icons.account_circle, color: Color.fromARGB(255, 129, 126, 126), size: 45,),
                    onPressed: () {
                      Navigator.of(context).push(
                      MaterialPageRoute( builder: (_) => const Users()),
                      );
                    },
                  ),
              ),
            ],
          ),
        ),
        Heart_rate(),
        Row(
          children: const [
            Oxigen_level(),
            Temperature_level()
          ],
        ),
        const Walking(),
        const Sleeping_time()
      ],
    );
  }
}