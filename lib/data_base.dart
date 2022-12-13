// ignore_for_file: non_constant_identifier_names
import 'package:seriorlife/Class/Date.dart';
import 'package:seriorlife/Class/Doctor.dart';
import 'package:seriorlife/Class/Donation.dart';
import 'package:seriorlife/Class/Family.dart';
import 'package:seriorlife/Class/Friend.dart';
import 'package:seriorlife/Class/HeartBeat.dart';
import 'package:seriorlife/Class/Hobby.dart';
import 'package:seriorlife/Class/Medication.dart';
import 'package:seriorlife/Class/Message.dart';
import 'package:seriorlife/Class/Review.dart';
import 'package:seriorlife/Class/SocialNetwork.dart';
import 'package:seriorlife/Class/User.dart';

// Creación del usuario
List<Donation> _user_donations = <Donation>[
  Donation(account: '1111 2222 3333 4444', day: '09/11/22', hour: '12:21', amount: 5, payed: true),
  Donation(account: '1111 2222 3333 4444', day: '09/11/22', hour: '12:22', amount: 50, payed: true),
  Donation(account: '5555 6666 7777 8888', day: '15/11/22', hour: '19:37', amount: 100, payed: true),
];

List<String> _user_hobbies = <String>['Cenar fuera de casa', 'Pasear', 'Jugar al domino', 'Juegos de cartas'];

List<String> _user_bank_acounts = <String>['1111 2222 3333 4444','5555 6666 7777 8888'];

List<int> _user_heart_rate = <int>[72,75,80,90,110,120,122,90,80,76,74,74,74,72,76,74];

List<int> _user_oxigen_level = <int>[85,85,76,71,65,39,49,59,63,77,89,92,88,87];

Doctor _user_doctor = Doctor(name: 'Jesus', surname: 'Martinez', stars: 4.5, review: 57, col_number: 129374, speciality: 'Cardiology', change: false, hospital: "Vall d'Hebron");

List<Medication> _user_medication = <Medication>[
  Medication(name: 'Eutirox', description: 'descripción...', hours: 8, quantity: '100 mg', final_date: '06/11/2023', start_date: '25/05/2022', alarm_on: false),
  Medication(name: 'Metformina', description: 'descripción...', hours: 12, quantity: '250 mg', final_date: '03/01/2023', start_date: '25/05/2022', alarm_on: false),
  Medication(name: 'benazepril', description: 'descripción...', hours: 12, quantity: '80 mg', final_date: '03/01/2023', start_date: '25/05/2022', alarm_on: false),
  Medication(name: 'Paracetamol', description: 'descripción...', hours: 12, quantity: '800 mg', final_date: '10/01/2023', start_date: '10/12/2022', alarm_on: false)
];

List<Date> _user_medical_dates = <Date>[
  Date(day: '11/12', hour: '11:00', doctor: _user_doctor, virtual: 'Virtual')
];

List<SocialNetwork> _user_social_nerworks = <SocialNetwork>[];

List<Friend> _user_friends = <Friend>[
  Friend(
    name: 'Beatriz', surname: 'Salgado', second_surname: 'Palma', age: 79, genre: 'Fem', 
    hobbies: ['Senderismo', 'Comer fuera', 'Pasear'], 
    similar: 85, last_message: Message(content: '', time: '21:10', is_readed: false), distance: 1, 
    is_friend: true, index: 0
  ),
  Friend(
    name: 'Miguel', surname: 'Jimenez', second_surname: 'Fernandez', age: 74, genre: 'Masc', 
    hobbies: ['Charlar', 'Cenar fuera', 'Pasear'],
    similar: 72, last_message: Message(content: '', time: '19:47', is_readed: true), distance: 3, 
    is_friend: true, index: 1
  ),
  Friend(
    name: 'Jorge', surname: 'Ramirez', second_surname: 'Serrano', age: 69, genre: 'Masc', 
    hobbies: ['Senderismo', 'Petanca', 'Charlar', 'Pasear'],
    similar: 90, last_message: Message(content: '', time: '18:08', is_readed: true), distance: 5, 
    is_friend: true, index: 2
  ),
];

List<Family> _user_family = <Family>[
  Family(name: 'Jorge', surname: 'Alvarez', second_surname: 'Salgado', kinship: 'Hijo'),
  Family(name: 'Lucía', surname: 'Alvarez', second_surname: 'Salgado', kinship: 'Hija'),
  Family(name: 'Julián', surname: 'Alvarez', second_surname: 'Palma', kinship: 'Nieto'),
];

// Clase User
User user = User(
  name: 'Dídac', surname: 'Alvarez', second_surname: 'Gomez', age: 73, genre: 'Masc', residency: 'Barcelona',
  donations: _user_donations, donations_count: 5, hobbies: _user_hobbies, bank_acounts: _user_bank_acounts,
  steps: 9234, temperature: 27, 
  heart_rate: _user_heart_rate, oxigen_level: _user_oxigen_level, doctor: _user_doctor, medication: _user_medication, 
  medical_dates: _user_medical_dates, social_networks: _user_social_nerworks, friends: _user_friends, family: _user_family,
);

