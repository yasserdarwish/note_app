import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              Navigator.of(context).pop();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              BlocProvider.of<NotesCubit>(context)
                  .showSnackBar(context, 'edited');
            },
            title: "Edit Note",
            icon: Icons.done,
          ),
          const SizedBox(height: 32),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note.content,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          EditNoteColorList(note: widget.note)
        ],
      ),
    );
  }
}
