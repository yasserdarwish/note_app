import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hint: "Title",
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: "Content",
              maxLines: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}
