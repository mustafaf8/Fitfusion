import 'package:flutter/material.dart';
import 'package:flutter_gym/view/on_bording/started_veiw.dart';
import 'common/color_extension.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gym x',
      theme:
          ThemeData(primaryColor: TColor.primryColor1, fontFamily: "Poppins"),
      home: const StartedView(),
    );
  }
}
