import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../models/note_model.dart';
import 'note_item.dart';
import 'notes_item_list.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  void fetchNotes() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              Padding(
                  padding: const EdgeInsets.only(
                      top: 36.0, left: 10, right: 10),
                  child: isSearching ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {
                          isSearching = false;
                          searchText = '';
                          fetchNotes();
                        }, icon: Icon(Icons.arrow_back)),
                        Flexible(
                          child: TextField(
                              autofocus: true,
                              onChanged: (value) {
                                searchText = value;
                                fetchNotes();
                              },
                              onSubmitted: (value) {
                                searchText = value;
                                fetchNotes();
                                isSearching = false;
                              },
                              decoration: InputDecoration(
                                hintText: 'Search...', border: InputBorder.none,
                              )),
                        )
                      ]) : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Note', style: TextStyle(fontSize: 20),),
                      IconButton(onPressed: () {
                        isSearching = true;
                        setState(() {

                        });
                      }, icon: Icon(Icons.search)),
                    ],
                  )

              ),


              Expanded(child: NotesItemList(notes: notes,),)
              ,


            ],

          ),
        );
      },
    );
  }
}
