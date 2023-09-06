import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.isLoading = false});
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kPrimaryColor,
      height: 55,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: Center(
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ))
            : const Text(
                "Add",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
      ),
    );
  }
}
