import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/widgets/custom_button.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),

          child: BlocConsumer<AddNotesCubit, AddNotesState>(
            listener: (context, state) {
              if(state is AddNotesFailure){
                print('failed ${state.errMsg}');
              }
              if(state is AddNotesSuccess){
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                  absorbing: state is AddNotesLoading ? true :false,
                  child: Padding(
                    padding:  EdgeInsets.only(right: 16 , left: 16 ,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const SingleChildScrollView(child:  AddNoteForm()),
                  ));
            },
          ),

      ),
    );
  }
}