// Creación de todos los amigos disponibles
List<Friend> global_friends = <Friend>[
  Friend(
    name: 'Juan', surname: 'Gomez', second_surname: 'Fernandez', age: 81, genre: 'Masc', 
    hobbies: ['Pasear', 'Comer fuera','Dominó', 'Cartas', 'Petanca'], similar: 72, last_message: Message(content: '', 
    time: '00:00', is_readed: true), distance: 3, is_friend: false, index: 0
  ),
  Friend(
    name: 'Manolo', surname: 'Jimenez', second_surname: 'Jimenez', age: 76, genre: 'Masc', 
    hobbies: ['Petanca', 'Comer fuera', 'Pasear'], similar: 43, last_message: Message(content: '', 
    time: '00:00', is_readed: true), distance: 17, is_friend: false, index: 1
  ),
  Friend(
    name: 'Maricarmen', surname: 'Gomez', second_surname: 'Rica', age: 72, genre: 'Fem', 
    hobbies: ['Senderismo', 'Comer fuera', 'Punto'], similar: 89, last_message: Message(content: '', 
    time: '00:00', is_readed: true), distance: 5, is_friend: false, index: 2
  ),
  Friend(
    name: 'Antonio', surname: 'Fernandez', second_surname: 'Gomez', age: 78, genre: 'Masc', 
    hobbies: ['Dominó', 'Punto', 'Cenar fuera', 'Pasear'], similar: 72, last_message: Message(content: '', 
    time: '00:00', is_readed: true), distance: 1, is_friend: false, index: 3
  ),
  Friend(
    name: 'Ruben', surname: 'De la Cruz',  second_surname: 'Fernandez', age: 73, genre: 'Masc', 
    hobbies: ['Senderismo', 'Dominó', 'Pasear'], similar: 46, last_message: Message(content: '', 
    time: '00:00', is_readed: true), distance: 21, is_friend: false, index: 4
  ),
  Friend(
    name: 'Manuel', surname: 'Rodriguez',  second_surname: 'Alvarez', age: 77, genre: 'Masc', 
    hobbies: ['Dominó', 'Petanca', 'Pasear'], similar: 22, last_message: Message(content: '', 
    time: '00:00', is_readed: true), distance: 8, is_friend: false, index: 5
  ),
];

// Creación de todas las SocialNetworks disponibles
List<SocialNetwork> global_social_networks = <SocialNetwork>[
  SocialNetwork(name: 'La Peña', people: 13, description: 'descripción...', hobbies: ['Pasear'], similar: 40, is_member: false),
  SocialNetwork(name: 'Trotamundos', people: 24, description: 'descripción...', hobbies: ['Senderismo', 'Pasear'], similar: 70, is_member: false),
  SocialNetwork(name: 'Correcaminos', people: 7, description: 'descripción...', hobbies: ['Senderismo', 'Pasear'], similar: 67, is_member: false),
  SocialNetwork(name: '¿Comemos?', people: 11, description: 'descripción...', hobbies: ['Comer fuera de casa', 'Cenar fuera de casa'], similar: 23, is_member: false),
  SocialNetwork(name: 'La plaza', people: 18, description: 'descripción...', hobbies: ['Pasear', 'Comer fuera de casa'], similar: 58, is_member: false),
  SocialNetwork(name: 'El dominó', people: 8, description: 'descripción...', hobbies: ['Jugar al domino', 'Juegos de cartas', 'Juegos de mesa'], similar: 81, is_member: false),
];

// Creación de las fechas disponibles para pedir cita
List<String> aviable_dates = <String>['13/12','14/12','17/12','20/12','21/12','01/01'];
List<List<String>>  aviable_hours = <List<String>>[
  ['09:00', '10:00', '12:00', '16:00', '17:00'],
  ['10:00', '12:00', '16:00', '17:00'],
  ['09:00', '12:00', '16:00', '17:00'],
  ['09:00', '10:00', '16:00', '17:00'],
  ['09:00', '10:00', '12:00', '17:00'],
  ['09:00', '10:00', '12:00', '16:00']
];

