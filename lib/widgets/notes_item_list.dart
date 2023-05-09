
import 'dart:math';

import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesItemList extends StatelessWidget {
  const NotesItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Color> list= [];
    for(int i =0 ; i<10 ; i++){
      list.add(NoteItemColor());
    }
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context , index){
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child:  NoteItem(color: list[index]),
        );
      }),
    );
  }
}
Color NoteItemColor(){
  final Random random = Random();
  Color randomColor;
  do {
    randomColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  } while (randomColor.computeLuminance() < 0.4);
  return randomColor;
}


