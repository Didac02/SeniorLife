// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/cupertino.dart';
import 'package:seriorlife/Class/Date.dart';
import 'package:seriorlife/Class/Doctor.dart';
import 'package:seriorlife/Class/Donation.dart';
import 'package:seriorlife/Class/Family.dart';
import 'package:seriorlife/Class/Friend.dart';
import 'package:seriorlife/Class/Medication.dart';
import 'package:seriorlife/Class/SocialNetwork.dart';

class User { 
  // Información basica del usuario
  late String name; 
  late String surname; 
  late String second_surname;
  late int age;
  late String genre;
  late String residency;
  late List<Donation> donations;
  late int donations_count;
  late List<String> hobbies;
  late List<String> bank_acounts ;
  // Información de monitoraje del usuario
  late int steps;
  late int temperature;
  late List<int> heart_rate;
  late List<int> oxigen_level;
  // Información medica del usuario
  late Doctor doctor;
  late List<Medication> medication;
  late List<Date> medical_dates;
  // Informacion social del usuario
  late List<SocialNetwork> social_networks;
  late List<Friend> friends;
  late List<Family> family;

  // Definición de parametros necesarios para la creación de un usuario
  User({required this.name, required this.surname, required this.second_surname, required this.age, required this.genre,
  required this.residency, required this.donations, required this.donations_count, required this.hobbies, required this.bank_acounts,
  required this.steps, required this.temperature,required this.heart_rate, required this.oxigen_level, required this.doctor, 
  required this.medication, required this.medical_dates, required this.social_networks, required this.friends, required this.family});

  // GETTERS 
  // Getters información basica del usuario
  String get user_name { return name; } 
  String get user_surname { return surname; } 
  String get user_second_surname { return surname; }
  int get user_age { return age; } 
  String get usr_genre { return genre; } 
  String get user_residency { return residency; }
  List<Donation> get user_donations { return donations; } 
  int get user_donations_count { return donations_count; }
  List<String> get user_hobbies { return hobbies; } 

  // Getters información de monitoraje del usuario
  int get user_steps { return steps; } 
  int get user_temperature { return temperature; } 
  List<int> get user_heart_rate { return heart_rate; } 
  List<int> get user_oxigen_level { return oxigen_level; } 

  // Getters información medica del usuario
  Doctor get user_doctor { return doctor; } 
  List<Medication> get user_medication { return medication; } 
  List<Date> get user_medical_dates { return medical_dates; } 

  // Getters información social del usuario
  List<Family> get user_family { return family; } 
  List<Friend> get user_friends { return friends; } 
  List<SocialNetwork> get user_social_networks { return social_networks; }


  // SETTERS
  // Setters información basica del usuario
  set user_name(String name) { this.name = name; } 
  set user_surname(String surname) { this.surname = surname; }
  set user_second_surname(String second_surname) { this.second_surname = second_surname; }
  set user_age(int age) { 
    if(age<= 0) { FlutterError('Incorrect value, age must be grater than 0.');
    } else { this.age = age; } 
  }    
  set user_genre(String genre) { this.genre = genre; }
  // Setters donaciones
  set user_donations(List<Donation> donations) {
    if (donations.isEmpty){ FlutterError("The new list of donations can't be empty.");
    } else { this.donations = donations; }
  }
  add_donation(Donation new_donation) {
    donations.insert((donations.length), new_donation);
    donations_count ++;
  }
  remove_donation(int index) {
    donations.removeAt(index);
    donations_count --;
  }

  // Setters información de monitoraje del usuario
  set user_steps(int steps) { 
    if(age<= 0) { FlutterError('Incorrect value, the minimum value for the steps of an user is 0.');
    } else { this.steps = steps; } 
  }
  set user_temperature(int temperature) { this.temperature = temperature; }
  set user_heart_rate(List<int> heart_rate) {
    if (heart_rate.isEmpty){ FlutterError("The new list of the heart rate can't be empty.");
    } else { this.heart_rate = heart_rate; }
  }
  set user_oxigen_level(List<int> oxigen_level) {
    if (oxigen_level.isEmpty){ FlutterError("The new list of the oxigen level can't be empty.");
    } else { this.oxigen_level = oxigen_level; }
  }

  // Setters información medica del usuario
  set user_doctor(Doctor doctor) { this.doctor = doctor; }
  set user_medication(List<Medication> medication) {
    if (medication.isEmpty){ FlutterError("The new list of medication can't be empty.");
    } else { this.medication = medication; }
  }
  set user_medical_dates(List<Date> medical_dates) {
    if (medical_dates.isEmpty){ FlutterError("The new list of medical dates can't be empty.");
    } else { this.medical_dates = medical_dates; }
  }

  add_medical_date(Date new_date) {
    medical_dates.insert((medical_dates.length), new_date);
  }
  remove_medical_date(int index) { medical_dates.removeAt(index); }

  // Setters información social del usuario
  // Setters de SocialNetworks a las que pertenece el usuaro
  set user_social_networks(List<SocialNetwork> social_networks) { this.social_networks = social_networks; }
  add_social_network(SocialNetwork new_social_network) {
    social_networks.insert((social_networks.length), new_social_network);
  }
  remove_social_network(int index) { social_networks.removeAt(index); }
  
  // Setters de amigos del usuario
  set user_friends(List<Friend> friends) { this.friends = friends; }
  add_friend(Friend new_friend) {
    friends.insert((friends.length), new_friend);
  }
  remove_friend(int index) { friends.removeAt(index); }

}  