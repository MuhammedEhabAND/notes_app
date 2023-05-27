import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/edit_colors_item_list.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView( {Key? key, required this.note}) : super(key: key);
  final NoteModel note ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:
              EditNoteViewBody(note: note,),

    );
  }
}

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title ,subTitle ;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(

          children: [
            Padding(

              padding: const EdgeInsets.only(top: 35.0 ,right: 10 , left: 10 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Edit Note' , style: TextStyle(fontSize: 20),),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(onPressed: (){
                        widget.note.title  = title ?? widget.note.title ;
                        widget.note.body  = subTitle ?? widget.note.body ;
                        widget.note.save();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);

                      }, icon: Icon(Icons.done))),
                ],
              ),
            ),

            const SizedBox(height: 32,),
            CustomTextField(
              textEditingController: textEditingController,

              onChanged: (value){
                title = value;
              },
              hintText: widget.note.title ,),
            const SizedBox(height: 16),
            CustomTextField(
              onChanged: (value){subTitle = value;},
              hintText: widget.note.body , maxLines: 7,),
            const SizedBox(height: 16,),
            ColorListView(noteModel: widget.note)
          ]),
    );
  }
}
