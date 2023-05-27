import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';

class NotesItemList extends StatelessWidget {
  NotesItemList({Key? key, required this.notes,}) : super(key: key);
  final List<NoteModel> notes;
  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notes.length ,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: NoteItem(
                    note: notes![index],
                  ),
                );
              }),
        );
     }
}

Color NoteItemColor() {
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


