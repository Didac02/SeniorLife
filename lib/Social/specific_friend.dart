// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seriorlife/Class/Friend.dart';
import 'package:seriorlife/Class/User.dart';
import 'package:seriorlife/data_base.dart';

import '../box_decoration.dart';

class SpecificFriend extends StatefulWidget {
  const SpecificFriend({super.key, required this.user, required this.friend, required this.global_friends, required this.index});
  
  final User user;
  final Friend friend;
  final List<Friend> global_friends;
  final int index;
  
  @override
  State<SpecificFriend> createState() => _SpecificFriendState();
}

class _SpecificFriendState extends State<SpecificFriend> {

  void action(){
    if (widget.friend.is_friend) {
      deleteItemFromList();
    } else { addItemToList();}
    setState(() {
      if (widget.friend.is_friend) {
      widget.friend.is_friend = false;
      } else { widget.friend.is_friend = true;}
    });
  }

  void deleteItemFromList(){
    setState(() {
      widget.user.remove_friend(widget.index);
      global_friends.add(widget.friend);
    });
  }

  void addItemToList(){
    setState(() {
      widget.user.add_friend(widget.friend);
      global_friends.removeAt(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 250,
          child: Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 10, top: 30, 
                  child: IconButton(icon: Icon(Icons.arrow_back_ios_new, size: 30,), onPressed: () => Navigator.pop(context, true),)
                ),
                const Positioned(left: 65, child: Icon(Icons.account_circle_rounded, size: 260, color: Colors.grey)),
              ],
            ),
          ),
        ),
        Container(
          height: 105,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          child: Column(
              children: [
                RichText(text:TextSpan(text: widget.friend.name, style: TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold))),
                RichText(text:TextSpan(text: '${widget.friend.surname} ${widget.friend.second_surname}', style: TextStyle(color: Colors.black87, fontSize: 28))),
                RichText(text:TextSpan(text: '${widget.friend.age} Años', style: TextStyle(color: Colors.black54, fontSize: 28)))
              ])
        ),
        Padding(
          padding: EdgeInsets.only(left: 70, top: 10, bottom: 25),
          child: Row(
            children: [
              Column(children:[
                Icon(Icons.person_pin_circle, size: 45,), 
                RichText(text: TextSpan(text: '${widget.friend.distance} Km', style: TextStyle(color: Colors.black87, fontSize: 20))),
              ]),
              SizedBox(width: 60,),
              Column(children:[
                Icon(Icons.verified, size: 45,), 
                RichText(text: TextSpan(text: '${widget.friend.similar}%', style: TextStyle(color: Colors.black87, fontSize: 20))),
              ]),
              SizedBox(width: 60,),
              Column(children:[
                Icon(Icons.groups, size: 45,), 
                RichText(text: TextSpan(text: '${widget.friend.distance}', style: TextStyle(color: Colors.black87, fontSize: 20))),
              ])
            ],
          ),
        ),
        RichText( text: TextSpan(text: 'Hobbies', style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold))),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 50
              ),
              itemCount: widget.friend.hobbies.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: box_decoration_small(),
                  child: RichText(text: TextSpan(text: widget.friend.hobbies[index], style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                  )
                );
              }
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 36),
          child: Container(
            height: 60,
            width: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: widget.friend.is_friend ? Border.all(color: Colors.white) : Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(45),
              color: widget.friend.is_friend ? Colors.blue : Colors.white,
            ),
            child: TextButton(
              onPressed: () => action(), 
              child: widget.friend.is_friend ? const Text('QUITAR AMIGO', style: TextStyle(color: Colors.white, fontSize: 18)) : const Text('AÑADIR AMIGO', style: TextStyle(color: Colors.blue, fontSize: 18)),
            ),
          ),
        ),
      ]
    );
  }
}