import 'package:flutter/material.dart';
class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: (){},
        child: const Text('Next',style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          )
        ),
      ),
    );
  }
}
