// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

// Decoracion para los containers

BoxDecoration box_decoration() {
  return BoxDecoration(
    color: const Color.fromARGB(221, 249, 249, 249),
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 160, 161, 165),//Color.fromARGB(255, 182, 207, 249),
        offset: Offset(2,2),
        blurRadius: 8,
        spreadRadius: 1
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-1,-1),
        blurRadius: 8,
        spreadRadius: 1
      ),
    ]
  );
}

BoxDecoration box_decoration_2() {
  return BoxDecoration(
    color: const Color.fromARGB(221, 255, 255, 255),
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 160, 161, 165),//Color.fromARGB(255, 182, 207, 249),
        offset: Offset(2,2),
        blurRadius: 8,
        spreadRadius: 1
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-1,-1),
        blurRadius: 8,
        spreadRadius: 1
      ),
    ]
  );
}

BoxDecoration box_decoration2() {
  return BoxDecoration(
    color: const Color.fromARGB(221, 249, 249, 249),
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 0, 106, 236),//Color.fromARGB(255, 182, 207, 249),
        offset: Offset(1,1),
        blurRadius: 6,
        spreadRadius: 1
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(0,0),
        blurRadius: 10,
        spreadRadius: 2
      ),
    ]
  );
}

BoxDecoration box_decoration_small() {
  return BoxDecoration(
    color: const Color.fromARGB(221, 249, 249, 249),
    borderRadius: BorderRadius.circular(25),
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 2, 121, 190),
        Color.fromARGB(255, 64, 140, 255),
        Color.fromARGB(255, 54, 165, 244),
        Color.fromARGB(255, 54, 193, 244)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}

BoxDecoration box_decoration_button() {
  return BoxDecoration(
    color: const Color.fromARGB(221, 249, 249, 249),
    borderRadius: BorderRadius.circular(5),
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 2, 121, 190),
        Color.fromARGB(255, 64, 140, 255),
        Color.fromARGB(255, 54, 165, 244),
        Color.fromARGB(255, 54, 193, 244)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}