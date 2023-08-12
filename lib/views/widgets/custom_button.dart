import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kPrimaryColor,
      height: 55,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {},
      child: Center(
        child: Text(
          "Add",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
