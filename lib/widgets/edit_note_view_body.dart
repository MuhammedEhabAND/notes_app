import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(

          children:const [
          SizedBox(height: 32,),
          CustomTextField(hintText: 'Title',),
          SizedBox(height: 16),
          CustomTextField(hintText: 'content' , maxLines: 7,),
          SizedBox(height: 16,)
      ]),
    );
  }
}
