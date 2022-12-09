import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlemaps/app_router.dart';
import 'package:googlemaps/constans/strings.dart';

 String initialRoute  = loginScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: widget.appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
