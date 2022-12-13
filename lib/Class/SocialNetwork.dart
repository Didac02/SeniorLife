// ignore_for_file: non_constant_identifier_names, file_names

class SocialNetwork{ 
  late String name; 
  late int people;
  late String description;
  late List<String> hobbies;
  late int similar;
  late bool is_member;


  // Definición de parametros necesarios para la creación de un usuario
  SocialNetwork({required this.name, required this.people, required this.description, required this.hobbies, required this.similar, required this.is_member});
}  