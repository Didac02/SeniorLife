// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seriorlife/Class/Date.dart';
import 'package:seriorlife/Doctor/specific_doctor.dart';
import 'package:seriorlife/box_decoration.dart';
import 'package:seriorlife/data_base.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

int _index = 0;
int _selected_day_index = 0;
int _selected_hour_index = 0;
int _selected_doctor_to_change = 100;
bool _is_cheked = false;

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          child: Stack(children: [
            Positioned(left: 5, top: 0, child:TextButton(
              onPressed:() {Navigator.of(context).push(MaterialPageRoute( builder: (_) => const SpecificDoctor()));},
              child: Icon(Icons.account_circle_rounded, size: 200, color: Colors.grey),
              ),
            ),
            Positioned(left:210, top: 40, child: Text(user.doctor.name, style: const TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),)),
            Positioned(left:210, top: 70, child: Text(user.doctor.surname, style: const TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),)),
            Positioned(
              left:208, top: 113, 
              child: RatingBar.builder(
                initialRating: user.doctor.stars,
                allowHalfRating: true,
                ignoreGestures: true,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.blue),
                maxRating: 5,
                onRatingUpdate: (rating) {},
              ),
            ),
            Positioned(
              left:210, top: 145, 
              child: Row(children:const [Icon(Icons.mail), SizedBox(width: 20), Icon(Icons.message_rounded), SizedBox(width: 20), Icon(Icons.rate_review)],)
            ),
          ]),
        ),
        Container(
          height: 350, width: 360,
          decoration: box_decoration_2(),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
            child: Column(
              children: [
                Container(
                  height: 45, width: 272,
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(35), border: Border.all(color: Colors.blue)),
                  child: Row(children: [
                    Container(
                      height: 35, width: 80,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: _index == 0 ? box_decoration_small() : null,
                      child: TextButton(
                        onPressed:  () => setState(() {_index = 0;}), 
                        child: Text('Registro', style: TextStyle(color: _index == 0 ?Colors.white : Colors.blue, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Container(
                      height: 35, width: 80,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: _index == 1 ? box_decoration_small() : null,
                      child: TextButton(
                        onPressed:  () => setState(() {_index = 1;}), 
                        child: Text('Pedir Cita', style: TextStyle(color: _index == 1 ?Colors.white : Colors.blue, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Container(
                      height: 35, width: 80,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: _index == 2 ? box_decoration_small() : null,
                      child: TextButton(
                        onPressed:  () => setState(() {_index = 2;}), 
                        child: Text('Cambiar', style: TextStyle(color: _index == 2 ?Colors.white : Colors.blue, fontWeight: FontWeight.bold),)
                      ),
                    ),
                  ],)
                ),
                SizedBox(
                  width: 400, height: 290,
                  child: _index == 0 ?  
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  ///  DISPLAY REGISTRO
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                    height: 330, width: 300,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Column(children: [
                      const Padding(
                        padding:  EdgeInsets.all(20),
                        child: Text('Diagnostico', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          height: 100,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                                mainAxisExtent: 25
                            ),
                            itemCount: diagnostic.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Text('- ${diagnostic[index]}', style: const TextStyle(fontSize: 18),);
                            }
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 45,
                        width: 150,
                        decoration: box_decoration_small(),
                        child: const Center(
                          child: Text('Descarga PDF', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                        )
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 40, right: 40, top: 15),
                        child: Text('¿Mas información? No dudes en contactar con tu medico o llamanos al +93 555 82 44', style: TextStyle(),),
                      ),
                    ])
                  ) 
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  : _index == 1 ?
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  ///  DISPLAY PEDIR CITA
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                    height: 330, width: 300,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Column(children: [
                      const Padding(
                        padding:  EdgeInsets.all(20),
                        child: Text('Escoje un dia', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: aviable_dates.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 70, height: 10,
                              margin: const EdgeInsets.only(top:5, bottom: 18, left: 10, right: 10),
                              decoration: BoxDecoration( color: _selected_day_index == index ? const Color.fromARGB(255, 0, 115, 255) : Colors.white, borderRadius: BorderRadius.circular(35), border: Border.all(color: Colors.blue)),
                              child: Center(child: 
                                TextButton(
                                  onPressed: () => setState(() {_selected_day_index = index;}),
                                  child:Text(
                                    aviable_dates[index], 
                                    style: _selected_day_index == index ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)
                                  ),
                                )
                              ),
                            );
                          }
                        )
                      ),
                      SizedBox(
                        height: 60, width: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: aviable_hours[_selected_day_index].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 70, height: 10,
                              margin: const EdgeInsets.only(top:5, bottom: 18, left: 10, right: 10),
                              decoration: BoxDecoration( color: _selected_hour_index == index ? Colors.blue : Colors.white, borderRadius: BorderRadius.circular(35), border: Border.all(color: Colors.blue)),
                              child: Center(child: 
                                TextButton(
                                  onPressed: () => setState(() {_selected_hour_index = index;}),
                                  child:Text(
                                    aviable_hours[_selected_day_index][index], 
                                    style: _selected_hour_index == index ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)
                                  ),
                                )
                              ),
                            );
                          }
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 45,
                        width: 130,
                        decoration: box_decoration_small(),
                        child: Center(
                          child: TextButton(
                            onPressed: () => setState(() {
                              user.add_medical_date(Date(day: aviable_dates[_selected_day_index], hour: aviable_hours[_selected_day_index][_selected_hour_index], doctor: user.doctor, virtual : _is_cheked ? 'Virual' : 'Presencial'));
                            }),
                            child: const Text('Pedir cita', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                            )
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 105),
                        child: Row(children: [
                          Text('¿Cita virtual?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          Checkbox(value: _is_cheked, onChanged: (bool? value) {
                              setState(() {
                                _is_cheked = value!;
                              });},
                          ),
                        ],),
                      )
                    ]),
                  )
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  : 
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  ///  DISPLAY CAMBIAR
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                    height: 330, width: 200,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: aviable_doctors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 90,
                            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
                            decoration: box_decoration(),
                            child: Stack(children: [
                              const Positioned(left:10, top:15, child: Icon(Icons.account_circle, size: 60,)),
                              Positioned(left:80, top:10, child: Text('${aviable_doctors[index].name} ${aviable_doctors[index].surname}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                              Positioned(
                                left:80, top: 38, 
                                child: RatingBar.builder(
                                  initialRating: aviable_doctors[index].stars,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.blue),
                                  onRatingUpdate: (rating) {},
                                ),
                              ),
                              Positioned(left:80, top:56, child: Text(aviable_doctors[index].speciality, style: const TextStyle(fontSize: 18, color: Colors.black54),)),
                              Positioned(
                                left:220, top:36, 
                                child: Container(
                                  height: 40,
                                  width: 85,
                                  decoration: _selected_doctor_to_change == index ? box_decoration_small() : BoxDecoration( color:Colors.white, borderRadius: BorderRadius.circular(35), border: Border.all(color: Colors.blue)),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        _selected_doctor_to_change = index;
                                      }),
                                      child: Text(_selected_doctor_to_change == index ? 'solicitado' : 'Cambiar', style: TextStyle(color: _selected_doctor_to_change == index ? Colors.white : Colors.blue, fontSize: 15, fontWeight: FontWeight.bold))
                                      )
                                  )
                                ),
                              ),
                            ]),
                          );
                        }
                      )
                    ),
                  )           
                  /////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////
                ),
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 10, bottom: 0, right: 220), child: Text('Mi agenda', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold))),
        SizedBox(
          width: 400, height: 120,
          child: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: user.medical_dates.length,
              itemBuilder: (BuildContext context, int index) {
                // Contenedor con toda la información de las SocialNetwork cercanas al usuario
                return Container(
                  width: 280, height: 60,
                  margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                  decoration: box_decoration(),
                  child: Stack( children: [
                    Positioned(
                      left: 235, top: 10,
                      child: Icon(Icons.calendar_today)
                    ),
                    Positioned(
                      left: 15, top: 10,
                      child: Text('${user.medical_dates[index].day.substring(0,2)}/${user.medical_dates[index].day.substring(3,5)}/22  ·  ${user.medical_dates[index].virtual}', style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold))
                    ),
                    Positioned(
                      left: 15, top: 37 ,
                      child: Row(children: [
                        const Text('Hora:', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(' ${user.medical_dates[index].hour}', style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold))
                      ],)
                    ),
                    Positioned(
                      left: 15, top: 64 ,
                      child: Row(children: [
                        const Text('Doctor:', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(' ${user.medical_dates[index].doctor.name} ${user.medical_dates[index].doctor.surname}', style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold))
                      ],)
                    )
                  ],)
                );
              }
            ),
          ),
        ),  
      ],
    );
  }
}