// Creación de todos los Doctores disponibles
List<Doctor> aviable_doctors = <Doctor>[
  Doctor(name: 'Jorge', surname: 'Sanchez', stars: 4, review: 78, col_number: 131374, speciality: 'Pediatrics', change: false, hospital: "Vall d'Hebron"),
  Doctor(name: 'Luís', surname: 'Garcia', stars: 3, review: 35, col_number: 131674, speciality: 'Neurology', change: false, hospital: "Sant Pau"),
  Doctor(name: 'Ana', surname: 'Casamian', stars: 3.5, review: 87, col_number: 129982, speciality: 'Pediatrics', change: false, hospital: "Clínica Quirón"),
  Doctor(name: 'Pedro', surname: 'Martinez', stars: 4.5, review: 42, col_number: 130356, speciality: 'Pediatrics', change: false, hospital: "Vall d'Hebron"),
  Doctor(name: 'Marta', surname: 'Rica', stars: 4, review: 29, col_number: 132001, speciality: 'Nephrology', change: false, hospital: "Hospital Clínic"),
];

// Creación diagnostico
List<String> diagnostic = <String>[
  'Diabetes tipo II', 'hipotiroidismo', 'hipertensión', 'Artrosis'
];

// Datos del grafico del pulso
List<Heart_beat> chartData = <Heart_beat>[
  Heart_beat(0, 170), Heart_beat(1, 180), Heart_beat(2, 190), Heart_beat(3, 170), Heart_beat(4, 160), Heart_beat(5, 190), Heart_beat(6, 220), Heart_beat(7, 250),
  Heart_beat(8, 280), Heart_beat(10, 600), Heart_beat(11, 900), Heart_beat(12, 360), Heart_beat(13, 240), Heart_beat(15, 160), Heart_beat(16, 0),
  Heart_beat(16, 90), Heart_beat(17, 140), Heart_beat(18, 220), Heart_beat(19, 170),
  Heart_beat(0, 170), Heart_beat(1, 180), Heart_beat(2, 190), Heart_beat(3, 170), Heart_beat(4, 160), Heart_beat(5, 190), Heart_beat(6, 220), Heart_beat(7, 250),
  Heart_beat(8, 280), Heart_beat(10, 600), Heart_beat(11, 900), Heart_beat(12, 360), Heart_beat(13, 240), Heart_beat(15, 160), Heart_beat(16, 0),
  Heart_beat(16, 90), Heart_beat(17, 140), Heart_beat(18, 220), Heart_beat(19, 170),
  Heart_beat(0, 170), Heart_beat(1, 180), Heart_beat(2, 190), Heart_beat(3, 170), Heart_beat(4, 160), Heart_beat(5, 190), Heart_beat(6, 220), Heart_beat(7, 250),
  Heart_beat(8, 280), Heart_beat(10, 600), Heart_beat(11, 900), Heart_beat(12, 360), Heart_beat(13, 240), Heart_beat(15, 160), Heart_beat(16, 0),
  Heart_beat(16, 90), Heart_beat(17, 140), Heart_beat(18, 220), Heart_beat(19, 170),
  Heart_beat(0, 170), Heart_beat(1, 180), Heart_beat(2, 190), Heart_beat(3, 170), Heart_beat(4, 160), Heart_beat(5, 190), Heart_beat(6, 220), Heart_beat(7, 250),
  Heart_beat(8, 280), Heart_beat(10, 600), Heart_beat(11, 900), Heart_beat(12, 360), Heart_beat(13, 240), Heart_beat(15, 160), Heart_beat(16, 0),
  Heart_beat(16, 90), Heart_beat(17, 140), Heart_beat(18, 220), Heart_beat(19, 170),
];

// Datos de la actualización del pulso
List<int> Chart_next_data =<int>[
  170,180,190,170,160,190,220,250,280,600,900,360,240,160,0,90,140,220,220,170,
  170,180,190,170,160,190,220,250,280,600,900,360,240,160,0,90,140,220,220,170,
  170,180,190,170,160,190,220,250,280,600,900,360,240,160,0,90,140,220,220,170,
];

// Creación de todos los Hobbys disponibles
List<Hobby> global_hobbies = <Hobby>[
  Hobby(name: 'Cartas', selected: false), Hobby(name: 'Dominó', selected: false), 
  Hobby(name: 'Comer fuera', selected: false), Hobby(name: 'Cenar fuera', selected: false),
  Hobby(name: 'Pasear', selected: false), Hobby(name: 'senderismo', selected: false),
  Hobby(name: 'Petanca', selected: false), Hobby(name: 'Ciclismo', selected: false),
  Hobby(name: 'Punto', selected: false), Hobby(name: 'Charlar', selected: false),
];

// Creación de las reseñas del Doctor
List<Review> global_reviews = <Review>[
  Review(complete_name: 'Beatriz Salgado Palma', stars: 4, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue ut lectus arcu bibendum at varius vel.'),
  Review(complete_name: 'Manolo Jimenez Jimenez', stars: 3, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue ut lectus arcu bibendum at varius vel.'),
  Review(complete_name: 'Maricarmen Gomez Rica', stars: 1.5, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue ut lectus arcu bibendum at varius vel.'),
  Review(complete_name: 'Manuel Rodriguez Alvarez', stars: 5, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue ut lectus arcu bibendum at varius vel.'),
];