import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/note_item.dart';
import '../widgets/notes_item_list.dart';
import '../widgets/notes_view_body.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}): super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  String searchText = '';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          backgroundColor: kPrimaryWallpaperColor,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
            context: context,
            builder: (context){
          return const AddNoteBottomSheet();
        });
      },child:const Icon(Icons.add),),

      body:const  NotesViewBody()
    );
  }
}