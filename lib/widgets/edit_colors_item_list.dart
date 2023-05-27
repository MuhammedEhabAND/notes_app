
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_notes_cubit/add_notes_cubit.dart';
import '../models/note_model.dart';
import 'color_item.dart';


class ColorListView extends StatefulWidget {
  const ColorListView({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel ;

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  @override
  late int currentIndex ;

  List<Color> noteItemColors = const [
    Colors.orangeAccent,
    Colors.redAccent,
    Color(0xffB4654A),
    Color(0xff77B28C),
    Color(0xffB84A62),
    Color(0xff3E92CC),
    Color(0xffC2C5BB),
  ];
@override
  void initState() {
    // TODO: implement initState
  currentIndex = noteItemColors.indexOf(Color(widget.noteModel.color));
  super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 30*2,
      child: ListView.builder(
        itemCount:noteItemColors.length ,
        itemBuilder: (context , index){
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: GestureDetector(
              onTap: (){
                currentIndex = index;
                widget.noteModel.color =  noteItemColors[index].value;
                setState(() {

                });
              },
              child: ColorItem(
                isSelected: currentIndex == index,
                color: noteItemColors[index],
              ),
            ),
          );
        }, scrollDirection: Axis.horizontal,),
    );
  }
}


