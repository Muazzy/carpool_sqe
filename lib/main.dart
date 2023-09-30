import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carpool_app/view/sections/auth-screens/login_screen_mobile.dart';
import 'package:flutter_carpool_app/view/sections/auth-screens/login_screen_web.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFE0606, color),
      ),
      home: const GetPlatform(),
    );
  }
}

// Color idk = Color.fromRGB0(255, 254, 6 ,1);
// Color idk = Color.fromRGBO(254, 6, 6, 1);
Map<int, Color> color = const {
  50: Color.fromRGBO(254, 6, 6, .1),
  100: Color.fromRGBO(254, 6, 6, .2),
  200: Color.fromRGBO(254, 6, 6, .3),
  300: Color.fromRGBO(254, 6, 6, .4),
  400: Color.fromRGBO(254, 6, 6, .5),
  500: Color.fromRGBO(254, 6, 6, .6),
  600: Color.fromRGBO(254, 6, 6, .7),
  700: Color.fromRGBO(254, 6, 6, .8),
  800: Color.fromRGBO(254, 6, 6, .9),
  900: Color.fromRGBO(254, 6, 6, 1),
};

class GetPlatform extends StatelessWidget {
  const GetPlatform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? const LoginScreenWeb()
        : const LoginScreenMobile();
  }
}
