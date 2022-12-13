// ignore_for_file: non_constant_identifier_names, file_names

import 'package:seriorlife/Class/Message.dart';

class Friend{ 
  late String name; 
  late String surname;
  late String second_surname;
  late int age;
  late String genre;
  late List<String> hobbies;
  late int similar;
  late Message last_message;
  late int distance;
  late bool is_friend;
  late int index;

  // Definición de parametros necesarios para la creación de un usuario
  Friend({required this.name, required this.surname, required this.second_surname, required this.age, required this.genre, 
  required this.hobbies, required this.similar, required this.last_message, required this.distance, required this.is_friend, required this.index});
}  