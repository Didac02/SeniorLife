// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Class/Donation.dart';
import 'package:seriorlife/box_decoration.dart';
import 'package:seriorlife/data_base.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}
final List<String> _accounts = user.bank_acounts;
final List<int> _amounts = <int>[1,2,5,10,15,20,30,50,100,150,200];
int _account_index = 0;
int _amount_index = 0;
String _actual_day = '12/12/22';
String _actual_hour = '18:36';
int _index = 0;

class _UsersState extends State<Users> {

  _update_account() {
    setState(() {
      if (_account_index < _accounts.length - 1) {
        _account_index ++;
      } else { _account_index = 0; }
    });
  }

  _update_amount() {
    setState(() {
      if (_amount_index < _amounts.length - 1) {
        _amount_index ++;
      } else { _amount_index = 0; }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 320, width: 400,
            child: Stack(children: [
              Positioned(
                left: 10, top: 30, 
                child: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 30,), onPressed: () => Navigator.pop(context, true),)
              ),
              const Positioned(left: 65, child: Icon(Icons.account_circle_rounded, size: 260, color: Colors.grey)),
              Positioned(
                left: 65, top: 250,
                child: RichText(
                  text: TextSpan(children: [
                      TextSpan(text: user.name, style: const TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold)),
                      TextSpan(text: ' ${user.surname} ${user.second_surname}', style: const TextStyle(color: Colors.black54, fontSize: 26, fontWeight: FontWeight.bold)),  
                  ])
                )
              ),
              Positioned(
                left: 80, top: 290,
                child: RichText( 
                  text: TextSpan(children: [
                      TextSpan(text: '${user.age} Años', style: const TextStyle(color: Colors.blue, fontSize: 26, fontWeight: FontWeight.bold)),
                      const TextSpan(text: ' · ', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                      TextSpan(text: user.residency, style: const TextStyle(color: Colors.black45, fontSize: 26, fontWeight: FontWeight.bold)),  
                  ])
                ),
              ),
            ]),
          ),
          Container(
            height: 493,width: 400,
            margin: EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
            child: Column(
              children: [
                Container(
                  height: 45, width: 302,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(35), border: Border.all(color: Colors.blue)),
                  child: Row(children: [
                    Container(
                      height: 35, width: 90,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: _index == 0 ? box_decoration_small() : null,
                      child: TextButton(
                        onPressed:  () => setState(() {_index = 0;}), 
                        child: Text('Hobbys', style: TextStyle(color: _index == 0 ?Colors.white : Colors.blue, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Container(
                      height: 35, width: 90,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: _index == 1 ? box_decoration_small() : null,
                      child: TextButton(
                        onPressed:  () => setState(() {_index = 1;}), 
                        child: Text('Familia', style: TextStyle(color: _index == 1 ?Colors.white : Colors.blue, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Container(
                      height: 35, width: 90,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: _index == 2 ? box_decoration_small() : null,
                      child: TextButton(
                        onPressed:  () => setState(() {_index = 2;}), 
                        child: Text('Donaciones', style: TextStyle(color: _index == 2 ?Colors.white : Colors.blue, fontWeight: FontWeight.bold),)
                      ),
                    ),
                  ],)
                ),
              SizedBox(
                height: 428,
                child: 
                ////////////////////////////////////////////////////////////////////////////////////////
                /// DISPLAY HOBBYS
                ////////////////////////////////////////////////////////////////////////////////////////
                _index == 0 ? Column( children: [
                  Padding( 
                    padding: const EdgeInsets.only(right: 210, top: 20), 
                    child: RichText(text: const TextSpan(text: 'Hobbys', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold)))
                  ),
                  SizedBox(height: 375,
                    child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 50
                      ),
                      itemCount: global_hobbies.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: global_hobbies[index].selected ? box_decoration_small() : BoxDecoration( borderRadius: BorderRadius.circular(35), border: Border.all(color: Colors.blue)),
                          child: TextButton(
                            onPressed: () => setState(() {global_hobbies[index].selected ? global_hobbies[index].selected = false : global_hobbies[index].selected = true;}),
                            child: RichText(text: TextSpan(text: global_hobbies[index].name, style: TextStyle(color: global_hobbies[index].selected ? Colors.white : Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),)
                          )
                        );
                      }
                    ),
                  ),
                  )
                ],) 
                ////////////////////////////////////////////////////////////////////////////////////////
                /// DISPLAY FAMILIARES
                ////////////////////////////////////////////////////////////////////////////////////////
                : _index == 1 ? Column( children: [
                  Padding( 
                    padding: const EdgeInsets.only(right: 175, top: 20), 
                    child: RichText(text: const TextSpan(text: 'Familiares', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold)))
                  ),
                  SizedBox(height: 375,
                    child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: user.family.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Contenedor con toda la información de las SocialNetwork cercanas al usuario
                        return Container(
                          height: 100, width: 140,
                          margin: const EdgeInsets.all(10),
                          decoration: box_decoration(),
                          child: Stack(children: [
                            const Positioned(left:15, top:20, child: Icon(Icons.account_circle, size: 60,)),
                            Positioned(left:85, top:20, child: Row(children: [
                              RichText(text: TextSpan(text: user.family[index].name, style: const TextStyle(color:Colors.black87, fontSize : 20, fontWeight: FontWeight.bold))),
                              RichText(text: TextSpan(text: ' ${user.family[index].surname} ${user.family[index].second_surname}', style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold))),
                            ],)),
                            Positioned(left:90, top:50, child: Container(height:30, width:70, decoration: box_decoration_small(), child: Center(child: RichText(text: TextSpan(text: user.family[index].kinship, style: const TextStyle(color:Colors.white, fontSize : 16, fontWeight: FontWeight.bold)))),)),
                            
                          ],)
                        );
                      }
                    ),
                  ),
                  )
                ],) 
                ////////////////////////////////////////////////////////////////////////////////////////
                /// DISPLAY DONACIONES
                ////////////////////////////////////////////////////////////////////////////////////////
                : Column(children: [
                  Padding( 
                    padding: const EdgeInsets.only(right: 160, top: 20), 
                    child: RichText(text: const TextSpan(text: 'Donaciones', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold)))
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 62, top: 15),
                    child: Row(children: [
                      Container(
                        height: 35, width: 180,
                        decoration: box_decoration_button(),
                        child: Center(child: TextButton(onPressed: () => _update_account(), child: Text(_accounts[_account_index], style: const TextStyle(color: Colors.white, fontSize: 16)),)),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: 35, width: 60,
                        decoration: box_decoration_button(),
                        child: Center(child: TextButton(onPressed: () => _update_amount(), child: Text('${_amounts[_amount_index]}€', style: const TextStyle(color: Colors.white, fontSize: 16),),)),
                      ),
                    ],),
                  ),
                  Container(
                    height: 50, width: 160,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: TextButton(onPressed: () => setState(() {
                        user.add_donation(Donation(account: _accounts[_account_index], day: _actual_day, hour: _actual_hour, amount: _amounts[_amount_index], payed: false));
                        }),
                        child: const Text('Hacer donación', style: TextStyle(color: Colors.white, fontSize: 20))
                    )),
                  ),
                  SizedBox(
                    height: 245,
                    child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: user.donations.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Contenedor con toda la información de las SocialNetwork cercanas al usuario
                      return Container(
                        height: 100, width: 90,
                        margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        decoration: box_decoration(),
                        child: Stack(children: [
                          Positioned(left:15, top:10, child: Row(children: [
                            RichText(text: TextSpan(text: '${user.donations[index].amount}€ · ', style: const TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold))),
                            RichText(text: TextSpan(text: user.donations[index].payed ? 'Hecho' : 'Pendiente', style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)))
                          ],)),
                          Positioned(left:15, top:45, child: RichText(text: TextSpan(text: user.donations[index].account, style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)))),
                          Positioned(left:15, top:70, child: Row(children: [
                            RichText(text: TextSpan(text: '${user.donations[index].day} · ', style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold))),
                            RichText(text: TextSpan(text: user.donations[index].hour, style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold)))
                          ],)),
                          Positioned(
                            left: 270, top: 25,
                            child: IconButton(
                              icon: user.donations[index].payed ? const Icon(null) : const Icon(Icons.cancel, color: Colors.redAccent, size: 40,), 
                              onPressed: () => setState(() { user.remove_donation(index); })
                            ),
                          )
                        ],)
                      );
                    }),
                  ),
                ],)
              ),],
            )
          ),
        ],
      ),
    );
  }
}