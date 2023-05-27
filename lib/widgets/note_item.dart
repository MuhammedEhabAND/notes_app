
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {


    return  Dismissible(
      key: Key(note.title),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red
        ),

        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child:const Icon(Icons.delete, color: Colors.white,),
      ),
        onDismissed: (direction) {
          final NoteModel deletedNote = note;
          note.delete();

          // Show a snackbar with an undo button
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Note deleted'),
              
            ),
          );

          // Fetch all the notes after a short delay (optional)
          Future.delayed(Duration(milliseconds: 300), () {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          });
        },
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){

            return EditNoteView(note: note);
          }));
        },
        child: Container(
          padding: const EdgeInsets.only(top: 24 , bottom: 24 , left: 16),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(16),
            color:Color(note.color),


          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end

            ,
            children: [
              ListTile(
                title:  Text(  note.title ,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16 , bottom: 16),
                  child: Text(note.body ,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                      )),
                ),
                trailing: IconButton(
                  onPressed: (){
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                  },
                  icon:const  Icon(Icons.delete , color: Colors.black, size: 24,),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(note.date, style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16,
                ),),
              )
            ],
          ),
        ),
      ),
    );

  }
}