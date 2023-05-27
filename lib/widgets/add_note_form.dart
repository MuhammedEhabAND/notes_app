import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'color_item.dart';
import 'color_items_list.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved: (value) {
              title = value!;
            },
            hintText: 'Title',
          ),
          SizedBox(height: 16),
          CustomTextField(

            onSaved: (value) {
              subTitle = value!;
            },
            hintText: 'content', maxLines: 7,),
          const SizedBox(height: 16,),
          const ColorListView(),
          const SizedBox(height: 16,),

          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {

              String formattedDate = DateFormat.yMMMEd().format(DateTime.now());

              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    NoteModel note = NoteModel(title: title!,
                        body: subTitle!,
                        date: formattedDate!,
                        color:1 );
                    BlocProvider.of<AddNotesCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },
              );
            },
          )
        ],

      ),
    );
  }
}