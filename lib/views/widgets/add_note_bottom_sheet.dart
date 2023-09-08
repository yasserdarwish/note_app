import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  action: SnackBarAction(label: 'Dismiss', onPressed: () {}),
                  width: 330,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: const Color(0xff2e383e),
                  content: const Text(
                    'Note added successfully',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )));
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
                absorbing: state is AddNoteLoading ? true : false,
                child: const SingleChildScrollView(child: AddNoteForm()));
          },
        ),
      ),
    );
  }
}
