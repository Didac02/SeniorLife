import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seriorlife/box_decoration.dart';
import 'package:seriorlife/data_base.dart';

class SpecificDoctor extends StatefulWidget {
  const SpecificDoctor({super.key});

  @override
  State<SpecificDoctor> createState() => _SpecificDoctorState();
}

class _SpecificDoctorState extends State<SpecificDoctor> {
  @override
  Widget build(BuildContext context) {
    return Column( children: [
      SizedBox(
        height: 340, width: 400,
        child: Stack(children: [
          Positioned(
            left: 10, top: 30, 
            child: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 30,), onPressed: () => Navigator.pop(context, true),)
          ),
          const Positioned(left: 25, top: 60, child: Icon(Icons.account_circle_rounded, size: 160, color: Colors.grey)),
          Positioned(
            left: 185, top: 100,
            child: RichText(
              text: TextSpan(children: [
                  TextSpan(text: user.doctor.name, style: const TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' ${user.doctor.surname}', style: const TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold)),  
              ])
            )
          ),
          Positioned( left: 185, top: 130, child: RichText( text: TextSpan(text: '${user.doctor.speciality}', style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold))),),
          Positioned( left: 185, top: 160, child: RichText( text: TextSpan(text: '${user.doctor.hospital}', style: const TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold))),),
          Positioned(
            left: 20, top: 230,
            child: Row(children: [
            Container(
              height: 50, width: 170,
              decoration: box_decoration_small(),
              child: Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Row(children: [
                  RichText(text: const TextSpan(text: 'Enviar correo ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))), 
                  const Icon(Icons.mail, size: 20, color: Colors.white,)
                ],),
              ),
            )
          ]),),
          Positioned(
            left: 200, top: 230,
            child: Row(children: [
            Container(
              height: 50, width: 170,
              decoration: box_decoration_small(),
              child: Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(children: [
                  RichText(text: const TextSpan(text: 'Enviar mensaje ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))), 
                  const Icon(Icons.message, size: 20, color: Colors.white,)
                ],),
              ),
            )
          ]),),
          Positioned(
            left: 110, top: 290,
            child: Row(children: [
            Container(
              height: 50, width: 170,
              decoration: box_decoration_small(),
              child: Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Row(children: [
                  RichText(text: const TextSpan(text: 'Valorar ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))), 
                  const Icon(Icons.rate_review, size: 20, color: Colors.white,)
                ],),
              ),
            )
          ]),)
        ]),
      ),
      Padding(padding: const EdgeInsets.only(top: 30, bottom: 0, right: 170), child: RichText(text: const TextSpan(text: 'Valoraciones ', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold))),),
      SizedBox(height: 400, width: 400,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: global_reviews.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 160, width: 110,
              margin: const EdgeInsets.all(10),
              decoration: box_decoration(),
              child: Stack(children: [
                Positioned( left: 10, top: 15, child: RichText( text: TextSpan(text: global_reviews[index].complete_name, style: const TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold))),),
                Positioned( left: 250, top: 18, child: RatingBar.builder(
                  initialRating: global_reviews[index].stars,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 16,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.blue),
                  maxRating: 5,
                  onRatingUpdate: (rating) {},
                ),),
                Positioned( left: 15, top: 50, child: Container(
                width: 340,
                  child: RichText( text : TextSpan(children: [ 
                    const TextSpan(text: 'Valoración: ', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: global_reviews[index].description, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold))  
                  ]),),
                ),),

              ],)
            );
          }
        ),
      )
    ],);
  }
}