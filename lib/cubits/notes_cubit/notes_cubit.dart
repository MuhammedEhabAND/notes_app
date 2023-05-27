import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';
class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notes = [];

  void fetchAllNotes([String? searchText]) async {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);

    if (searchText == null || searchText.isEmpty) {
      notes = notesBox.values.toList();
    } else {
      List<NoteModel> allNotes = notesBox.values.toList();
      notes = allNotes.where((note) =>
      note.title.toLowerCase().contains(searchText.toLowerCase()) ||
          note.body.toLowerCase().contains(searchText.toLowerCase())).toList();
    }

    emit(NotesSuccess());
  }
}
