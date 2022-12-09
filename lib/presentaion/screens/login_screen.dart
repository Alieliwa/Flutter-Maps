import 'package:flutter/material.dart';
import 'package:googlemaps/presentaion/widgets/build_elevated_button.dart';
import 'package:googlemaps/presentaion/widgets/build_intro_text.dart';
import 'package:googlemaps/presentaion/widgets/build_text_from.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}


class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _phoneFormKey =  GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _phoneFormKey,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 88,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildIntroText(),
                  const SizedBox(
                    height: 110,
                  ),
                  BuildTextForm(),
                  const SizedBox(
                    height: 70,
                  ),
                  const BuildElevatedButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
