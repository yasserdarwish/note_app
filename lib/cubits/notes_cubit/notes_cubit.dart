import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    emit(NotesSuccess());
  }

  showSnackBar(BuildContext context, String word) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(label: 'Dismiss', onPressed: () {}),
        width: 330,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xff2e383e),
        content: Text(
          'Note $word successfully',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )));
  }
}
