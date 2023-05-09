
import 'package:flutter/material.dart';

import 'notes_item_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:  Column(
        children: const [

          Expanded(child:  NotesItemList(),),
        ],

      ),
    );
  }
}