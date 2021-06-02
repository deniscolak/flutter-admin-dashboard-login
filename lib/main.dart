import 'package:flutter/material.dart';
import 'package:smart_dashboard_admin_ui/core/constants/color_constants.dart';
import 'package:smart_dashboard_admin_ui/screens/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dashboard - Admin Panel ',
      theme: ThemeData.dark().copyWith(
        appBarTheme:
            AppBarTheme(backgroundColor: kBackgroundColor, elevation: 0),
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.green,
        dialogBackgroundColor: kSecondaryColor,
        buttonColor: Colors.green,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: kSecondaryColor,
      ),
      home: LoginScreen(),
    );
  }
}
