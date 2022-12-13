// ignore_for_file: file_names, non_constant_identifier_names

class Doctor{ 
  late String name;
  late String surname; 
  late double stars;
  late int review;
  late int col_number;
  late String speciality;
  late bool change;
  late String hospital;

  // Definición de parametros necesarios para la creación de un usuario
  Doctor({required this.name, required this.surname, required this.stars, required this.review, required this.col_number, required this.speciality, required this.change, required this.hospital});
}  