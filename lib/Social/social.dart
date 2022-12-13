// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/box_decoration.dart';
import 'package:seriorlife/Social/specific_friend.dart';
import 'package:seriorlife/data_base.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  //
  _get_color(value){
    if (value <= 35) {return const Color.fromARGB(255, 211, 82, 73);}
    else if (value <= 50 ) {return const Color.fromARGB(255, 255, 126, 83);}
    else if (value <= 70 ) {return const Color.fromARGB(255, 255, 183, 83);}
    else {return const Color.fromARGB(255, 43, 196, 117);} 
  }

  _get_requests() async {
    setState(() {});
  }

  _update_social_network(index) {
      setState(() {
        if (global_social_networks[index].is_member == true) {
          global_social_networks[index].is_member = false;
        } else { global_social_networks[index].is_member = true; }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Titulo 1
        const Padding(
          padding: EdgeInsets.only(right: 205, bottom: 5),
          child: Text('Tu alrededor', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        // ListView horizontal que muestra las personas cerca del usuario
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: global_friends.length,
            itemBuilder: (BuildContext context, int index) {
              // Contenedor con toda la información de la persona cercana al usuario
              return Container(
                width: 120,
                margin: const EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 10),
                // Decoracion del Container donde va a ir toda la informacion de cada posible nuevo amigo para el usuario
                decoration: box_decoration(),
                // Botón en forma de toda la información mas importante del posible amigo
                child: TextButton(
                  // Navegación a pagina especifica de usuario cuando se pulsa el botón
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute( builder: (_) => SpecificFriend(user: user, friend: global_friends[index], global_friends: global_friends, index: index)),
                    ).then((val)=>val?_get_requests():null);
                  }, 
                  child: Column(children: [
                    const Icon(Icons.account_circle_rounded, size: 80, color: Colors.grey),
                    Text(global_friends[index].name, style: const TextStyle(color: Colors.black87),),
                    Text(global_friends[index].surname, style: const TextStyle(color: Colors.black87),),
                    const SizedBox(height: 10,),
                    Center(child:Text('${global_friends[index].similar}%',  style: TextStyle(fontSize: 17, color: _get_color(global_friends[index].similar)))),
                  ],)
                ),
              );
            }
          )
        ),
        // ListView horizontal que muestra las SocialNetworks cerca del usuario
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: global_social_networks.length,
            itemBuilder: (BuildContext context, int index) {
              // Contenedor con toda la información de las SocialNetwork cercanas al usuario
              return Container(
                width: 200,
                margin: const EdgeInsets.only(top:5, bottom: 18, left: 10, right: 10),
                // Decoracion del Container donde va a ir toda la informacion de cada SocialNetwork
                decoration: box_decoration(),
                // Botón en forma de toda la información mas importante de la posible SocialNetwork
                child: Stack(children: [
                  const Positioned(left: 10, top: 5, child: Icon(Icons.account_circle_rounded, size: 40)),
                  Positioned(left: 60, top: 15, child: Text(global_social_networks[index].name, style: const TextStyle(color: Colors.black87, fontSize: 18))),
                  Positioned(left: (global_social_networks[index].people > 10) ? 70 : 80, top: 42, child: Text('${global_social_networks[index].people}', style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold))),
                  const Positioned(left: 100, top: 41, child: Text('|', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold))),
                  Positioned(left: 115, top: 42, child: Text('${global_social_networks[index].similar}%', style: TextStyle(color: _get_color(global_social_networks[index].similar), fontSize: 18, fontWeight: FontWeight.bold))),
                  Positioned(
                    left: 50, top: 72, 
                    child: Container(
                      height: 33,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                        color: global_social_networks[index].is_member ? Colors.blue : Colors.white,
                      ),
                      child: TextButton(
                        onPressed: () => _update_social_network(index), 
                        child: global_social_networks[index].is_member ? const Text('MIEMBRO', style: TextStyle(color: Colors.white)) : const Text('UNIRSE', style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                  ),
                ],) 
              );
            }
          )
        ),
        Container(
          height: 365,
          decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(right: 175, top: 15, bottom: 8),
                child: Text('Tus amigos', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold)),
              ),
              // ListView vertical que muestra los chats de los amigos del usuario
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: user.friends.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 70,
                      margin: const EdgeInsets.only(bottom: 14, left: 5, right: 5),
                      decoration: box_decoration(),
                      child: Stack(children: [
                        Positioned(
                          left: 5, top: 0, 
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute( builder: (_) => SpecificFriend(user: user, friend: user.friends[index], global_friends: global_friends, index: index)),
                              ).then((val)=>val?_get_requests():null);
                            },
                            icon: const Icon(Icons.account_circle_rounded, size: 50, color: Colors.grey),
                          )
                        ),
                        Positioned(left: 75, top: 12, child: Text('${user.friends[index].name} ${user.friends[index].surname}', style: const TextStyle(color: Colors.black87, fontSize: 18),)),
                        const Positioned(left: 75, top: 36, child: Text('Ultimo mensaje...', style: TextStyle(color: Colors.black38, fontSize: 18),)),
                        Positioned(left: 315, top: 10, child: user.friends[index].last_message.is_readed ? const Icon(Icons.mark_chat_read) : const Icon(Icons.mark_chat_unread)),
                        Positioned(left: 308, top: 40, child: Text(user.friends[index].last_message.time, style: const TextStyle(color: Colors.black54, fontSize: 16),)),
                      ],)
                    );
                  }
                )
              ),
          ]),
        ),        
      ],
    );
  }
}