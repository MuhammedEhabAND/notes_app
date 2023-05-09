import 'package:flutter/material.dart';

import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/note_item.dart';
import '../widgets/notes_item_list.dart';
import '../widgets/notes_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black.withOpacity(0.0),
        elevation: 0,
        title: Padding(
          
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Notes'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Container(

              decoration: BoxDecoration(

              color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // do something when the search icon is pressed
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
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
