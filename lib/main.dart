import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_tracker/providers/auth_provider.dart';
import 'package:ticket_tracker/providers/ticket_provider.dart';
import 'package:ticket_tracker/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (BuildContext context) => AuthProvider(),),
            ChangeNotifierProvider(create: (BuildContext context) => TicketProvider(),),
          ],
          
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

