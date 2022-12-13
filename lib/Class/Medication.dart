// ignore_for_file: file_names, non_constant_identifier_names

class Medication{ 
  late String name;
  late String description;
  late int hours;
  late String quantity;
  late String final_date;
  late String start_date;
  late bool alarm_on;

  // Definición de parametros necesarios para la creación de un usuario
  Medication({required this.name, required this.description, required this.hours, required this.quantity, required this.final_date, required this.start_date, required this.alarm_on});
}  