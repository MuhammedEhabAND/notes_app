
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_notes_cubit/add_notes_cubit.dart';
import 'color_item.dart';


class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  @override
  int currentIndex = 0;
  List<Color> noteItemColors = const [
    Colors.orangeAccent,
    Colors.redAccent,
    Color(0xffB4654A),
    Color(0xff77B28C),
    Color(0xffB84A62),
    Color(0xff3E92CC),
    Color(0xffC2C5BB),
  ];


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
                BlocProvider.of<AddNotesCubit>(context).color = noteItemColors[index];
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


