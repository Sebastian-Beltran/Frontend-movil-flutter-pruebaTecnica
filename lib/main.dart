import 'package:flutter/material.dart';
import 'package:frontendapp/src/pages/create_user_page.dart';
import 'package:frontendapp/src/pages/edit_user_page.dart';
import 'package:frontendapp/src/pages/user_page.dart';
import 'package:frontendapp/src/pages/users_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          // scaffoldBackgroundColor: Colors.deepPurple,
           primaryColor: Colors.indigo,
          secondaryHeaderColor: Colors.deepPurple,
          appBarTheme: AppBarTheme(color: Colors.deepPurple)
        ).copyWith(
            inputDecorationTheme:
                InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)))),
        title: 'Prueba Tecnica',
        initialRoute: 'users',
        routes: {
          'users'               : (BuildContext context) => UsersPage(),
          'create_user'         : (BuildContext context) => CreateUser(),
          'edit_user'           : (BuildContext context) => EditUser(),
          'user'                : (BuildContext context) => UserPage(),

        },
    );
    
    
  }
}