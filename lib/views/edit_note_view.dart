import 'package:flutter/material.dart';

import '../widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.0),
        elevation: 0,
        title: const Padding(

          padding:  EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Edit Note'),
        ),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Container(

              decoration: BoxDecoration(

                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: Icon(Icons.done),
                onPressed: () {
                  // do something when the search icon is pressed
                },
              ),
            ),
          ),
        ],
      ),

      body: EditNoteViewBody(),
    );
  }
}
